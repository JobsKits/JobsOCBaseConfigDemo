//
//  ReactiveObjC+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_REACTIVEOBJC_DSL_6D7A2B07E9
#define JOBS_HEADER_GUARD_REACTIVEOBJC_DSL_6D7A2B07E9

#import <objc/message.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#elif __has_include("ReactiveObjC.h")
#import "ReactiveObjC.h"
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark —— NSObject.racDisposable
@interface NSObject (JobsRACDisposableChain)
/// 将 RACDisposable 绑定到对象的 racDisposable 属性，便于写成 obj.byRacDisposable(disposable)。
-(JobsRetIDByRACDisposableBlock _Nonnull)byRacDisposable;
@end


#pragma mark —— RACDisposable
@interface RACDisposable (JobsChain)
+(JobsRetRACDisposableByVoidCallbackBlock _Nonnull)byDisposable;
-(JobsRetBOOLByVoidBlock _Nonnull)byDisposed;
-(JobsRetRACDisposableByVoidBlock _Nonnull)byDispose;
-(JobsRetRACScopedDisposableByVoidBlock _Nonnull)byScopedDisposable;
@end

#pragma mark —— RACScopedDisposable
@interface RACScopedDisposable (JobsChain)
+(JobsRetRACScopedDisposableByRACDisposableBlock _Nonnull)byScopedDisposable;
@end

#pragma mark —— RACCompoundDisposable
@interface RACCompoundDisposable (JobsChain)
+(JobsRetRACCompoundDisposableByVoidBlock _Nonnull)byCompoundDisposable;
+(JobsRetRACCompoundDisposableByArrBlock _Nonnull)byCompoundDisposableByDisposables;
-(JobsRetRACCompoundDisposableByRACDisposableBlock _Nonnull)byAddDisposable;
-(JobsRetRACCompoundDisposableByRACDisposableBlock _Nonnull)byRemoveDisposable;
@end

#pragma mark —— RACCommand
@interface RACCommand (JobsChain)
+(JobsRetRACCommandByRACSignalValueBlock _Nonnull)bySignalBlock;
-(JobsRetRACSignalByVoidBlock _Nonnull)byExecutionSignals;
-(JobsRetRACSignalByVoidBlock _Nonnull)byExecuting;
-(JobsRetRACSignalByVoidBlock _Nonnull)byEnabled;
-(JobsRetRACSignalByVoidBlock _Nonnull)byErrors;
-(JobsRetRACCommandByBOOLBlock _Nonnull)byAllowsConcurrentExecution;
-(JobsRetRACSignalByIDBlock _Nonnull)byExecute;
@end

#pragma mark —— RACSignal
@interface RACSignal (JobsChain)
+(JobsRetRACSignalByIDBlock _Nonnull)byReturn;
+(JobsRetRACSignalByNSErrorBlock _Nonnull)byError;
+(JobsRetRACSignalByVoidBlock _Nonnull)byNever;
+(JobsRetRACSignalByVoidBlock _Nonnull)byEmpty;
+(JobsRetRACSignalByIDBlock _Nonnull)byZip;
+(JobsRetRACSignalByIDBlock _Nonnull)byConcat;
+(JobsRetRACSignalByIDBlock _Nonnull)byCombineLatest;
+(JobsRetRACSignalByIDBlock _Nonnull)byMerge;
+(JobsRetRACSignalByRACIDErrorTransformBlock _Nonnull)byTry;
+(JobsRetRACSignalByRACSignalProviderBlock _Nonnull)byDefer;

-(JobsRetRACSequenceByVoidBlock _Nonnull)bySequence;
-(JobsRetRACSignalByVoidBlock _Nonnull)byFlatten;
-(JobsRetRACSignalByVoidBlock _Nonnull)byDistinctUntilChanged;
-(JobsRetRACSignalByVoidBlock _Nonnull)byLogAll;
-(JobsRetRACSignalByVoidBlock _Nonnull)byLogNext;
-(JobsRetRACSignalByVoidBlock _Nonnull)byLogError;
-(JobsRetRACSignalByVoidBlock _Nonnull)byLogCompleted;
-(JobsRetRACSignalByVoidBlock _Nonnull)byRepeat;
-(JobsRetRACSignalByVoidBlock _Nonnull)byCollect;
-(JobsRetRACSignalByVoidBlock _Nonnull)byConcatInnerSignals;
-(JobsRetIDByVoidBlock _Nonnull)byFirst;
-(JobsRetRACSignalByVoidBlock _Nonnull)bySwitchToLatest;
-(JobsRetRACMulticastConnectionByVoidBlock _Nonnull)byPublish;
-(JobsRetRACSignalByVoidBlock _Nonnull)byReplay;
-(JobsRetRACSignalByVoidBlock _Nonnull)byReplayLast;
-(JobsRetRACSignalByVoidBlock _Nonnull)byReplayLazily;
-(JobsRetRACSignalByVoidBlock _Nonnull)byDeliverOnMainThread;
-(JobsRetRACSignalByVoidBlock _Nonnull)byAny;
-(JobsRetRACSignalByVoidBlock _Nonnull)byRetry;
-(JobsRetRACSignalByVoidBlock _Nonnull)byIgnoreValues;
-(JobsRetRACSignalByVoidBlock _Nonnull)byMaterialize;
-(JobsRetRACSignalByVoidBlock _Nonnull)byDematerialize;
-(JobsRetRACSignalByVoidBlock _Nonnull)byNot;
-(JobsRetRACSignalByVoidBlock _Nonnull)byAnd;
-(JobsRetRACSignalByVoidBlock _Nonnull)byOr;
-(JobsRetRACSignalByVoidBlock _Nonnull)byReduceApply;

