//
//  JobsOCWebSocketClient.m
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsOCWebSocketClient.h"

static NSString *const JobsOCWebSocketErrorDomain = @"JobsOCWebSocket";
static void *JobsOCWebSocketQueueKey = &JobsOCWebSocketQueueKey;

@interface JobsOCWebSocketClient () <SRWebSocketDelegate>

@property(atomic, assign, readwrite)JobsOCWebSocketState state;
@property(nonatomic, strong, readwrite, nullable)NSURL *URL;
@property(nonatomic, strong)dispatch_queue_t workQueue;
@property(nonatomic, strong, nullable)SRWebSocket *socket;
@property(nonatomic, strong, nullable)dispatch_source_t heartbeatTimer;
@property(nonatomic, copy, nullable)dispatch_block_t reconnectWorkItem;
@property(nonatomic, assign)NSInteger reconnectAttempt;
@property(nonatomic, assign)BOOL manuallyDisconnected;

@end

@implementation JobsOCWebSocketClient

-(instancetype)init{
    if (self = [super init]) {
        [self setupDefaults];
    };return self;
}

-(instancetype)initWithURL:(NSURL *)URL{
    if (self = [self init]) {
        _URL = URL;
    };return self;
}

-(void)dealloc{
    if (self.reconnectWorkItem) {
        dispatch_block_cancel(self.reconnectWorkItem);
    }
    if (self.heartbeatTimer) {
        dispatch_source_cancel(self.heartbeatTimer);
    }
    self.socket.delegate = nil;
    [self.socket closeWithCode:SRStatusCodeGoingAway
                       reason:nil];
}

-(void)connect{
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.workQueue, ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        if (!self.URL) {
            [self publishState:JobsOCWebSocketStateFailed
                         error:[self errorWithDescription:@"WebSocket 地址不能为空"]];
            return;
        }
        self.manuallyDisconnected = NO;
        self.reconnectAttempt = 0;
        [self cancelReconnect];
        [self invalidateCurrentSocket];
        [self startConnectionWithURL:self.URL];
    });
}

-(void)connectWithURL:(NSURL *)URL{
    self.URL = URL;
    [self connect];
}

-(void)disconnect{
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.workQueue, ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        self.manuallyDisconnected = YES;
        self.reconnectAttempt = 0;
        [self cancelReconnect];
        [self invalidateCurrentSocket];
        [self publishState:JobsOCWebSocketStateDisconnected
                     error:nil];
    });
}

-(BOOL)sendText:(NSString *)text
          error:(NSError * _Nullable __autoreleasing *)error{
    return [self sendBlock:^BOOL(SRWebSocket *socket,
                                NSError * _Nullable __autoreleasing *sendError) {
        return [socket sendString:text
                           error:sendError];
    } error:error];
}

-(BOOL)sendData:(NSData *)data
          error:(NSError * _Nullable __autoreleasing *)error{
    return [self sendBlock:^BOOL(SRWebSocket *socket,
                                NSError * _Nullable __autoreleasing *sendError) {
        return [socket sendData:data
                         error:sendError];
    } error:error];
}
#pragma mark —— Connection
-(void)startConnectionWithURL:(NSURL *)URL{
    [self publishState:JobsOCWebSocketStateConnecting
                 error:nil];
    SRWebSocket *socket = [[SRWebSocket alloc] initWithURL:URL];
    socket.delegate = self;
    socket.delegateDispatchQueue = self.workQueue;
    self.socket = socket;
    [socket open];
}

-(void)handleConnectionEndWithError:(nullable NSError *)error{
    [self invalidateCurrentSocket];
    if (self.manuallyDisconnected) {
        [self publishState:JobsOCWebSocketStateDisconnected
                     error:nil];
        return;
    }
    if (!self.reconnectEnabled) {
        [self publishState:error ?
         JobsOCWebSocketStateFailed :
         JobsOCWebSocketStateDisconnected
                     error:error];
        return;
    }
    [self scheduleReconnectWithLastError:error];
}

-(void)scheduleReconnectWithLastError:(nullable NSError *)lastError{
    if (!self.URL ||
        self.reconnectAttempt >= self.maximumReconnectAttempts) {
        NSError *error = lastError ?: [self errorWithDescription:@"WebSocket 重连次数已耗尽"];
        [self publishState:JobsOCWebSocketStateFailed
                     error:error];
        return;
    }
    self.reconnectAttempt += 1;
    NSTimeInterval delay = self.reconnectBaseDelay;
    for (NSInteger index = 1;
         index < self.reconnectAttempt;
         index++) {
        delay *= 2;
    }
    delay = MIN(delay, self.maximumReconnectDelay);
    delay = MAX(0, delay);
    [self publishState:JobsOCWebSocketStateReconnecting
                 error:lastError];
    [self publishReconnectAttempt:self.reconnectAttempt
                            delay:delay];
    __weak typeof(self) weakSelf = self;
    NSURL *URL = self.URL;
    dispatch_block_t workItem = dispatch_block_create(0, ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self ||
            self.manuallyDisconnected ||
            ![self.URL isEqual:URL]) return;
        self.reconnectWorkItem = nil;
        [self startConnectionWithURL:URL];
    });
    self.reconnectWorkItem = workItem;
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
        self.workQueue,
        workItem
    );
}

