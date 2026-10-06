//
//  JobsWebSocketTransportFixture.m
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsWebSocketTransportFixture.h"

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