-(JobsRetRACSignalByRACBindBlockProviderBlock _Nonnull)byBind;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byConcatSignal;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byZipWith;
-(JobsRetRACSignalByRACSignalValueBlock _Nonnull)byFlattenMap;
-(JobsRetRACSignalByRACIDTransformBlock _Nonnull)byMap;
-(JobsRetRACSignalByIDBlock _Nonnull)byMapReplace;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byFilter;
-(JobsRetRACSignalByIDBlock _Nonnull)byIgnore;
-(JobsRetRACSignalByIDBlock _Nonnull)byReduceEach;
-(JobsRetRACSignalByIDBlock _Nonnull)byStartWith;
-(JobsRetRACSignalByNSUIntegerBlock _Nonnull)bySkip;
-(JobsRetRACSignalByNSUIntegerBlock _Nonnull)byTake;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byTakeUntilBlock;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byTakeWhileBlock;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)bySkipUntilBlock;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)bySkipWhileBlock;
-(JobsRetRACDisposableByRACSubscriberBlock _Nonnull)bySubscribe;
-(JobsRetRACDisposableByRACNextBlock _Nonnull)bySubscribeNext;
-(JobsRetRACDisposableByRACErrorBlock _Nonnull)bySubscribeError;
-(JobsRetRACDisposableByRACCompletedBlock _Nonnull)bySubscribeCompleted;
-(JobsRetRACSignalByRACNextBlock _Nonnull)byDoNext;
-(JobsRetRACSignalByRACErrorBlock _Nonnull)byDoError;
-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byDoCompleted;
-(JobsRetRACSignalByTimeIntervalBlock _Nonnull)byThrottle;
-(JobsRetRACSignalByTimeIntervalBlock _Nonnull)byDelay;
-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byInitially;
-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byFinally;
-(JobsRetRACSignalByNSUIntegerBlock _Nonnull)byTakeLast;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byCombineLatestWith;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byMergeSignal;
-(JobsRetRACSignalByNSUIntegerBlock _Nonnull)byFlattenMaxConcurrent;
-(JobsRetRACSignalByRACSignalProviderBlock _Nonnull)byThen;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byTakeUntil;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byTakeUntilReplacement;
-(JobsRetRACSignalByRACSignalErrorBlock _Nonnull)byCatch;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)byCatchTo;
-(JobsRetRACSignalByRACBoolErrorPredicateBlock _Nonnull)byTryFilter;
-(JobsRetRACSignalByRACIDErrorTransformBlock _Nonnull)byTryMap;
-(JobsRetIDByIDBlock _Nonnull)byFirstOrDefault;
-(JobsRetRACMulticastConnectionByRACSubjectBlock _Nonnull)byMulticast;
-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)byDeliverOn;
-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)bySubscribeOn;
-(JobsRetRACSignalByRACIDTransformBlock _Nonnull)byGroupBy;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byAnyPassingTest;
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byAll;
-(JobsRetRACSignalByNSIntegerBlock _Nonnull)byRetryCount;
-(JobsRetRACSignalByRACSignalBlock _Nonnull)bySample;
@end

#pragma mark —— RACSubject / RACReplaySubject
@interface RACSubject (JobsChain)
+(JobsRetRACSubjectByVoidBlock _Nonnull)bySubject;
-(JobsRetRACSubjectByIDBlock _Nonnull)bySendNext;
-(JobsRetRACSubjectByNSErrorBlock _Nonnull)bySendError;
-(JobsRetRACSubjectByVoidBlock _Nonnull)bySendCompleted;
@end

@interface RACReplaySubject (JobsChain)
+(JobsRetRACReplaySubjectByNSUIntegerBlock _Nonnull)byReplaySubjectWithCapacity;
@end

