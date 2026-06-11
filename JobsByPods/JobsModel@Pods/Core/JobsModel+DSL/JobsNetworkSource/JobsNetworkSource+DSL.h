//
//  JobsNetworkSource+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSNETWORKSOURCE_DSL_28AD53CEBBC290BB
#define JOBS_HEADER_GUARD_JOBSNETWORKSOURCE_DSL_28AD53CEBBC290BB

#if __has_include(<JobsModel/JobsNetworkSource.h>)
#import <JobsModel/JobsNetworkSource.h>
#else
#import "JobsNetworkSource.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsNetworkSource (DSL)

#pragma mark —— 来自 JobsNetworkSource
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsNetworkSourceType data))byType;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byDisplayName;

#pragma mark —— 来自 BaseProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSLock * data))byLock;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byIsLock;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byIsRead;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(SEL data))bySelector;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(IMP data))byImplementation;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byTarget;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byWeak_target;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byData;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byRequestParams;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byModelData;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byData_weak;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak;

#pragma mark —— 来自 RACProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

#pragma mark —— 来自 TimerProtocol
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CGFloat data))byTime;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(id data))byUserInfo;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byRunning;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byPaused;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(BOOL data))byStop;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick;
-(__kindof JobsNetworkSource *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSNETWORKSOURCE_DSL_28AD53CEBBC290BB */
