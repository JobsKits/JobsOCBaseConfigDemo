//
//  JobsOCWebSocketClient.m
//  JobsOCWebSocket
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsOCWebSocketClient.h"
#import "SRWebSocket+Extra.h"

static NSString *const JobsOCWebSocketErrorDomain = @"JobsOCWebSocket";
static void *JobsOCWebSocketQueueKey = &JobsOCWebSocketQueueKey;

@interface SRWebSocket (JobsOCWebSocketDSL)

-(JobsRetIDByIDBlock _Nonnull)byDelegate;

@end

@implementation SRWebSocket (JobsOCWebSocketDSL)

-(JobsRetIDByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^id _Nullable(id<SRWebSocketDelegate> _Nullable delegate){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = delegate;
        return self;
    };
}

@end

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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCWebSocketClient
@interface JobsOCWebSocketClient (JobsPropertyDSLSetterAutogen_e2e2b28edb)
-(void)setHeartbeatTimer:(dispatch_source_t)data;
-(void)setManuallyDisconnected:(BOOL)data;
-(void)setReconnectAttempt:(NSInteger)data;
-(void)setReconnectWorkItem:(dispatch_block_t)data;
-(void)setSocket:(SRWebSocket * _Nullable)data;
-(void)setState:(JobsOCWebSocketState)data;
-(void)setURL:(NSURL * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCWebSocketClient

@implementation JobsOCWebSocketClient

-(JobsRetJobsOCWebSocketClientByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.setupDefaults();
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
    self.socket.byDelegate(nil);
    [self.socket closeWithCode:SRStatusCodeGoingAway
                       reason:nil];
}

-(jobsByVoidBlock _Nonnull)connect{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        dispatch_async(self.workQueue, ^{
            @jobs_strongify(self)
            if (!self) return;
            if (!self.URL) {
                [self publishState:JobsOCWebSocketStateFailed
                             error:self.errorWithDescription(@"WebSocket 地址不能为空")];
                return;
            }
            self.byManuallyDisconnected(NO);
            self.byReconnectAttempt(0);
            self.cancelReconnect();
            self.invalidateCurrentSocket();
            self.startConnectionWithURL(self.URL);
        });
    };
}

-(jobsByURLBlock _Nonnull)connectWithURL{
    @jobs_weakify(self)
    return ^(NSURL * URL){
        @jobs_strongify(self)
        if (!self) return;
        self.byURL(URL);
        [self connect]();
    };
}

-(jobsByVoidBlock _Nonnull)disconnect{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        dispatch_async(self.workQueue, ^{
            @jobs_strongify(self)
            if (!self) return;
            self.byManuallyDisconnected(YES);
            self.byReconnectAttempt(0);
            self.cancelReconnect();
            self.invalidateCurrentSocket();
            [self publishState:JobsOCWebSocketStateDisconnected
                         error:nil];
        });
    };
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
-(jobsByURLBlock _Nonnull)startConnectionWithURL{
    @jobs_weakify(self)
    return ^(NSURL * URL){
        @jobs_strongify(self)
        if (!self) return;
        [self publishState:JobsOCWebSocketStateConnecting
                     error:nil];
        SRWebSocket *socket = [[SRWebSocket alloc] initWithURL:URL];
        socket.byDelegate(self);
        socket.byDelegateDispatchQueue(self.workQueue);
        self.bySocket(socket);
        [socket open];
    };
}

-(jobsByErrBlock _Nonnull)handleConnectionEndWithError{
    @jobs_weakify(self)
    return ^(NSError * error){
        @jobs_strongify(self)
        if (!self) return;
        self.invalidateCurrentSocket();
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
        self.scheduleReconnectWithLastError(error);
    };
}

-(jobsByErrBlock _Nonnull)scheduleReconnectWithLastError{
    @jobs_weakify(self)
    return ^(NSError * lastError){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.URL ||
            self.reconnectAttempt >= self.maximumReconnectAttempts) {
            NSError *error = lastError ?: self.errorWithDescription(@"WebSocket 重连次数已耗尽");
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
        @jobs_weakify(self)
        NSURL *URL = self.URL;
        dispatch_block_t workItem = dispatch_block_create(0, ^{
            @jobs_strongify(self)
            if (!self ||
                self.manuallyDisconnected ||
                ![self.URL isEqual:URL]) return;
            self.byReconnectWorkItem(nil);
            self.startConnectionWithURL(URL);
        });
        self.byReconnectWorkItem(workItem);
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)),
            self.workQueue,
            workItem
        );
    };
}

-(jobsByVoidBlock _Nonnull)invalidateCurrentSocket{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopHeartbeat();
        SRWebSocket *socket = self.socket;
        self.socket = nil;
        socket.byDelegate(nil);
        [socket closeWithCode:SRStatusCodeGoingAway
                       reason:nil];
    };
}
#pragma mark —— Heartbeat
-(jobsByVoidBlock _Nonnull)startHeartbeat{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopHeartbeat();
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
        @jobs_weakify(self)
        dispatch_source_set_event_handler(timer, ^{
            @jobs_strongify(self)
            if (!self ||
                self.state != JobsOCWebSocketStateConnected ||
                self.socket.readyState != SR_OPEN) return;
            NSError *error = nil;
            if (![self.socket sendPing:nil error:&error]) {
                self.handleConnectionEndWithError(error);
            }
        });
        self.byHeartbeatTimer(timer);
        dispatch_resume(timer);
    };
}

