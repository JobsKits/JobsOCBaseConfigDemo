//
//  JobsBluetoothStabilityTests.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsBluetoothStabilityTests.h"
#import "JobsBluetoothWriteFixture.h"

// 声明生产 delegate 入口；只替换外设 IO，不实现第二套命令调度逻辑。
@interface JobsBluetoothManager (JobsBluetoothNativeDelegateStabilityAccess)
-(void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;
-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error;
@end

@implementation JobsBluetoothStabilityTests

-(JobsBluetoothManager *)mockManager{
    // 分配后注入必要状态，避开 CBCentralManager 初始化与真实设备权限。
    JobsBluetoothManager *manager = [JobsBluetoothManager alloc];
    [manager setValue:[NSMutableArray array] forKey:@"commandQueue"];
    [manager setValue:@(JobsBluetoothStateReady) forKey:@"state"];
    [manager setValue:dispatch_get_main_queue() forKey:@"callbackQueue"];
    JobsBluetoothMockTransport *transport = [JobsBluetoothMockTransport new];
    transport.enabled = YES;
    [manager setValue:transport forKey:@"mockTransport"];
    [manager setValue:[JobsBluetoothProfile new] forKey:@"profile"];
    return manager;
}

-(void)testMatcherTimeoutAndCancellationCompleteOnce{
    JobsBluetoothManager *manager = [self mockManager];
    XCTestExpectation *timedOut = [self expectationWithDescription:@"unmatched response times out"];
    JobsBluetoothCommand *command = JobsBluetoothCommand.new
        .byPayload([@"command" dataUsingEncoding:NSUTF8StringEncoding])
        .byTimeout(0.01)
        .byResponseMatcher(^BOOL(NSData *data) { return NO; });
    __block NSUInteger calls = 0;
    [manager sendCommand:command completion:^(NSData *response, NSError *error) {
        calls += 1;
        XCTAssertEqual(error.code, JobsBluetoothErrorCommandTimeout);
        [timedOut fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[timedOut] timeout:1], XCTWaiterResultCompleted);
    XCTAssertEqual(calls, 1);
    XCTestExpectation *cancelled = [self expectationWithDescription:@"disconnect cancels command"];
    command = JobsBluetoothCommand.new.byPayload([@"next" dataUsingEncoding:NSUTF8StringEncoding]).byTimeout(1);
    [manager sendCommand:command completion:^(NSData *response, NSError *error) {
        XCTAssertEqual(error.code, JobsBluetoothErrorCancelled);
        [cancelled fulfill];
    }];
    dispatch_async(dispatch_get_main_queue(), ^{
        manager.disconnect();
    });
    XCTAssertEqual([XCTWaiter waitForExpectations:@[cancelled] timeout:1], XCTWaiterResultCompleted);
}

-(void)onMain:(dispatch_block_t)action{
    if (NSThread.isMainThread) {
        action();
    } else {
        dispatch_sync(dispatch_get_main_queue(), action);
    }
}

-(CBMutableCharacteristic *)writeCharacteristic{
    return [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:@"FFF1"]
                                             properties:CBCharacteristicPropertyWrite
                                                  value:nil
                                            permissions:CBAttributePermissionsWriteable];
}

-(void)configureManager:(JobsBluetoothManager *)manager withWriteFixture:(JobsBluetoothWriteFixture *)fixture characteristic:(CBCharacteristic *)characteristic{
    manager.mockTransport.enabled = NO;
    [manager setValue:fixture forKey:@"connectedPeripheral"];
    [manager setValue:characteristic forKey:@"writeCharacteristic"];
}

-(void)testFirstMockConnectionClearsOldCharacteristicsAndCancelsOnce{
    JobsBluetoothManager *manager = [self mockManager];
    CBMutableCharacteristic *characteristic = [self writeCharacteristic];
    [manager setValue:characteristic forKey:@"writeCharacteristic"];
    [manager setValue:characteristic forKey:@"notifyCharacteristic"];
    [manager setValue:characteristic forKey:@"readCharacteristic"];
    XCTestExpectation *cancelled = [self expectationWithDescription:@"first connection cancels old command"];
    __block NSUInteger calls = 0;
    void (^completion)(NSData *, NSError *) = ^(NSData *data, NSError *error) {
        calls += 1;
        XCTAssertEqual(error.code, JobsBluetoothErrorCancelled);
        [cancelled fulfill];
    };
    [manager setValue:[@{@"completion": [completion copy]} mutableCopy] forKey:@"activeCommand"];
    // connectedPeripheral 为 nil，真实公共入口不能执行 nil delegate DSL Block。
    manager.connectIdentifier(NSUUID.UUID);
    XCTAssertEqual([XCTWaiter waitForExpectations:@[cancelled] timeout:5], XCTWaiterResultCompleted);
    XCTAssertEqual(calls, 1);
    XCTAssertEqual(manager.state, JobsBluetoothStateReady);
    XCTAssertNil([manager valueForKey:@"activeCommand"]);
    XCTAssertNil([manager valueForKey:@"writeCharacteristic"]);
    XCTAssertNil([manager valueForKey:@"notifyCharacteristic"]);
    XCTAssertNil([manager valueForKey:@"readCharacteristic"]);
    XCTAssertEqual([[manager valueForKey:@"connectionGeneration"] unsignedIntegerValue], 1);
}

-(void)testACKErrorPropagatesOnceAndOldPeripheralACKCannotAdvance{
    JobsBluetoothManager *manager = [self mockManager];
    JobsBluetoothWriteFixture *fixture = [JobsBluetoothWriteFixture new];
    CBMutableCharacteristic *characteristic = [self writeCharacteristic];
    [self configureManager:manager withWriteFixture:fixture characteristic:characteristic];
    XCTestExpectation *submitted = [self expectationWithDescription:@"native first chunk submitted"];
    fixture.onWrite = ^(NSData *data, CBCharacteristic *value, CBCharacteristicWriteType type) {
        [submitted fulfill];
    };
    XCTestExpectation *failed = [self expectationWithDescription:@"matching ACK error"];
    NSError *ackError = [NSError errorWithDomain:@"JobsBluetoothFixtureACK" code:17 userInfo:nil];
    __block NSUInteger calls = 0;
    JobsBluetoothCommand *command = JobsBluetoothCommand.new.byPayload([@"abcdefgh" dataUsingEncoding:NSUTF8StringEncoding]);
    [manager sendCommand:command completion:^(NSData *data, NSError *error) {
        calls += 1;
        XCTAssertNil(data);
        XCTAssertEqualObjects(error, ackError);
        [failed fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[submitted] timeout:5], XCTWaiterResultCompleted);
    JobsBluetoothWriteFixture *oldPeripheral = [JobsBluetoothWriteFixture new];
    [self onMain:^{
        [manager peripheral:(CBPeripheral *)oldPeripheral didWriteValueForCharacteristic:characteristic error:nil];
    }];
    XCTAssertEqual(fixture.sentChunks.count, 1);
    XCTAssertEqual(calls, 0);
    XCTAssertNotNil([manager valueForKey:@"activeCommand"]);
    [self onMain:^{
        [manager peripheral:(CBPeripheral *)fixture didWriteValueForCharacteristic:characteristic error:ackError];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[failed] timeout:5], XCTWaiterResultCompleted);
    [self onMain:^{
        [manager peripheral:(CBPeripheral *)fixture didWriteValueForCharacteristic:characteristic error:ackError];
    }];
    XCTAssertEqual(calls, 1);
    XCTAssertNil([manager valueForKey:@"activeCommand"]);
    XCTAssertEqual(fixture.sentChunks.count, 1);
    fixture.onWrite = nil;
}

-(void)testNativeMTUChunksWaitForEachACKBeforeCompleting{
    JobsBluetoothManager *manager = [self mockManager];
    JobsBluetoothWriteFixture *fixture = [JobsBluetoothWriteFixture new];
    CBMutableCharacteristic *characteristic = [self writeCharacteristic];
    [self configureManager:manager withWriteFixture:fixture characteristic:characteristic];
    NSData *payload = [@"abcdefgh" dataUsingEncoding:NSUTF8StringEncoding];
    XCTestExpectation *finished = [self expectationWithDescription:@"all three chunks acknowledged"];
    __block NSUInteger calls = 0;
    __weak JobsBluetoothManager *weakManager = manager;
    __weak JobsBluetoothWriteFixture *weakFixture = fixture;
    fixture.onWrite = ^(NSData *data, CBCharacteristic *value, CBCharacteristicWriteType type) {
        XCTAssertEqual(type, CBCharacteristicWriteWithResponse);
        XCTAssertLessThanOrEqual(data.length, 3);
        XCTAssertEqual(calls, 0);
        XCTAssertTrue([[[weakManager valueForKey:@"activeCommand"] objectForKey:@"awaitingACK"] boolValue]);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakManager peripheral:(CBPeripheral *)weakFixture didWriteValueForCharacteristic:value error:nil];
        });
    };
    [manager sendCommand:JobsBluetoothCommand.new.byPayload(payload) completion:^(NSData *data, NSError *error) {
        calls += 1;
        XCTAssertNil(error);
        XCTAssertEqual(data.length, 0);
        [finished fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[finished] timeout:5], XCTWaiterResultCompleted);
    XCTAssertEqual(calls, 1);
    XCTAssertEqual(fixture.sentChunks.count, 3);
    NSMutableData *joined = [NSMutableData data];
    for (NSData *data in fixture.sentChunks) {
        [joined appendData:data];
    }
    XCTAssertEqualObjects(joined, payload);
    XCTAssertNil([manager valueForKey:@"activeCommand"]);
    fixture.onWrite = nil;
}

