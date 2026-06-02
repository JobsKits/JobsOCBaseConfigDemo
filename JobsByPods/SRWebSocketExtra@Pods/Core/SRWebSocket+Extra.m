//
//  SRWebSocket+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SRWebSocket+Extra.h"

@implementation SRWebSocket (Extra)

+(JobsReturnSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest{
    return ^SRWebSocket *_Nonnull(NSURLRequest *_Nullable webSocket){
        return [SRWebSocket.alloc initWithURLRequest:webSocket];
    };
}

@end