-(jobsByVoidBlock _Nonnull)stopHeartbeat{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.heartbeatTimer) return;
        dispatch_source_cancel(self.heartbeatTimer);
        self.byHeartbeatTimer(nil);
    };
}
#pragma mark —— State
-(jobsByVoidBlock _Nonnull)setupDefaults{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(void)publishState:(JobsOCWebSocketState)state
              error:(nullable NSError *)error{
    if (self.state == state) return;
    self.byState(state);
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
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
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
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

-(jobsByStrBlock _Nonnull)publishText{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (!self) return;
            id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
            if ([delegate respondsToSelector:
                 @selector(webSocketClient:didReceiveText:)]) {
                [delegate webSocketClient:self
                           didReceiveText:text];
            }
        });
    };
}

-(jobsByDataBlock _Nonnull)publishData{
    @jobs_weakify(self)
    return ^(NSData * data){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (!self) return;
            id<JobsOCWebSocketClientDelegate> delegate = self.delegate;
            if ([delegate respondsToSelector:
                 @selector(webSocketClient:didReceiveData:)]) {
                [delegate webSocketClient:self
                           didReceiveData:data];
            }
        });
    };
}

-(jobsByVoidBlock _Nonnull)cancelReconnect{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.reconnectWorkItem) {
            dispatch_block_cancel(self.reconnectWorkItem);
        }
        self.byReconnectWorkItem(nil);
    };
}

-(BOOL)sendBlock:(BOOL (^)(SRWebSocket *socket,
                           NSError * _Nullable __autoreleasing *error))sendBlock
           error:(NSError * _Nullable __autoreleasing *)error{
    __block BOOL sent = NO;
    __block NSError *sendError = nil;
    void (^work)(void) = ^{
        if (self.state != JobsOCWebSocketStateConnected ||
            self.socket.readyState != SR_OPEN) {
            sendError = self.errorWithDescription(@"WebSocket 尚未连接");
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

-(JobsRetNSErrorByNSStringBlock _Nonnull)errorWithDescription{
    @jobs_weakify(self)
    return ^NSError *(NSString * description){
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSError errorWithDomain:JobsOCWebSocketErrorDomain
                                   code:-1
                               userInfo:@{NSLocalizedDescriptionKey:description}];
    };
}
#pragma mark —— SRWebSocketDelegate
-(jobsBySRWebSocketBlock _Nonnull)webSocketDidOpen{
    @jobs_weakify(self)
    return ^(SRWebSocket * webSocket){
        @jobs_strongify(self)
        if (!self) return;
        if (self.socket != webSocket) return;
        self.byReconnectAttempt(0);
        [self publishState:JobsOCWebSocketStateConnected
                     error:nil];
        self.startHeartbeat();
    };
}

-(void)webSocket:(SRWebSocket *)webSocket
didFailWithError:(NSError *)error{
    if (self.socket != webSocket) return;
    self.handleConnectionEndWithError(error);
}

-(void)webSocket:(SRWebSocket *)webSocket
didCloseWithCode:(NSInteger)code
          reason:(nullable NSString *)reason
        wasClean:(BOOL)wasClean{
    if (self.socket != webSocket) return;
    self.handleConnectionEndWithError(nil);
}

-(void)webSocket:(SRWebSocket *)webSocket
didReceiveMessageWithString:(NSString *)string{
    if (self.socket != webSocket) return;
    self.publishText(string);
}

-(void)webSocket:(SRWebSocket *)webSocket
didReceiveMessageWithData:(NSData *)data{
    if (self.socket != webSocket) return;
    self.publishData(data);
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCWebSocketClient
-(JobsRetJobsOCWebSocketClientByBOOLBlock _Nonnull)byManuallyDisconnected{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setManuallyDisconnected:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientByJobsOCWebSocketStateBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(JobsOCWebSocketState data){
        @jobs_strongify(self)
        [self setState:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientByNSIntegerBlock _Nonnull)byReconnectAttempt{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setReconnectAttempt:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientByNSURLBlock _Nonnull)byURL{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(NSURL * _Nullable data){
        @jobs_strongify(self)
        [self setURL:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientBySRWebSocketBlock _Nonnull)bySocket{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(SRWebSocket * _Nullable data){
        @jobs_strongify(self)
        [self setSocket:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientBydispatch_block_tBlock _Nonnull)byReconnectWorkItem{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(dispatch_block_t data){
        @jobs_strongify(self)
        [self setReconnectWorkItem:data];
        return self;
    };
}

-(JobsRetJobsOCWebSocketClientBydispatch_source_tBlock _Nonnull)byHeartbeatTimer{
    @jobs_weakify(self)
    return ^__kindof JobsOCWebSocketClient * _Nullable(dispatch_source_t data){
        @jobs_strongify(self)
        [self setHeartbeatTimer:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCWebSocketClient
@end
