//
//  JobsUserModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsUserModel+DSL.h"

@implementation JobsUserModel (DSL)

-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserHeader{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.userHeader = data;
        return self;
    };
}

-(JobsRetJobsUserModelByImageBlock _Nonnull)byUserHeaderIMG{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.userHeaderIMG = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserRacnkClass{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.userRacnkClass = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byPassword{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byToken{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.token = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byExpireTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.expireTime = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byUid{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.uid = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byDeviceId{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.deviceId = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byValidate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.validate = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byResourcesAddress{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.resourcesAddress = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byPostDraftURLStr{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.postDraftURLStr = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byAccount{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.account = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byDomain{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.domain = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byEmail{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.email = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byHeadImg{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.headImg = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byInviteCode{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.inviteCode = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byPhone{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.phone = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byQq{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.qq = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byRealName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.realName = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)bySuperiorAccount{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.superiorAccount = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNumberBlock _Nonnull)byUserId{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.userId = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byWebChat{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.webChat = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byTokenExpireTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.tokenExpireTime = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetJobsUserModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByCGFloatBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSInvocationPointerBlock _Nonnull)byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSInvocation * _Nullable data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetJobsUserModelByShowTimeTypeBlock _Nonnull)byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsTimerStyleBlock _Nonnull)byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsTimerTypeBlock _Nonnull)byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(JobsRetJobsUserModelByDateBlock _Nonnull)byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSTimerPointerBlock _Nonnull)byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSTimer * _Nullable data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(JobsRetJobsUserModelByDispatch_source_tBlock _Nonnull)byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(dispatch_source_t _Nullable data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(JobsRetJobsUserModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(CADisplayLink * _Nullable data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(JobsRetJobsUserModelByDispatch_queue_tBlock _Nonnull)byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(dispatch_queue_t _Nullable data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsTimerStateBlock _Nonnull)byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byStop{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(jobsByCGFloatBlock _Nullable data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsTimerBlockBlock _Nonnull)byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(JobsTimerBlock _Nullable data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsTimerPointerBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(JobsTimer * _Nullable data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSLockPointerBlock _Nonnull)byLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSLock * _Nullable data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSRecursiveLock * _Nullable data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(dispatch_semaphore_t _Nullable data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(JobsRetJobsUserModelByAppLanguageBlock _Nonnull)byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(JobsRetJobsUserModelByCGPointBlock _Nonnull)byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(JobsRetJobsUserModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(WKUserContentController * _Nullable data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(JobsRetJobsUserModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(WKScriptMessage * _Nullable data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(JobsRetJobsUserModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(jobsJSCompletionHandlerBlock _Nullable data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSMutableArray <NSURL *> * _Nullable data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(JobsRetJobsUserModelByURLBlock _Nonnull)byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(JobsRetJobsUserModelByURLBlock _Nonnull)byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSURL * _Nullable data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(JobsRetJobsUserModelByStrBlock _Nonnull)byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(JobsRetJobsUserModelByMutableSetBlock _Nonnull)byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSMutableSet * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSMutableDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(JobsRetJobsUserModelByClsBlock _Nonnull)byCls{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(Class _Nullable data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(JobsRetJobsUserModelBySELBlock _Nonnull)bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(SEL _Nullable data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIMPBlock _Nonnull)byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(IMP _Nullable data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byData{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(JobsRetJobsUserModelByCGFloatBlock _Nonnull)byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSIntegerBlock _Nonnull)byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(JobsRetJobsUserModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(JobsRetJobsUserModelByIDBlock _Nonnull)byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}
@end
