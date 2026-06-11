//
//  JobsNetworkSource+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsNetworkSource+DSL.h"

@implementation JobsNetworkSource (DSL)

#pragma mark —— 来自 JobsNetworkSource
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsNetworkSourceType data))byType{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsNetworkSourceType data) {
        @jobs_strongify(self)
        self.type = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byDisplayName{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.displayName = data;
        return self;
    };
}

#pragma mark —— 来自 BaseProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsTimer * data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSLock * data))byLock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSLock * data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSRecursiveLock * data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(dispatch_semaphore_t data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(WKUserContentController * data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(WKScriptMessage * data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(jobsJSCompletionHandlerBlock data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSMutableArray <NSURL *> * data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSURL * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSMutableSet * data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSMutableArray * data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSMutableDictionary * data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(Class data))byCls{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(Class data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(SEL data))bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(SEL data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(IMP data))byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(IMP data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byData{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

#pragma mark —— 来自 RACProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACDisposable * data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACSubject * data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACSignal * data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACCommand * data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACSequence * data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACMulticastConnection * data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(RACTuple * data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(jobsByIDBlock data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

#pragma mark —— 来自 TimerProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGFloat data))byTime{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSInvocation * data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(id data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(NSTimer * data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(dispatch_source_t data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(CADisplayLink * data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(dispatch_queue_t data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byStop{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(jobsByCGFloatBlock data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsNetworkSource *_Nonnull(JobsTimerBlock data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

@end
