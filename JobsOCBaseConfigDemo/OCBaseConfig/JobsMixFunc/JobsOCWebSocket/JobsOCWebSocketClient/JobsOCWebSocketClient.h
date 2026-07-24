//
//  JobsOCWebSocketClient.h
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import <Foundation/Foundation.h>

#if __has_include(<SocketRocket/SRWebSocket.h>)
#import <SocketRocket/SRWebSocket.h>
#else
#import "SRWebSocket.h"
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

-(instancetype)initWithURL:(NSURL *)URL;
-(void)connect;
-(void)connectWithURL:(NSURL *)URL;
-(void)disconnect;
-(BOOL)sendText:(NSString *)text
          error:(NSError * _Nullable * _Nullable)error;
-(BOOL)sendData:(NSData *)data
          error:(NSError * _Nullable * _Nullable)error;

@end

NS_ASSUME_NONNULL_END
