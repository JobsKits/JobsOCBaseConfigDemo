//
//  JobsUserModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_8D688D414A22DA33
#define JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_8D688D414A22DA33

#if __has_include(<JobsModel/JobsUserModel.h>)
#import <JobsModel/JobsUserModel.h>
#else
#import "JobsUserModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserModel (DSL)

#pragma mark —— 来自 JobsUserModel
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserHeader;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(UIImage * data))byUserHeaderIMG;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUserRacnkClass;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byToken;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byExpireTime;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byUid;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byDeviceId;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byValidate;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byResourcesAddress;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPostDraftURLStr;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byAccount;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byDomain;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byEmail;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byHeadImg;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteCode;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byName;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byPhone;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byQq;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byRealName;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))bySuperiorAccount;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSNumber * data))byUserId;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byWebChat;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byTokenExpireTime;

#pragma mark —— 来自 BaseProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimer * data))byTimer;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSLock * data))byLock;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSRecursiveLock * data))byRecursiveLock;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_semaphore_t data))bySemaphore;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byIsLock;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byIsRead;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byBecomeFirstResponder;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(AppLanguage data))byAppLanguage;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGPoint data))byLastContentOffset;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(WKUserContentController * data))byUserContentCtrl;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(WKScriptMessage * data))byScriptMsg;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byHandlerName;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byEvaluateJavaScript;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomUserAgent;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsJSCompletionHandlerBlock data))byCompletionHandlerBlock;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableArray <NSURL *> * data))byUrls;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSURL * data))byUrl;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSURL * data))byImageUrl;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSString * data))byInternationalizationKEY;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableSet * data))byJobsDataMutSet;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableArray * data))byJobsDataMutArr;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableDictionary * data))byJobsDataMutDic;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(Class data))byCls;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(SEL data))bySelector;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(IMP data))byImplementation;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byTarget;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byWeak_target;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byData;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byRequestParams;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byModelData;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGFloat data))byValue_CGFloat;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSInteger data))byValue_NSInteger;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSUInteger data))byValue_NSUInteger;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byData_weak;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byRequestParams_weak;

#pragma mark —— 来自 RACProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock;

#pragma mark —— 来自 TimerProtocol
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CGFloat data))byTime;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byStartTime;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeSecIntervalSinceDate;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSInvocation * data))byInvocation;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSRunLoopMode data))byRunLoopMode;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(id data))byUserInfo;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(ShowTimeType data))byShowTimeType;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerStyle data))byTimerStyle;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerType data))byTimerType;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byAccumulatedElapsed;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSDate * data))byLastStartDate;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(NSTimer * data))byNsTimer;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_source_t data))byGcdTimer;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(CADisplayLink * data))byDisplayLink;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(dispatch_queue_t data))byQueue;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerState data))byTimerState;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byRunning;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byPaused;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(BOOL data))byStop;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(jobsByCGFloatBlock data))byOnTick;
-(__kindof JobsUserModel *_Nonnull (^ _Nonnull)(JobsTimerBlock data))byOnFinish;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_8D688D414A22DA33 */
