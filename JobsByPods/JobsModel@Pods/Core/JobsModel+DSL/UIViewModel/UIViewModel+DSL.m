//
//  UIViewModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIViewModel+DSL.h"

@implementation UIViewModel (DSL)

#pragma mark —— 来自 UIViewModelProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBlock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRetIDByIDBlock> * data))byJobsBlockMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <JobsRetIDByIDBlock> * data) {
        @jobs_strongify(self)
        self.jobsBlockMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalImageURLString = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalImageURL{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalImageURL = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byNormalBgImageURLString{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.normalBgImageURLString = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byNormalBgImageURL{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.normalBgImageURL = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIImage * data))byTitleImage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.titleImage = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByMASConstraintMakerBlock data))byMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByMASConstraintMakerBlock data) {
        @jobs_strongify(self)
        self.masonryBlock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGRect data))byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGRect data) {
        @jobs_strongify(self)
        self.imageViewFrame = data;
        return self;
    };
}

#pragma mark —— 来自 BaseLayerProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.cornerRadiusValue = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byRoundingCorners{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.roundingCorners = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byRoundingCornersRadii{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.roundingCornersRadii = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerBorderCor = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.borderWidth = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byMasksToBounds{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.masksToBounds = data;
        return self;
    };
}

#pragma mark —— 来自 AppToolsProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.viewModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byViewModel_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.viewModel_weak = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.buttonModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))bySubButtonModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.subButtonModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))byTextModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.textModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))bySubTextModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.subTextModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UITextModel * data))byBackBtnTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UITextModel * data) {
        @jobs_strongify(self)
        self.backBtnTitleModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIViewModel *> * data))byViewModels{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <__kindof UIViewModel *> * data) {
        @jobs_strongify(self)
        self.viewModels = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <__kindof UIButtonModel *> * data))byButtonModels{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <__kindof UIButtonModel *> * data) {
        @jobs_strongify(self)
        self.buttonModels = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))byTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.titleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.subTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.selectedTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <JobsRichTextConfig *> * data))bySelectedSubTitleAttributedDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <JobsRichTextConfig *> * data) {
        @jobs_strongify(self)
        self.selectedSubTitleAttributedDataMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byBackBtn{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIButton * data) {
        @jobs_strongify(self)
        self.backBtn = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byCloseBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.closeBtnModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIButtonModel * data))byBackBtnModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIButtonModel * data) {
        @jobs_strongify(self)
        self.backBtnModel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIViewModel * data))byTitleModel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIViewModel * data) {
        @jobs_strongify(self)
        self.titleModel = data;
        return self;
    };
}