-(void)testMatchedResponseBeforeFinalACKDoesNotCompleteEarly{
    JobsBluetoothManager *manager = [self mockManager];
    JobsBluetoothWriteFixture *fixture = [JobsBluetoothWriteFixture new];
    fixture.maximumWriteLength = 16;
    CBMutableCharacteristic *write = [self writeCharacteristic];
    CBMutableCharacteristic *notify = [[CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:@"FFF2"]
                                                                     properties:CBCharacteristicPropertyNotify
                                                                          value:nil
                                                                    permissions:CBAttributePermissionsReadable];
    [self configureManager:manager withWriteFixture:fixture characteristic:write];
    [manager setValue:notify forKey:@"notifyCharacteristic"];
    XCTestExpectation *submitted = [self expectationWithDescription:@"single chunk waiting for ACK"];
    fixture.onWrite = ^(NSData *data, CBCharacteristic *value, CBCharacteristicWriteType type) {
        [submitted fulfill];
    };
    NSData *reply = [@"reply" dataUsingEncoding:NSUTF8StringEncoding];
    XCTestExpectation *finished = [self expectationWithDescription:@"matched reply after ACK"];
    __block NSUInteger calls = 0;
    JobsBluetoothCommand *command = JobsBluetoothCommand.new
        .byPayload([@"send" dataUsingEncoding:NSUTF8StringEncoding])
        .byResponseMatcher(^BOOL(NSData *data) { return [data isEqualToData:reply]; });
    [manager sendCommand:command completion:^(NSData *data, NSError *error) {
        calls += 1;
        XCTAssertNil(error);
        XCTAssertEqualObjects(data, reply);
        [finished fulfill];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[submitted] timeout:5], XCTWaiterResultCompleted);
    [self onMain:^{
        notify.value = reply;
        [manager peripheral:(CBPeripheral *)fixture didUpdateValueForCharacteristic:notify error:nil];
    }];
    XCTAssertEqual(calls, 0);
    XCTAssertNotNil([manager valueForKey:@"activeCommand"]);
    [self onMain:^{
        [manager peripheral:(CBPeripheral *)fixture didWriteValueForCharacteristic:write error:nil];
    }];
    XCTAssertEqual([XCTWaiter waitForExpectations:@[finished] timeout:5], XCTWaiterResultCompleted);
    XCTAssertEqual(calls, 1);
    fixture.onWrite = nil;
}

@end
