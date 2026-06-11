//
//  JobsGestureModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTUREMODEL_DSL_12EBEAA9A70D9427
#define JOBS_HEADER_GUARD_JOBSGESTUREMODEL_DSL_12EBEAA9A70D9427

#if __has_include(<JobsModel/JobsGestureModel.h>)
#import <JobsModel/JobsGestureModel.h>
#else
#import "JobsGestureModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureModel (DSL)

#pragma mark —— 来自 GestureProtocol
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSUInteger data))byMinimumNumberOfTouches;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSUInteger data))byMaximumNumberOfTouches;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSUInteger data))byNumberOfTapsRequired;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSUInteger data))byNumberOfTouchesRequired;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byMinimumPressDuration;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGFloat data))byAllowableMovement;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UISwipeGestureRecognizerDirection data))bySwipeGRDirection;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UIScrollTypeMask data))byAllowedScrollTypesMask;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGFloat data))byScale;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGFloat data))byRotate;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UILongPressGestureRecognizer * data))byLongPressGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UITapGestureRecognizer * data))byTapGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UITapGestureRecognizer * data))byDoubleTapGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UISwipeGestureRecognizer * data))bySwipeGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UIPanGestureRecognizer * data))byPanGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UIPinchGestureRecognizer * data))byPinchGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UIRotationGestureRecognizer * data))byRotationGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(UIScreenEdgePanGestureRecognizer * data))byScreenEdgePanGR;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byLongPressGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byTapGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byDoubleTapGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))bySwipeGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byPanGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byPinchGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byRotationGR_SelImp;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsSEL_IMP * data))byScreenEdgePanGR_SelImp;

#pragma mark —— 来自 BaseProtocol
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(SEL data))bySelector;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byTarget;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byWeak_target;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byData;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byRequestParams;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byModelData;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byData_weak;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak;

#pragma mark —— 来自 RACProtocol
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

#pragma mark —— 来自 TimerProtocol
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(id data))byUserInfo;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(BOOL data))byStop;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick;
-(__kindof JobsGestureModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTUREMODEL_DSL_12EBEAA9A70D9427 */
