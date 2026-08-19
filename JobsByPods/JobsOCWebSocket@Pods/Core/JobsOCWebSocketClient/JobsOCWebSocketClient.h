//
//  JobsOCWebSocketClient.h
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<SocketRocket/SRWebSocket.h>)
#import <SocketRocket/SRWebSocket.h>
#else
#import "SRWebSocket.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsOCWebSocketState) {
    JobsOCWebSocketStateIdle = 0,
    JobsOCWebSocketStateConnecting,
    JobsOCWebSocketStateConnected,
    JobsOCWebSocketStateReconnecting,
    JobsOCWebSocketStateDisconnected,
    JobsOCWebSocketStateFailed
};

@class JobsOCWebSocketClient;

@protocol JobsOCWebSocketClientDelegate <NSObject>

@optional
-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didChangeState:(JobsOCWebSocketState)state
                 error:(nullable NSError *)error;
-(void)webSocketClient:(JobsOCWebSocketClient *)client
willReconnectAtAttempt:(NSInteger)attempt
            afterDelay:(NSTimeInterval)delay;
-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didReceiveText:(NSString *)text;
-(void)webSocketClient:(JobsOCWebSocketClient *)client
        didReceiveData:(NSData *)data;

@end

/// 轻量 WebSocket 客户端：统一连接生命周期、心跳、退避重连和主线程回调。
@interface JobsOCWebSocketClient : NSObject

@property(nonatomic, weak, nullable)id<JobsOCWebSocketClientDelegate> delegate;
@property(atomic, assign, readonly)JobsOCWebSocketState state;
@property(nonatomic, strong, readonly, nullable)NSURL *URL;
@property(atomic, assign)BOOL reconnectEnabled;
@property(atomic, assign)NSTimeInterval heartbeatInterval;
@property(atomic, assign)NSTimeInterval reconnectBaseDelay;
@property(atomic, assign)NSTimeInterval maximumReconnectDelay;
@property(atomic, assign)NSInteger maximumReconnectAttempts;

-(JobsRetJobsOCWebSocketClientByIDBlock _Nonnull)byDelegate;
-(instancetype)initWithURL:(NSURL *)URL;
-(jobsByVoidBlock _Nonnull)connect;
-(jobsByURLBlock _Nonnull)connectWithURL;
-(jobsByVoidBlock _Nonnull)disconnect;
-(BOOL)sendText:(NSString *)text
          error:(NSError * _Nullable * _Nullable)error;
-(BOOL)sendData:(NSData *)data
          error:(NSError * _Nullable * _Nullable)error;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCWebSocketClient
-(JobsRetJobsOCWebSocketClientByBOOLBlock _Nonnull)byManuallyDisconnected;
-(JobsRetJobsOCWebSocketClientByJobsOCWebSocketStateBlock _Nonnull)byState;
-(JobsRetJobsOCWebSocketClientByNSIntegerBlock _Nonnull)byReconnectAttempt;
-(JobsRetJobsOCWebSocketClientByNSURLBlock _Nonnull)byURL;
-(JobsRetJobsOCWebSocketClientBySRWebSocketBlock _Nonnull)bySocket;
-(JobsRetJobsOCWebSocketClientBydispatch_block_tBlock _Nonnull)byReconnectWorkItem;
-(JobsRetJobsOCWebSocketClientBydispatch_source_tBlock _Nonnull)byHeartbeatTimer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCWebSocketClient
@end

NS_ASSUME_NONNULL_END
