//
//  JobsWebSocketTransportFixture.m
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWebSocketTransportFixture.h"

// 用途：实现测试替身（fixture）；提供可控 WebSocket 传输回调与发送行为，供心跳和超时用例使用。
// 运行：由 JobsOCWebSocket-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsWebSocketTransportFixture ()

@property(nonatomic, weak)id delegate;

@end

@implementation JobsWebSocketTransportFixture

-(SRReadyState)readyState{
    return SR_OPEN;
}

-(JobsRetIDByIDBlock _Nonnull)byDelegate{
    __weak typeof(self) weakSelf = self;
    return ^id(id delegate) {
        typeof(self) owner = weakSelf;
        owner.delegate = delegate;
        return owner;
    };
}

-(BOOL)sendPing:(NSData *)data error:(NSError **)error{
    return YES;
}

-(void)closeWithCode:(NSInteger)code reason:(NSString *)reason{
}

@end