#pragma mark —— RACMulticastConnection
@interface RACMulticastConnection (JobsChain)
-(JobsRetRACSignalByVoidBlock _Nonnull)bySignal;
-(JobsRetRACDisposableByVoidBlock _Nonnull)byConnect;
-(JobsRetRACSignalByVoidBlock _Nonnull)byAutoconnect;
@end

#pragma mark —— RACScheduler
@interface RACScheduler (JobsChain)
+(JobsRetRACSchedulerByVoidBlock _Nonnull)byImmediateScheduler;
+(JobsRetRACSchedulerByVoidBlock _Nonnull)byMainThreadScheduler;
+(JobsRetRACSchedulerByVoidBlock _Nonnull)byScheduler;
+(JobsRetRACSchedulerByVoidBlock _Nonnull)byCurrentScheduler;
+(JobsRetRACSchedulerByNSIntegerBlock _Nonnull)bySchedulerWithPriority;
-(JobsRetRACDisposableByVoidCallbackForSchedulerBlock _Nonnull)bySchedule;
-(JobsRetRACDisposableBySchedulerRecursiveBlock _Nonnull)byScheduleRecursiveBlock;
@end

#pragma mark —— RACSequence
@interface RACSequence (JobsChain)
+(JobsRetRACSequenceByIDBlock _Nonnull)byReturn;
+(JobsRetRACSequenceByVoidBlock _Nonnull)byEmpty;
+(JobsRetRACSequenceByIDBlock _Nonnull)byZip;
+(JobsRetRACSequenceByIDBlock _Nonnull)byConcat;

-(JobsRetIDByVoidBlock _Nonnull)byHead;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byTail;
-(JobsRetArrByVoidBlock _Nonnull)byArray;
-(JobsRetIDByVoidBlock _Nonnull)byObjectEnumerator;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byEagerSequence;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byLazySequence;
-(JobsRetRACSignalByVoidBlock _Nonnull)bySignal;
-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)bySignalWithScheduler;
-(JobsRetRACSequenceByRACBindBlockProviderBlock _Nonnull)byBind;
-(JobsRetRACSequenceByRACSequenceBlock _Nonnull)byConcatSequence;
-(JobsRetRACSequenceByRACSequenceBlock _Nonnull)byZipWith;
-(JobsRetRACSequenceByRACSequenceValueBlock _Nonnull)byFlattenMap;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byFlatten;
-(JobsRetRACSequenceByRACIDTransformBlock _Nonnull)byMap;
-(JobsRetRACSequenceByIDBlock _Nonnull)byMapReplace;
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)byFilter;
-(JobsRetRACSequenceByIDBlock _Nonnull)byIgnore;
-(JobsRetRACSequenceByIDBlock _Nonnull)byReduceEach;
-(JobsRetRACSequenceByIDBlock _Nonnull)byStartWith;
-(JobsRetRACSequenceByNSUIntegerBlock _Nonnull)bySkip;
-(JobsRetRACSequenceByNSUIntegerBlock _Nonnull)byTake;
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)byTakeUntilBlock;
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)byTakeWhileBlock;
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)bySkipUntilBlock;
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)bySkipWhileBlock;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byDistinctUntilChanged;
-(JobsRetBOOLByRACBoolPredicateBlock _Nonnull)byAny;
-(JobsRetBOOLByRACBoolPredicateBlock _Nonnull)byAll;
-(JobsRetIDByRACBoolPredicateBlock _Nonnull)byObjectPassingTest;
@end

#pragma mark —— RACTuple
@interface RACTuple (JobsChain)
+(JobsRetRACTupleByArrBlock _Nonnull)byTupleWithObjectsFromArray;
-(JobsRetNSUIntegerByVoidBlock _Nonnull)byCount;
-(JobsRetIDByVoidBlock _Nonnull)byFirst;
-(JobsRetIDByVoidBlock _Nonnull)bySecond;
-(JobsRetIDByVoidBlock _Nonnull)byThird;
-(JobsRetIDByVoidBlock _Nonnull)byFourth;
-(JobsRetIDByVoidBlock _Nonnull)byFifth;
-(JobsRetIDByVoidBlock _Nonnull)byLast;
-(JobsRetIDByUIntegerBlock _Nonnull)byObjectAtIndex;
-(JobsRetArrByVoidBlock _Nonnull)byAllObjects;
-(JobsRetRACTupleByIDBlock _Nonnull)byTupleByAddingObject;
-(JobsRetRACSequenceByVoidBlock _Nonnull)byRacSequence;
@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_REACTIVEOBJC_DSL_6D7A2B07E9 */
