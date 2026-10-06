//
//  JobsBluetoothManager.m
//  JobsBluetooth
//
//  Created by Jobs on 2026年7月13日，星期一.
//

#import "JobsBluetoothManager.h"

@interface CBPeripheral (JobsBluetoothDSL)
-(JobsRetIDByIDBlock _Nonnull)byDelegate;
@end

@implementation CBPeripheral (JobsBluetoothDSL)
-(JobsRetIDByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^id _Nullable(id<CBPeripheralDelegate> _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}
@end

@interface JobsBluetoothManager () <CBCentralManagerDelegate, CBPeripheralDelegate>

Prop_strong()CBCentralManager *central;
Prop_strong(nullable)CBPeripheral *connectedPeripheral;
Prop_strong(nullable)CBCharacteristic *writeCharacteristic;
Prop_strong(nullable)CBCharacteristic *notifyCharacteristic;
Prop_strong(nullable)CBCharacteristic *readCharacteristic;
Prop_strong()NSMutableDictionary <NSUUID *, CBPeripheral *>*nativePeripherals;
Prop_strong()NSMutableDictionary <NSUUID *, JobsBluetoothPeripheral *>*snapshots;
Prop_strong(readwrite)dispatch_queue_t callbackQueue;
Prop_strong(readwrite)JobsBluetoothProfile *profile;
Prop_strong(readwrite)JobsBluetoothMockTransport *mockTransport;
Prop_assign(readwrite)JobsBluetoothState state;
Prop_strong()NSMutableArray<NSMutableDictionary *> *commandQueue;
Prop_strong(nullable)NSMutableDictionary *activeCommand;
Prop_assign()NSUInteger commandGeneration;
Prop_assign()NSUInteger connectionGeneration;
Prop_assign()NSUInteger scanGeneration;
Prop_assign()NSUInteger pendingServices;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsBluetoothManager
@interface JobsBluetoothManager (JobsPropertyDSLSetterAutogen_d5a7b1cec5)
-(void)setConnectedPeripheral:(CBPeripheral * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsBluetoothManager

@implementation JobsBluetoothManager
-(instancetype)init{return [self initWithProfile:JobsBluetoothProfile.new];}

-(instancetype)initWithProfile:(JobsBluetoothProfile *)profile{
    if (self = [super init]) {
        _profile = profile;
        _mockTransport = JobsBluetoothMockTransport.new;
        _callbackQueue = dispatch_get_main_queue();
        _nativePeripherals = NSMutableDictionary.dictionary;
        _snapshots = NSMutableDictionary.dictionary;
        _central = [CBCentralManager.alloc initWithDelegate:self queue:dispatch_get_main_queue() options:@{CBCentralManagerOptionShowPowerAlertKey: @NO}];
        _state = JobsBluetoothStateUnknown;
        _commandQueue = NSMutableArray.array;
    };return self;
}

-(NSArray<JobsBluetoothPeripheral *> *)discoveredPeripherals{return self.snapshots.allValues;}
-(JobsRetJobsBluetoothManagerBydispatch_queue_tBlock _Nonnull)byCallbackQueue{return ^JobsBluetoothManager *(dispatch_queue_t value){self.callbackQueue = value ?: dispatch_get_main_queue();return self;};}
-(JobsRetJobsBluetoothManagerByJobsBluetoothProfileBlock _Nonnull)byProfile{return ^JobsBluetoothManager *(JobsBluetoothProfile *value){self.profile = value;return self;};}
-(JobsRetJobsBluetoothManagerByJobsBluetoothMockTransportBlock _Nonnull)byMockTransport{return ^JobsBluetoothManager *(JobsBluetoothMockTransport *value){self.mockTransport = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidJobsBluetoothStateBlock _Nonnull)onStateChanged{return ^JobsBluetoothManager *(void (^value)(JobsBluetoothState)){self.stateChanged = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidJobsBluetoothPeripheralBlock _Nonnull)onPeripheralDiscovered{return ^JobsBluetoothManager *(void (^value)(JobsBluetoothPeripheral *)){self.peripheralDiscovered = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidNSDataIDBlock _Nonnull)onDataReceived{return ^JobsBluetoothManager *(void (^value)(NSData *, id)){self.dataReceived = value;return self;};}
-(JobsRetJobsBluetoothManagerByvoidNSStringBlock _Nonnull)onLog{return ^JobsBluetoothManager *(void (^value)(NSString *)){self.logReceived = value;return self;};}

-(jobsByVoidBlock _Nonnull)startScan{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.startScan();
            });
            return;
        }
        NSUInteger scan = ++self.scanGeneration;
        [self.snapshots removeAllObjects];
        [self transition:JobsBluetoothStateScanning message:@"开始扫描"];
        if (self.mockTransport.enabled) {
            for (NSDictionary *item in self.mockTransport.mockAdvertisements()) {
                JobsBluetoothPeripheral *snapshot = [JobsBluetoothPeripheral.alloc initWithIdentifier:[NSUUID.alloc initWithUUIDString:item[@"identifier"]]
                                                                                                  name:item[@"name"]
                                                                                                  RSSI:item[@"RSSI"]
                                                                                     advertisementData:@{@"mock": @YES}
                                                                                             connected:NO];
                self.snapshots[snapshot.identifier] = snapshot;
                self.callback(^{if (self.peripheralDiscovered) self.peripheralDiscovered(snapshot);});
            };return;
        }
        if (self.central.state != CBManagerStatePoweredOn) {
            [self transition:JobsBluetoothStateUnavailable message:@"系统蓝牙不可用"];
            return;
        }
        [self.central scanForPeripheralsWithServices:self.profile.serviceUUIDs.count ? self.profile.serviceUUIDs : nil
                                             options:@{CBCentralManagerScanOptionAllowDuplicatesKey: @(self.profile.allowDuplicates)}];
        if (isfinite(self.profile.scanTimeout) && self.profile.scanTimeout > 0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.profile.scanTimeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (self.scanGeneration == scan) self.stopScan();
            });
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopScan{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.stopScan();
            });
            return;
        }
        self.scanGeneration += 1;
        [self.central stopScan];
        if (self.state == JobsBluetoothStateScanning) {
            [self transition:JobsBluetoothStateIdle message:@"停止扫描"];
        }
    };
}

