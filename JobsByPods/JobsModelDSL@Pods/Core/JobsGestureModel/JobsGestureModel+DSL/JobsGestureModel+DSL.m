//
//  JobsGestureModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsGestureModel+DSL.h"

@implementation JobsGestureModel (DSL)

-(JobsRetJobsGestureModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsGestureModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSUIntegerBlock _Nonnull)byMinimumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.minimumNumberOfTouches = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSUIntegerBlock _Nonnull)byMaximumNumberOfTouches{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.maximumNumberOfTouches = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSUIntegerBlock _Nonnull)byNumberOfTapsRequired{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.numberOfTapsRequired = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByNSUIntegerBlock _Nonnull)byNumberOfTouchesRequired{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.numberOfTouchesRequired = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByTimeIntervalBlock _Nonnull)byMinimumPressDuration{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.minimumPressDuration = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGFloatBlock _Nonnull)byAllowableMovement{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.allowableMovement = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUISwipeGestureRecognizerDirectionBlock _Nonnull)bySwipeGRDirection{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UISwipeGestureRecognizerDirection data) {
        @jobs_strongify(self)
        self.swipeGRDirection = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUIScrollTypeMaskBlock _Nonnull)byAllowedScrollTypesMask{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UIScrollTypeMask data) {
        @jobs_strongify(self)
        self.allowedScrollTypesMask = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGFloatBlock _Nonnull)byScale{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.scale = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByCGFloatBlock _Nonnull)byRotate{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.rotate = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUILongPressGestureRecognizerPointerBlock _Nonnull)byLongPressGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UILongPressGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.longPressGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUITapGestureRecognizerPointerBlock _Nonnull)byTapGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UITapGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.tapGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUITapGestureRecognizerPointerBlock _Nonnull)byDoubleTapGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UITapGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.doubleTapGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUISwipeGestureRecognizerPointerBlock _Nonnull)bySwipeGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UISwipeGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.swipeGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUIPanGestureRecognizerPointerBlock _Nonnull)byPanGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UIPanGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.panGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUIPinchGestureRecognizerPointerBlock _Nonnull)byPinchGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UIPinchGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.pinchGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUIRotationGestureRecognizerPointerBlock _Nonnull)byRotationGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UIRotationGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.rotationGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByUIScreenEdgePanGestureRecognizerPointerBlock _Nonnull)byScreenEdgePanGR{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(UIScreenEdgePanGestureRecognizer * _Nullable data) {
        @jobs_strongify(self)
        self.screenEdgePanGR = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byLongPressGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.longPressGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byTapGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.tapGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byDoubleTapGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.doubleTapGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)bySwipeGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.swipeGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byPanGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.panGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byPinchGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.pinchGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byRotationGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.rotationGR_SelImp = data;
        return self;
    };
}

-(JobsRetJobsGestureModelByJobsSEL_IMPPointerBlock _Nonnull)byScreenEdgePanGR_SelImp{
    @jobs_weakify(self)
    return ^__kindof JobsGestureModel *_Nullable(JobsSEL_IMP * _Nullable data) {
        @jobs_strongify(self)
        self.screenEdgePanGR_SelImp = data;
        return self;
    };
}

@end
