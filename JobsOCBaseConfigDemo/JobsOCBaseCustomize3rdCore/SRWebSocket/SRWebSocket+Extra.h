//
//  SRWebSocket+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SRWEBSOCKET_EXTRA_B5818EC8B7
#define JOBS_HEADER_GUARD_SRWEBSOCKET_EXTRA_B5818EC8B7

#import <UIKit/UIKit.h>

#if __has_include(<SocketRocket/SocketRocket.h>)
#import <SocketRocket/SRWebSocket.h>
#else
#import "SRWebSocket.h"
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface SRWebSocket (Extra)

+(JobsRetSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SRWEBSOCKET_EXTRA_B5818EC8B7 */