-(jobsByNSUUIDBlock _Nonnull)connectIdentifier{
    @jobs_weakify(self)
    return ^(NSUUID * identifier){
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.connectIdentifier(identifier);
            });
            return;
        }
        self.stopScan();
        [self failAllCommands:[self commandError:JobsBluetoothErrorCancelled message:@"连接切换取消命令"]];
        CBPeripheral *previous = self.connectedPeripheral;
        if (previous) {
            previous.byDelegate(nil);
        }
        if (previous) [self.central cancelPeripheralConnection:previous];
        [self clearCharacteristics];
        self.connectedPeripheral = nil;
        NSUInteger connection = ++self.connectionGeneration;
        [self transition:JobsBluetoothStateConnecting message:[NSString stringWithFormat:@"连接 %@", identifier.UUIDString]];
        if (self.mockTransport.enabled) {
            [self transition:JobsBluetoothStateReady message:@"Mock 设备已就绪"];
            return;
        }
        CBPeripheral *peripheral = self.nativePeripherals[identifier];
        if (!peripheral) {[self transition:JobsBluetoothStateFailed message:@"未找到外设"];return;}
        self.byConnectedPeripheral(peripheral);
        peripheral.byDelegate(self);
        [self.central connectPeripheral:peripheral options:nil];
        NSTimeInterval timeout = isfinite(self.profile.connectTimeout) && self.profile.connectTimeout > 0 ? MIN(self.profile.connectTimeout, 3600) : 12;
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (!self || self.connectionGeneration != connection || self.state == JobsBluetoothStateReady) return;
            [self failAllCommands:[self commandError:JobsBluetoothErrorConnectionTimeout message:@"连接或服务发现超时"]];
            [self.central cancelPeripheralConnection:peripheral];
            [self clearCharacteristics];
            [self transition:JobsBluetoothStateFailed message:@"连接或服务发现超时"];
        });
    };
}