-(void)invalidateCurrentSocket{
    [self stopHeartbeat];
    SRWebSocket *socket = self.socket;
    self.socket = nil;
    socket.delegate = nil;
    [socket closeWithCode:SRStatusCodeGoingAway
                   reason:nil];
}
#pragma mark —— Heartbeat
-(void)startHeartbeat{
    [self stopHeartbeat];
    if (self.heartbeatInterval <= 0) return;
    dispatch_source_t timer = dispatch_source_create(
        DISPATCH_SOURCE_TYPE_TIMER,
        0,
        0,
        self.workQueue
    );
    uint64_t interval = (uint64_t)(self.heartbeatInterval * NSEC_PER_SEC);
    dispatch_source_set_timer(
        timer,
        dispatch_time(DISPATCH_TIME_NOW, interval),
        interval,
        NSEC_PER_SEC
    );
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(timer, ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self ||
            self.state != JobsOCWebSocketStateConnected ||
            self.socket.readyState != SR_OPEN) return;
        NSError *error = nil;
        if (![self.socket sendPing:nil error:&error]) {
            [self handleConnectionEndWithError:error];
        }
    });
    self.heartbeatTimer = timer;
    dispatch_resume(timer);
}

-(void)stopHeartbeat{
    if (!self.heartbeatTimer) return;
    dispatch_source_cancel(self.heartbeatTimer);
    self.heartbeatTimer = nil;
}
#pragma mark —— State
-(void)setupDefaults{
    _state = JobsOCWebSocketStateIdle;
    _reconnectEnabled = YES;
    _heartbeatInterval = 30;
    _reconnectBaseDelay = 1;
    _maximumReconnectDelay = 16;
    _maximumReconnectAttempts = 5;
    _workQueue = dispatch_queue_create(
        "com.jobs.oc-websocket.client",
        DISPATCH_QUEUE_SERIAL
    );
    dispatch_queue_set_specific(
        _workQueue,
        JobsOCWebSocketQueueKey,
        JobsOCWebSocketQueueKey,
        NULL
    );
}

-(void)publishState:(JobsOCWebSocketState)state
              error:(nullable NSError *)error{
    if (self.state == state) return;
    self.state = state;
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
        if ([delegate respondsToSelector:
             @selector(webSocketClient:didChangeState:error:)]) {
            [delegate webSocketClient:self
                       didChangeState:state
                                error:error];
        }
    });
}

-(void)publishReconnectAttempt:(NSInteger)attempt
                         delay:(NSTimeInterval)delay{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
        if ([delegate respondsToSelector:
             @selector(webSocketClient:willReconnectAtAttempt:afterDelay:)]) {
            [delegate webSocketClient:self
               willReconnectAtAttempt:attempt
                           afterDelay:delay];
        }
    });
}

-(void)publishText:(NSString *)text{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
        if ([delegate respondsToSelector:
             @selector(webSocketClient:didReceiveText:)]) {
            [delegate webSocketClient:self
                       didReceiveText:text];
        }
    });
}

-(void)publishData:(NSData *)data{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) self = weakSelf;
        if (!self) return;
        id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
        if ([delegate respondsToSelector:
             @selector(webSocketClient:didReceiveData:)]) {
            [delegate webSocketClient:self
                       didReceiveData:data];
        }
    });
}

-(void)cancelReconnect{
    if (self.reconnectWorkItem) {
        dispatch_block_cancel(self.reconnectWorkItem);
    }
    self.reconnectWorkItem = nil;
}

-(BOOL)sendBlock:(BOOL (^)(SRWebSocket *socket,
                           NSError * _Nullable __autoreleasing *error))sendBlock
           error:(NSError * _Nullable __autoreleasing *)error{
    __block BOOL sent = NO;
    __block NSError *sendError = nil;
    void (^work)(void) = ^{
        if (self.state != JobsOCWebSocketStateConnected ||
            self.socket.readyState != SR_OPEN) {
            sendError = [self errorWithDescription:@"WebSocket 尚未连接"];
            return;
        }
        sent = sendBlock(self.socket, &sendError);
    };
    if (dispatch_get_specific(JobsOCWebSocketQueueKey)) {
        work();
    } else {
        dispatch_sync(self.workQueue, work);
    }
    if (error) *error = sendError;
    return sent;
}

-(NSError *)errorWithDescription:(NSString *)description{
    return [NSError errorWithDomain:JobsOCWebSocketErrorDomain
                               code:-1
                           userInfo:@{NSLocalizedDescriptionKey:description}];
}
#pragma mark —— SRWebSocketDelegate
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
    if (self.socket != webSocket) return;
    self.reconnectAttempt = 0;
    [self publishState:JobsOCWebSocketStateConnected
                 error:nil];
    [self startHeartbeat];
}

-(void)webSocket:(SRWebSocket *)webSocket
didFailWithError:(NSError *)error{
    if (self.socket != webSocket) return;
    [self handleConnectionEndWithError:error];
}

-(void)webSocket:(SRWebSocket *)webSocket
didCloseWithCode:(NSInteger)code
          reason:(nullable NSString *)reason
        wasClean:(BOOL)wasClean{
    if (self.socket != webSocket) return;
    [self handleConnectionEndWithError:nil];
}

-(void)webSocket:(SRWebSocket *)webSocket
didReceiveMessageWithString:(NSString *)string{
    if (self.socket != webSocket) return;
    [self publishText:string];
}

-(void)webSocket:(SRWebSocket *)webSocket
didReceiveMessageWithData:(NSData *)data{
    if (self.socket != webSocket) return;
    [self publishData:data];
}

@end
