//
//  JobsOCWebSocketStabilityTests.m
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCWebSocketStabilityTests.h"

@interface JobsOCWebSocketClient (JobsStabilityTesting)
-(jobsByVoidBlock _Nonnull)startHeartbeat;
-(jobsByVoidBlock _Nonnull)stopHeartbeat;
-(void)webSocket:(SRWebSocket *)socket didReceivePong:(NSData *)data;
@end

@implementation JobsOCWebSocketStabilityTests

-(void)testOnlyCurrentSocketAndMatchingPongClearProbe{
    JobsOCWebSocketClient *client = [JobsOCWebSocketClient new];
    JobsWebSocketTransportFixture *current = [JobsWebSocketTransportFixture new];
    JobsWebSocketTransportFixture *old = [JobsWebSocketTransportFixture new];
    NSData *payload = [@"probe" dataUsingEncoding:NSUTF8StringEncoding];
    [client setValue:current forKey:@"socket"];
    [client setValue:payload forKey:@"pendingPing"];
    dispatch_queue_t queue = [client valueForKey:@"workQueue"];
    dispatch_sync(queue, ^{
        [client webSocket:(SRWebSocket *)old didReceivePong:payload];
        XCTAssertNotNil([client valueForKey:@"pendingPing"]);
        [client webSocket:(SRWebSocket *)current didReceivePong:[NSData data]];
        XCTAssertNotNil([client valueForKey:@"pendingPing"]);
        [client webSocket:(SRWebSocket *)current didReceivePong:payload];
        XCTAssertNil([client valueForKey:@"pendingPing"]);
    });
}

-(void)testUnansweredProbeTerminatesConnectionWithoutNetwork{
    JobsOCWebSocketClient *client = [JobsOCWebSocketClient new];
    client.heartbeatInterval = 0.1;
    client.reconnectEnabled = NO;
    [client setValue:[JobsWebSocketTransportFixture new] forKey:@"socket"];
    [client setValue:@(JobsOCWebSocketStateConnected) forKey:@"state"];
    [client setValue:[NSData data] forKey:@"pendingPing"];
    dispatch_queue_t queue = [client valueForKey:@"workQueue"];
    dispatch_sync(queue, ^{
        client.startHeartbeat();
        [client setValue:[NSData data] forKey:@"pendingPing"];
    });
    XCTestExpectation *terminated = [self expectationWithDescription:@"heartbeat deadline"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        XCTAssertEqual(client.state, JobsOCWebSocketStateFailed);
        XCTAssertNil([client valueForKey:@"socket"]);
        XCTAssertNil([client valueForKey:@"heartbeatTimer"]);
        [terminated fulfill];
    });
    [self waitForExpectations:@[terminated] timeout:3];
}

-(void)testNeverConnectedClientCanDisconnectAndRelease{
    __weak JobsOCWebSocketClient *released;
    @autoreleasepool {
        JobsOCWebSocketClient *client = [JobsOCWebSocketClient new];
        released = client;
    }
    XCTAssertNil(released);
}

@end