-(jobsByVoidBlock _Nonnull)disconnect{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.disconnect();
            });
            return;
        }
        self.connectionGeneration += 1;
        [self failAllCommands:[self commandError:JobsBluetoothErrorCancelled message:@"主动断开取消命令"]];
        [self clearCharacteristics];
        [self transition:JobsBluetoothStateDisconnecting message:@"主动断开"];
        if (self.connectedPeripheral) {
            [self.central cancelPeripheralConnection:self.connectedPeripheral];
        } else {
            [self transition:JobsBluetoothStateIdle message:@"已断开"];
        }
    };
}

-(jobsByVoidBlock _Nonnull)read{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.read();
            });
            return;
        }
    if (self.connectedPeripheral && self.readCharacteristic) [self.connectedPeripheral readValueForCharacteristic:self.readCharacteristic];
    };
}
-(jobsByBOOLBlock _Nonnull)setNotifyEnabled{
    @jobs_weakify(self)
    return ^(BOOL enabled){
        @jobs_strongify(self)
        if (!self) return;
        if (!NSThread.isMainThread) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.setNotifyEnabled(enabled);
            });
            return;
        }
    if (self.connectedPeripheral && self.notifyCharacteristic) [self.connectedPeripheral setNotifyValue:enabled forCharacteristic:self.notifyCharacteristic];
    };
}

-(void)sendCommand:(JobsBluetoothCommand *)command completion:(void (^)(NSData *, NSError *))completion{
    JobsBluetoothCommand *snapshot = JobsBluetoothCommand.new
        .byIdentifier(command.identifier ?: NSUUID.UUID.UUIDString)
        .byPayload(command.payload.copy ?: NSData.data)
        .byTimeout(command.timeout)
        .byRetryCount(MIN(command.retryCount, 8))
        .byPriority(command.priority)
        .byResponseMatcher(command.responseMatcher);
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!command || !snapshot.payload.length || self.state != JobsBluetoothStateReady || self.commandQueue.count >= 128) {
            NSError *error = [self commandError:JobsBluetoothErrorTransportUnavailable message:@"设备未就绪、命令为空或队列已满"];
            self.callback(^{ if (completion) completion(nil, error); });
            return;
        }
        NSMutableDictionary *record = [@{@"command":snapshot, @"offset":@0, @"attempt":@0,
                                         @"awaitingACK":@NO, @"written":@NO} mutableCopy];
        if (completion) record[@"completion"] = [completion copy];
        [self.commandQueue addObject:record];
        [self.commandQueue sortUsingComparator:^NSComparisonResult(NSDictionary *left, NSDictionary *right) {
            NSInteger lhs = ((JobsBluetoothCommand *)left[@"command"]).priority;
            NSInteger rhs = ((JobsBluetoothCommand *)right[@"command"]).priority;
            return lhs > rhs ? NSOrderedAscending : lhs < rhs ? NSOrderedDescending : NSOrderedSame;
        }];
        [self beginNextCommand];
    });
}

-(NSError *)commandError:(JobsBluetoothErrorCode)code message:(NSString *)message{
    return [NSError errorWithDomain:JobsBluetoothErrorDomain code:code
                          userInfo:@{NSLocalizedDescriptionKey:message}];
}

-(void)clearCharacteristics{
    self.writeCharacteristic = nil;
    self.notifyCharacteristic = nil;
    self.readCharacteristic = nil;
    self.pendingServices = 0;
}

-(void)beginNextCommand{
    if (self.activeCommand || !self.commandQueue.count || self.state != JobsBluetoothStateReady) return;
    self.activeCommand = self.commandQueue.firstObject;
    [self.commandQueue removeObjectAtIndex:0];
    [self startCommandAttempt];
}

