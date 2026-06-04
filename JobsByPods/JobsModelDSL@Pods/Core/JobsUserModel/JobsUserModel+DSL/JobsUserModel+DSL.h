//
//  JobsUserModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_B0BFA02A943A6F
#define JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_B0BFA02A943A6F

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserModel (DSL)

-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserName;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserHeader;
-(JobsRetJobsUserModelByImageBlock _Nonnull)byUserHeaderIMG;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byUserRacnkClass;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byPassword;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byToken;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byExpireTime;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byUid;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byDeviceId;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byValidate;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byResourcesAddress;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byPostDraftURLStr;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byAccount;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byDomain;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byEmail;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byHeadImg;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byInviteCode;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byName;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byPhone;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byQq;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byRealName;
-(JobsRetJobsUserModelByStrBlock _Nonnull)bySuperiorAccount;
-(JobsRetJobsUserModelByNumberBlock _Nonnull)byUserId;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byWebChat;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byTokenExpireTime;
-(JobsRetJobsUserModelByRACDisposablePointerBlock _Nonnull)byRacDisposable;
-(JobsRetJobsUserModelByRACSubjectPointerBlock _Nonnull)byRacSubject;
-(JobsRetJobsUserModelByRACSignalPointerBlock _Nonnull)byReqSignal;
-(JobsRetJobsUserModelByRACCommandPointerBlock _Nonnull)byActionCommand;
-(JobsRetJobsUserModelByRACSequencePointerBlock _Nonnull)byDataSequence;
-(JobsRetJobsUserModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection;
-(JobsRetJobsUserModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler;
-(JobsRetJobsUserModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler;
-(JobsRetJobsUserModelByRACTuplePointerBlock _Nonnull)byDataTuple;
-(JobsRetJobsUserModelByNSMutableDictionaryKindofRACDisposablePointerKindofRACSignalPointerPointerBlock _Nonnull)bySignalDisposableMap;
-(JobsRetJobsUserModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock;
-(JobsRetJobsUserModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock;
-(JobsRetJobsUserModelByCGFloatBlock _Nonnull)byTime;
-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byStartTime;
-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byTimeSecIntervalSinceDate;
-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byTimeInterval;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byRepeats;
-(JobsRetJobsUserModelByNSInvocationPointerBlock _Nonnull)byInvocation;
-(JobsRetJobsUserModelByNSRunLoopModeBlock _Nonnull)byRunLoopMode;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byUserInfo;
-(JobsRetJobsUserModelByShowTimeTypeBlock _Nonnull)byShowTimeType;
-(JobsRetJobsUserModelByJobsTimerStyleBlock _Nonnull)byTimerStyle;
-(JobsRetJobsUserModelByJobsTimerTypeBlock _Nonnull)byTimerType;
-(JobsRetJobsUserModelByTimeIntervalBlock _Nonnull)byAccumulatedElapsed;
-(JobsRetJobsUserModelByDateBlock _Nonnull)byLastStartDate;
-(JobsRetJobsUserModelByNSTimerPointerBlock _Nonnull)byNsTimer;
-(JobsRetJobsUserModelByDispatch_source_tBlock _Nonnull)byGcdTimer;
-(JobsRetJobsUserModelByCADisplayLinkPointerBlock _Nonnull)byDisplayLink;
-(JobsRetJobsUserModelByDispatch_queue_tBlock _Nonnull)byQueue;
-(JobsRetJobsUserModelByJobsTimerStateBlock _Nonnull)byTimerState;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byRunning;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byPaused;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byStop;
-(JobsRetJobsUserModelByJobsByCGFloatBlockBlock _Nonnull)byOnTick;
-(JobsRetJobsUserModelByJobsTimerBlockBlock _Nonnull)byOnFinish;
-(JobsRetJobsUserModelByJobsTimerPointerBlock _Nonnull)byTimer;
-(JobsRetJobsUserModelByNSLockPointerBlock _Nonnull)byLock;
-(JobsRetJobsUserModelByNSRecursiveLockPointerBlock _Nonnull)byRecursiveLock;
-(JobsRetJobsUserModelByDispatch_semaphore_tBlock _Nonnull)bySemaphore;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byIsLock;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byIsRead;
-(JobsRetJobsUserModelByBOOLBlock _Nonnull)byBecomeFirstResponder;
-(JobsRetJobsUserModelByAppLanguageBlock _Nonnull)byAppLanguage;
-(JobsRetJobsUserModelByCGPointBlock _Nonnull)byLastContentOffset;
-(JobsRetJobsUserModelByWKUserContentControllerPointerBlock _Nonnull)byUserContentCtrl;
-(JobsRetJobsUserModelByWKScriptMessagePointerBlock _Nonnull)byScriptMsg;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byHandlerName;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byEvaluateJavaScript;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byCustomUserAgent;
-(JobsRetJobsUserModelByJobsJSCompletionHandlerBlockBlock _Nonnull)byCompletionHandlerBlock;
-(JobsRetJobsUserModelByNSMutableArrayNSURLPointerPointerBlock _Nonnull)byUrls;
-(JobsRetJobsUserModelByURLBlock _Nonnull)byUrl;
-(JobsRetJobsUserModelByURLBlock _Nonnull)byImageUrl;
-(JobsRetJobsUserModelByStrBlock _Nonnull)byInternationalizationKEY;
-(JobsRetJobsUserModelByMutableSetBlock _Nonnull)byJobsDataMutSet;
-(JobsRetJobsUserModelByNSMutableArrayPointerBlock _Nonnull)byJobsDataMutArr;
-(JobsRetJobsUserModelByNSMutableDictionaryPointerBlock _Nonnull)byJobsDataMutDic;
-(JobsRetJobsUserModelByClsBlock _Nonnull)byCls;
-(JobsRetJobsUserModelBySELBlock _Nonnull)bySelector;
-(JobsRetJobsUserModelByIMPBlock _Nonnull)byImplementation;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byTarget;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byWeak_target;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byData;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byRequestParams;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byModelData;
-(JobsRetJobsUserModelByCGFloatBlock _Nonnull)byValue_CGFloat;
-(JobsRetJobsUserModelByNSIntegerBlock _Nonnull)byValue_NSInteger;
-(JobsRetJobsUserModelByNSUIntegerBlock _Nonnull)byValue_NSUInteger;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byData_weak;
-(JobsRetJobsUserModelByIDBlock _Nonnull)byRequestParams_weak;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUSERMODEL_DSL_B0BFA02A943A6F */
