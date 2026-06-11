//
//  JobsUserModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsUserModel+DSL.h"

@implementation JobsUserModel (DSL)

#pragma mark —— 来自 JobsUserModel
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserHeader{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.userHeader = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(UIImage * data))byUserHeaderIMG{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.userHeaderIMG = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserRacnkClass{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.userRacnkClass = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byToken{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.token = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byExpireTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.expireTime = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUid{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.uid = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byDeviceId{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.deviceId = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byValidate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.validate = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byResourcesAddress{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.resourcesAddress = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPostDraftURLStr{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.postDraftURLStr = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byAccount{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.account = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byDomain{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.domain = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byEmail{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.email = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byHeadImg{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.headImg = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteCode{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.inviteCode = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.name = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPhone{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.phone = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byQq{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.qq = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byRealName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.realName = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))bySuperiorAccount{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.superiorAccount = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSNumber * data))byUserId{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.userId = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byWebChat{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.webChat = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byTokenExpireTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.tokenExpireTime = data;
        return self;
    };
}

#pragma mark —— 来自 BaseProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(JobsTimer * data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSLock * data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSRecursiveLock * data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(dispatch_semaphore_t data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(WKUserContentController * data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(WKScriptMessage * data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(jobsJSCompletionHandlerBlock data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSMutableArray <NSURL *> * data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSMutableSet * data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSMutableArray * data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSMutableDictionary * data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(Class data))byCls{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(Class data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(SEL data))bySelector{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(SEL data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(IMP data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byTarget{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byWeak_target{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byData{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byRequestParams{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byModelData{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byData_weak{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

#pragma mark —— 来自 RACProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACDisposable * data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACSubject * data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACSignal * data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACCommand * data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACSequence * data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACMulticastConnection * data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(RACTuple * data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(jobsByIDBlock data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

#pragma mark —— 来自 TimerProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSInvocation * data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byUserInfo{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(NSTimer * data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(dispatch_source_t data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(CADisplayLink * data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(dispatch_queue_t data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byStop{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(jobsByCGFloatBlock data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish{
    @jobs_weakify(self)
    return ^__kindof JobsUserModel *_Nonnull(JobsTimerBlock data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

@end