-(void)startCommandAttempt{
    NSMutableDictionary *record = self.activeCommand;
    if (!record) return;
    record[@"offset"] = @0;
    record[@"awaitingACK"] = @NO;
    record[@"written"] = @NO;
    NSUInteger generation = ++self.commandGeneration;
    JobsBluetoothCommand *command = record[@"command"];
    NSTimeInterval timeout = isfinite(command.timeout) && command.timeout > 0 ? MIN(command.timeout, 3600) : 5;
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        if (!self || self.activeCommand != record || self.commandGeneration != generation) return;
        NSUInteger attempt = [record[@"attempt"] unsignedIntegerValue];
        if (attempt < command.retryCount && ![record[@"awaitingACK"] boolValue]) {
            record[@"attempt"] = @(attempt + 1);
            [self startCommandAttempt];
        } else {
            NSError *failure = [self commandError:JobsBluetoothErrorCommandTimeout message:@"设备命令响应超时"];
            if ([record[@"awaitingACK"] boolValue]) {
                [self failAllCommands:failure];
                [self clearCharacteristics];
                [self.central cancelPeripheralConnection:self.connectedPeripheral];
                [self transition:JobsBluetoothStateFailed message:failure.localizedDescription];
            } else {
                [self completeActiveCommand:nil error:failure];
            }
        }
    });
    if (self.mockTransport.enabled) {
        [self.mockTransport echoData:command.payload completion:^(NSData *response) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (!self || self.activeCommand != record || self.commandGeneration != generation) return;
                if (!command.responseMatcher || command.responseMatcher(response)) {
                    [self completeActiveCommand:response error:nil];
                }
                self.callback(^{ if (self.dataReceived) self.dataReceived(response, response); });
            });
        }];
        return;
    }
    [self writeNextChunk];
}

-(void)writeNextChunk{
    NSMutableDictionary *record = self.activeCommand;
    if (!record || [record[@"awaitingACK"] boolValue] || [record[@"written"] boolValue]) return;
    JobsBluetoothCommand *command = record[@"command"];
    if (!self.connectedPeripheral || self.connectedPeripheral.state != CBPeripheralStateConnected || !self.writeCharacteristic) {
        [self completeActiveCommand:nil error:[self commandError:JobsBluetoothErrorTransportUnavailable message:@"写入外设已失效"]];
        return;
    }
    CBCharacteristicWriteType type = (self.writeCharacteristic.properties & CBCharacteristicPropertyWrite) ?
        CBCharacteristicWriteWithResponse : CBCharacteristicWriteWithoutResponse;
    NSUInteger maximum = [self.connectedPeripheral maximumWriteValueLengthForType:type];
    if (!maximum) {
        [self completeActiveCommand:nil error:[self commandError:JobsBluetoothErrorInvalidPacket message:@"外设不支持该写入方式"]];
        return;
    }
    while (self.activeCommand == record) {
        if (type == CBCharacteristicWriteWithoutResponse && !self.connectedPeripheral.canSendWriteWithoutResponse) return;
        NSUInteger offset = [record[@"offset"] unsignedIntegerValue];
        if (offset >= command.payload.length) {
            record[@"written"] = @YES;
            if (record[@"matchedResponse"]) {
                [self completeActiveCommand:record[@"matchedResponse"] error:nil];
            } else if (!command.responseMatcher) {
                [self completeActiveCommand:NSData.data error:nil];
            }
            return;
        }
        NSUInteger count = MIN(maximum, command.payload.length - offset);
        NSData *chunk = [command.payload subdataWithRange:NSMakeRange(offset, count)];
        record[@"offset"] = @(offset + count);
        record[@"awaitingACK"] = @(type == CBCharacteristicWriteWithResponse);
        [self.connectedPeripheral writeValue:chunk forCharacteristic:self.writeCharacteristic type:type];
        if (type == CBCharacteristicWriteWithResponse) return;
    }
}

