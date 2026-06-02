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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SRWebSocket (Extra)

+(JobsReturnSRWebSocketByNSURLRequestBlock _Nonnull)initByURLRequest;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SRWEBSOCKET_EXTRA_B5818EC8B7 */
