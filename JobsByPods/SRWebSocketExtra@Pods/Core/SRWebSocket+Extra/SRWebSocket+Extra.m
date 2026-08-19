//
//  SRWebSocket+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SRWebSocket+Extra.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN SRWebSocket
@interface SRWebSocket (JobsPropertyDSLSetterAutogen_984255e6d7)
-(void)setDelegateDispatchQueue:(dispatch_queue_t)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END SRWebSocket

@implementation SRWebSocket (Extra)
+(JobsRetSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest{
    return ^SRWebSocket *_Nonnull(NSURLRequest *_Nullable webSocket){
        return [SRWebSocket.alloc initWithURLRequest:webSocket];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN SRWebSocket
-(JobsRetSRWebSocketBydispatch_queue_tBlock _Nonnull)byDelegateDispatchQueue{
    @jobs_weakify(self)
    return ^__kindof SRWebSocket * _Nullable(dispatch_queue_t data){
        @jobs_strongify(self)
        [self setDelegateDispatchQueue:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END SRWebSocket
@end