-(void)completeActiveCommand:(NSData *)response error:(NSError *)error{
    NSMutableDictionary *record = self.activeCommand;
    if (!record) return;
    self.activeCommand = nil;
    self.commandGeneration += 1;
    void (^completion)(NSData *, NSError *) = record[@"completion"];
    self.callback(^{ if (completion) completion(response, error); });
    [self beginNextCommand];
}

-(void)failAllCommands:(NSError *)error{
    NSMutableArray *records = self.commandQueue.mutableCopy;
    if (self.activeCommand) [records insertObject:self.activeCommand atIndex:0];
    self.activeCommand = nil;
    self.commandGeneration += 1;
    [self.commandQueue removeAllObjects];
    for (NSDictionary *record in records) {
        void (^completion)(NSData *, NSError *) = record[@"completion"];
        self.callback(^{ if (completion) completion(nil, error); });
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if (peripheral != self.connectedPeripheral || characteristic != self.writeCharacteristic || !self.activeCommand) return;
    if (error) {
        [self completeActiveCommand:nil error:error];
        return;
    }
    self.activeCommand[@"awaitingACK"] = @NO;
    [self writeNextChunk];
}

-(void)peripheralIsReadyToSendWriteWithoutResponse:(CBPeripheral *)peripheral{
    if (peripheral == self.connectedPeripheral) [self writeNextChunk];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central{
    ((((jobsByCBCentralManagerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBluetoothManager.class, @selector(centralManagerDidUpdateState)))(self, @selector(centralManagerDidUpdateState))))(central);
}
-(jobsByCBCentralManagerBlock _Nonnull)centralManagerDidUpdateState{
    @jobs_weakify(self)
    return ^(CBCentralManager * central){
        @jobs_strongify(self)
        if (!self) return;
    if (central.state == CBManagerStatePoweredOn && self.state == JobsBluetoothStateUnknown) [self transition:JobsBluetoothStateIdle message:@"系统蓝牙已开启"];else if (central.state != CBManagerStatePoweredOn && !self.mockTransport.enabled) {
        [self failAllCommands:[self commandError:JobsBluetoothErrorBluetoothUnavailable message:@"系统蓝牙不可用"]];
        [self clearCharacteristics];
        self.connectedPeripheral = nil;
        self.connectionGeneration += 1;
        [self transition:JobsBluetoothStateUnavailable message:@"系统蓝牙不可用"];
    }
    };
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
    self.nativePeripherals[peripheral.identifier] = peripheral;
    JobsBluetoothPeripheral *snapshot = [JobsBluetoothPeripheral.alloc initWithIdentifier:peripheral.identifier name:peripheral.name RSSI:RSSI advertisementData:advertisementData connected:NO];
    self.snapshots[peripheral.identifier] = snapshot;
    self.callback(^{if (self.peripheralDiscovered) self.peripheralDiscovered(snapshot);});
}

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    if (peripheral != self.connectedPeripheral) return;
    [self transition:JobsBluetoothStateDiscovering message:@"发现服务"];
    [peripheral discoverServices:self.profile.serviceUUIDs.count ? self.profile.serviceUUIDs : nil];
}

-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    if (peripheral != self.connectedPeripheral) return;
    [self failAllCommands:error ?: [self commandError:JobsBluetoothErrorTransportUnavailable message:@"连接失败"]];
    [self clearCharacteristics];
    self.connectedPeripheral = nil;
    self.connectionGeneration += 1;
    [self transition:JobsBluetoothStateFailed message:error.localizedDescription ?: @"连接失败"];
}

