//
//  SocketRocketUtility.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SOCKETROCKETUTILITY_9BFDFF3F9E
#define JOBS_HEADER_GUARD_SOCKETROCKETUTILITY_9BFDFF3F9E

#import <Foundation/Foundation.h>

#if __has_include(<SocketRocket/SocketRocket.h>)
#import <SocketRocket/SocketRocket.h>
#else
#import "SocketRocket.h"
#endif

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
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

@interface SocketRocketUtility : NSObject<SRWebSocketDelegate,BaseProtocol>
/// 获取连接状态
Prop_assign(readonly)SRReadyState socketReadyState;

+(SocketRocketUtility *_Nullable)instance;
/// 开始连接
-(jobsByStrBlock _Nonnull)SRWebSocketOpenWithURLString;
/// 关闭连接
-(void)SRWebSocketClose;
/// 发送数据
-(jobsByIDBlock _Nonnull)sendData;

@end
#endif /* JOBS_HEADER_GUARD_SOCKETROCKETUTILITY_9BFDFF3F9E */