#pragma mark —— 来自 BaseProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsTimer * data) {
        @jobs_strongify(self)
        self.timer = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSLock * data) {
        @jobs_strongify(self)
        self.lock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSRecursiveLock * data) {
        @jobs_strongify(self)
        self.recursiveLock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(dispatch_semaphore_t data) {
        @jobs_strongify(self)
        self.semaphore = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isLock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isRead = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.becomeFirstResponder = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(AppLanguage data) {
        @jobs_strongify(self)
        self.appLanguage = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGPoint data) {
        @jobs_strongify(self)
        self.lastContentOffset = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(WKUserContentController * data) {
        @jobs_strongify(self)
        self.userContentCtrl = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(WKScriptMessage * data) {
        @jobs_strongify(self)
        self.scriptMsg = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.handlerName = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.evaluateJavaScript = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customUserAgent = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsJSCompletionHandlerBlock data) {
        @jobs_strongify(self)
        self.completionHandlerBlock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <NSURL *> * data) {
        @jobs_strongify(self)
        self.urls = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.url = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSURL * data) {
        @jobs_strongify(self)
        self.imageUrl = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.internationalizationKEY = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableSet * data) {
        @jobs_strongify(self)
        self.jobsDataMutSet = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray * data) {
        @jobs_strongify(self)
        self.jobsDataMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableDictionary * data) {
        @jobs_strongify(self)
        self.jobsDataMutDic = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(Class data))byCls{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(Class data) {
        @jobs_strongify(self)
        self.cls = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(SEL data))bySelector{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(SEL data) {
        @jobs_strongify(self)
        self.selector = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(IMP data) {
        @jobs_strongify(self)
        self.implementation = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byTarget{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.target = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byWeak_target{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.weak_target = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byData{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byRequestParams{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byModelData{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.modelData = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.value_CGFloat = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.value_NSInteger = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSUInteger data) {
        @jobs_strongify(self)
        self.value_NSUInteger = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byData_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.data_weak = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.requestParams_weak = data;
        return self;
    };
}

#pragma mark —— 来自 RACProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACDisposable * data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACSubject * data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACSignal * data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACCommand * data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACSequence * data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACMulticastConnection * data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(RACTuple * data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByIDBlock data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

#pragma mark —— 来自 TimerProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.startTime = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeSecIntervalSinceDate = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSInvocation * data) {
        @jobs_strongify(self)
        self.invocation = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSRunLoopMode data) {
        @jobs_strongify(self)
        self.runLoopMode = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(id data))byUserInfo{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(ShowTimeType data) {
        @jobs_strongify(self)
        self.showTimeType = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsTimerStyle data) {
        @jobs_strongify(self)
        self.timerStyle = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsTimerType data) {
        @jobs_strongify(self)
        self.timerType = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.accumulatedElapsed = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.lastStartDate = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSTimer * data) {
        @jobs_strongify(self)
        self.nsTimer = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(dispatch_source_t data) {
        @jobs_strongify(self)
        self.gcdTimer = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CADisplayLink * data) {
        @jobs_strongify(self)
        self.displayLink = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(dispatch_queue_t data) {
        @jobs_strongify(self)
        self.queue = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsTimerState data) {
        @jobs_strongify(self)
        self.timerState = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.running = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.paused = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byStop{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.stop = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByCGFloatBlock data) {
        @jobs_strongify(self)
        self.onTick = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsTimerBlock data) {
        @jobs_strongify(self)
        self.onFinish = data;
        return self;
    };
}

#pragma mark —— 来自 BaseViewProtocol
-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIActivityIndicatorView * data))byActivityIndicatorView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIActivityIndicatorView * data) {
        @jobs_strongify(self)
        self.activityIndicatorView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIStackView * data))byStackView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIStackView * data) {
        @jobs_strongify(self)
        self.stackView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byViewer{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.viewer = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UICollectionView * data))byCollectionView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UICollectionView * data) {
        @jobs_strongify(self)
        self.collectionView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITableView * data))byTableView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UITableView * data) {
        @jobs_strongify(self)
        self.tableView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIScrollView * data))byScrollView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIScrollView * data) {
        @jobs_strongify(self)
        self.scrollView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof WKWebView * data))byWebView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof WKWebView * data) {
        @jobs_strongify(self)
        self.webView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof PDFView * data))byPdfView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof PDFView * data) {
        @jobs_strongify(self)
        self.pdfView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIImageView * data))byImageView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIImageView * data) {
        @jobs_strongify(self)
        self.imageView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UIButton * data))byButton{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UIButton * data) {
        @jobs_strongify(self)
        self.button = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))byLabel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UILabel * data) {
        @jobs_strongify(self)
        self.label = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UILabel * data))bySubLabel{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UILabel * data) {
        @jobs_strongify(self)
        self.subLabel = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITextView * data))byTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UITextView * data) {
        @jobs_strongify(self)
        self.textView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof SZTextView * data))bySzTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof SZTextView * data) {
        @jobs_strongify(self)
        self.szTextView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.textField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsTextView * data))byJobsTextView{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof JobsTextView * data) {
        @jobs_strongify(self)
        self.jobsTextView = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsMagicTextField * data))byMagicTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof JobsMagicTextField * data) {
        @jobs_strongify(self)
        self.magicTextField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof ZYTextField * data))byZyTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof ZYTextField * data) {
        @jobs_strongify(self)
        self.zyTextField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof HQTextField * data))byHqTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof HQTextField * data) {
        @jobs_strongify(self)
        self.hqTextField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof CJTextField * data))byCjTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof CJTextField * data) {
        @jobs_strongify(self)
        self.cjTextField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(__kindof JobsTextField * data))byJobsTextField{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(__kindof JobsTextField * data) {
        @jobs_strongify(self)
        self.jobsTextField = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAllowDrag{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isAllowDrag = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsRetIDByIDBlock data))byJobsBackBlock{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsRetIDByIDBlock data) {
        @jobs_strongify(self)
        self.jobsBackBlock = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIRectCorner data))byLayoutSubviewsRectCorner{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIRectCorner data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCorner = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byLayoutSubviewsRectCornerSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.layoutSubviewsRectCornerSize = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerCor{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(UIColor * data) {
        @jobs_strongify(self)
        self.layerCor = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(NSMutableArray <MASConstraint *> * data))byConstraintMutArr{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(NSMutableArray <MASConstraint *> * data) {
        @jobs_strongify(self)
        self.constraintMutArr = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(CGSize data))byThisViewSize{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(CGSize data) {
        @jobs_strongify(self)
        self.thisViewSize = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(JobsHeaderFooterViewStyle data))byHeaderFooterViewStyle{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(JobsHeaderFooterViewStyle data) {
        @jobs_strongify(self)
        self.headerFooterViewStyle = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byBackBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.backBtnClickAction = data;
        return self;
    };
}

-(__kindof UIViewModel *_Nonnull (^ _Nonnull)(jobsByBtnBlock data))byCloseBtnClickAction{
    @jobs_weakify(self)
    return ^__kindof UIViewModel *_Nonnull(jobsByBtnBlock data) {
        @jobs_strongify(self)
        self.closeBtnClickAction = data;
        return self;
    };
}

@end