-(void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
    if (peripheral != self.connectedPeripheral) return;
    [self failAllCommands:error ?: [self commandError:JobsBluetoothErrorCancelled message:@"连接已断开"]];
    [self clearCharacteristics];
    self.connectedPeripheral = nil;
    self.connectionGeneration += 1;
    [self transition:JobsBluetoothStateIdle message:error.localizedDescription ?: @"连接已断开"];
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
    if (peripheral != self.connectedPeripheral) return;
    if (error || !peripheral.services.count) {
        [self transition:JobsBluetoothStateFailed message:error.localizedDescription ?: @"未发现服务"];
        return;
    }
    self.pendingServices = peripheral.services.count;
    for (CBService *service in peripheral.services) [peripheral discoverCharacteristics:nil forService:service];
}

-(void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error{
    if (peripheral != self.connectedPeripheral) return;
    if (error) {
        [self transition:JobsBluetoothStateFailed message:error.localizedDescription];
        return;
    }
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:self.profile.writeCharacteristicUUID]) self.writeCharacteristic = characteristic;
        if ([characteristic.UUID isEqual:self.profile.notifyCharacteristicUUID]) self.notifyCharacteristic = characteristic;
        if ([characteristic.UUID isEqual:self.profile.readCharacteristicUUID]) self.readCharacteristic = characteristic;
    }
    if (self.pendingServices) self.pendingServices -= 1;
    if (self.pendingServices) return;
    if ((self.profile.writeCharacteristicUUID && !self.writeCharacteristic) ||
        (self.profile.readCharacteristicUUID && !self.readCharacteristic) ||
        (self.profile.notifyCharacteristicUUID && !self.notifyCharacteristic)) {
        [self transition:JobsBluetoothStateFailed message:@"Profile 所需特征不存在"];
        return;
    }
    if (self.notifyCharacteristic) {
        [peripheral setNotifyValue:YES forCharacteristic:self.notifyCharacteristic];
    } else {
        [self transition:JobsBluetoothStateReady message:@"设备已就绪"];
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if (peripheral != self.connectedPeripheral || characteristic != self.notifyCharacteristic) return;
    [self transition:error || !characteristic.isNotifying ? JobsBluetoothStateFailed : JobsBluetoothStateReady
               message:error.localizedDescription ?: (characteristic.isNotifying ? @"设备已就绪" : @"通知未启用")];
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if (peripheral != self.connectedPeripheral) return;
    if (characteristic != self.notifyCharacteristic && characteristic != self.readCharacteristic) return;
    if (error) {
        [self completeActiveCommand:nil error:error];
        return;
    }
    NSData *data = characteristic.value.copy;
    if (!data) return;
    NSError *decodeError = nil;
    id object = self.profile.decoder ? self.profile.decoder(data, &decodeError) : data;
    if (decodeError) {
        [self completeActiveCommand:nil error:decodeError];
        return;
    }
    JobsBluetoothCommand *command = self.activeCommand[@"command"];
    if (command.responseMatcher && command.responseMatcher(data) &&
        [self.activeCommand[@"offset"] unsignedIntegerValue] == command.payload.length) {
        self.activeCommand[@"matchedResponse"] = data;
        if ([self.activeCommand[@"written"] boolValue]) {
            [self completeActiveCommand:data error:nil];
        }
    }
    self.callback(^{ if (self.dataReceived) self.dataReceived(data, object); });
}

-(void)transition:(JobsBluetoothState)state message:(NSString *)message{self.state = state;self.callback(^{if (self.logReceived) self.logReceived(message);if (self.stateChanged) self.stateChanged(state);});}
-(jobsBydispatch_block_tBlock _Nonnull)callback{
    @jobs_weakify(self)
    return ^(dispatch_block_t block){
        @jobs_strongify(self)
        if (!self) return;
    dispatch_async(self.callbackQueue ?: dispatch_get_main_queue(), block);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsBluetoothManager
-(JobsRetJobsBluetoothManagerByCBPeripheralBlock _Nonnull)byConnectedPeripheral{
    @jobs_weakify(self)
    return ^__kindof JobsBluetoothManager * _Nullable(CBPeripheral * _Nullable data){
        @jobs_strongify(self)
        [self setConnectedPeripheral:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsBluetoothManager
@end
