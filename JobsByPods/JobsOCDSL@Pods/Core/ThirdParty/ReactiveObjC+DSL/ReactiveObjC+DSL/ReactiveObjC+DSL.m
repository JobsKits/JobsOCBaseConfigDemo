//
//  ReactiveObjC+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "ReactiveObjC+DSL.h"
#import <objc/message.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>) || __has_include("ReactiveObjC.h")


#pragma mark —— NSObject.racDisposable
@implementation NSObject (JobsRACDisposableChain)
-(JobsRetIDByRACDisposableBlock)byRacDisposable{
    @jobs_weakify(self)
    return ^id _Nullable(__kindof RACDisposable *_Nullable disposable){
        @jobs_strongify(self)
        if (!self) return nil;

        SEL setter = NSSelectorFromString(@"setRacDisposable:");
        if ([self respondsToSelector:setter]) {
            ((void (*)(id, SEL, RACDisposable *))objc_msgSend)(self, setter, disposable);
        }
        return self;
    };
}
@end

#pragma mark —— RACDisposable
@implementation RACDisposable (JobsChain)
+(JobsRetRACDisposableByVoidCallbackBlock)byDisposable{
    return ^__kindof RACDisposable *_Nullable(jobsByVoidBlock _Nullable block){
        return [self disposableWithBlock:block ?: ^{}];
    };
}

-(JobsRetBOOLByVoidBlock)byDisposed{
    @jobs_weakify(self)
    return ^BOOL(void){
        @jobs_strongify(self)
        return self ? self.disposed : YES;
    };
}

-(JobsRetRACDisposableByVoidBlock)byDispose{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(void){
        @jobs_strongify(self)
        if (!self) return nil;
        [self dispose];
        return self;
    };
}

-(JobsRetRACScopedDisposableByVoidBlock)byScopedDisposable{
    @jobs_weakify(self)
    return ^__kindof RACScopedDisposable *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self asScopedDisposable] : nil;
    };
}
@end

#pragma mark —— RACScopedDisposable
@implementation RACScopedDisposable (JobsChain)
+(JobsRetRACScopedDisposableByRACDisposableBlock)byScopedDisposable{
    return ^__kindof RACScopedDisposable *_Nullable(__kindof RACDisposable *_Nullable disposable){
        return disposable ? [self scopedDisposableWithDisposable:disposable] : nil;
    };
}
@end

#pragma mark —— RACCompoundDisposable
@implementation RACCompoundDisposable (JobsChain)
+(JobsRetRACCompoundDisposableByVoidBlock)byCompoundDisposable{
    return ^__kindof RACCompoundDisposable *_Nullable(void){
        return [self compoundDisposable];
    };
}

+(JobsRetRACCompoundDisposableByArrBlock)byCompoundDisposableByDisposables{
    return ^__kindof RACCompoundDisposable *_Nullable(__kindof NSArray *_Nullable disposables){
        return [self compoundDisposableWithDisposables:disposables];
    };
}

-(JobsRetRACCompoundDisposableByRACDisposableBlock)byAddDisposable{
    @jobs_weakify(self)
    return ^__kindof RACCompoundDisposable *_Nullable(__kindof RACDisposable *_Nullable disposable){
        @jobs_strongify(self)
        if (!self) return nil;
        [self addDisposable:disposable];
        return self;
    };
}

-(JobsRetRACCompoundDisposableByRACDisposableBlock)byRemoveDisposable{
    @jobs_weakify(self)
    return ^__kindof RACCompoundDisposable *_Nullable(__kindof RACDisposable *_Nullable disposable){
        @jobs_strongify(self)
        if (!self) return nil;
        [self removeDisposable:disposable];
        return self;
    };
}
@end

#pragma mark —— RACCommand
@implementation RACCommand (JobsChain)
+(JobsRetRACCommandByRACSignalValueBlock)bySignalBlock{
    return ^__kindof RACCommand *_Nullable(JobsRetRACSignalByIDBlock _Nullable block){
        if (!block) return nil;
        return [[self alloc] initWithSignalBlock:^RACSignal *(id input) {
            return block(input);
        }];
    };
}

-(JobsRetRACSignalByVoidBlock)byExecutionSignals{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.executionSignals;
    };
}

-(JobsRetRACSignalByVoidBlock)byExecuting{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.executing;
    };
}

-(JobsRetRACSignalByVoidBlock)byEnabled{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.enabled;
    };
}

-(JobsRetRACSignalByVoidBlock)byErrors{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.errors;
    };
}

-(JobsRetRACCommandByBOOLBlock)byAllowsConcurrentExecution{
    @jobs_weakify(self)
    return ^__kindof RACCommand *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.allowsConcurrentExecution = data;
        return self;
    };
}

-(JobsRetRACSignalByIDBlock)byExecute{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self execute:data] : nil;
    };
}
@end

#pragma mark —— RACSignal
@implementation RACSignal (JobsChain)
+(JobsRetRACSignalByIDBlock)byReturn{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return [self return:data];
    };
}

+(JobsRetRACSignalByNSErrorBlock)byError{
    return ^__kindof RACSignal *_Nullable(NSError *_Nullable error){
        return [self error:error];
    };
}

+(JobsRetRACSignalByVoidBlock)byNever{
    return ^__kindof RACSignal *_Nullable(void){
        return [self never];
    };
}

+(JobsRetRACSignalByVoidBlock)byEmpty{
    return ^__kindof RACSignal *_Nullable(void){
        return [self empty];
    };
}

+(JobsRetRACSignalByIDBlock)byZip{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self zip:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock)byConcat{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self concat:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock)byCombineLatest{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self combineLatest:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock)byMerge{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self merge:data] : nil;
    };
}

+(JobsRetRACSignalByRACIDErrorTransformBlock)byTry{
    return ^__kindof RACSignal *_Nullable(JobsRetIDByIDNSErrorPointerBlock _Nullable block){
        if (!block) return nil;
        return [self try:^id(NSError **errorPtr) {
            return block(nil, errorPtr);
        }];
    };
}

+(JobsRetRACSignalByRACSignalProviderBlock)byDefer{
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByVoidBlock _Nullable block){
        if (!block) return nil;
        return [self defer:^RACSignal *{
            return block();
        }];
    };
}

-(JobsRetRACSequenceByVoidBlock)bySequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){
        @jobs_strongify(self)
        return self.sequence;
    };
}

#define JOBS_RAC_SIGNAL_NOARG_METHOD(_name, _selector) \
-(JobsRetRACSignalByVoidBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSignal *_Nullable(void){ \
        @jobs_strongify(self) \
        return self ? [self _selector] : nil; \
    }; \
}

JOBS_RAC_SIGNAL_NOARG_METHOD(byFlatten, flatten)
JOBS_RAC_SIGNAL_NOARG_METHOD(byDistinctUntilChanged, distinctUntilChanged)
JOBS_RAC_SIGNAL_NOARG_METHOD(byLogAll, logAll)
JOBS_RAC_SIGNAL_NOARG_METHOD(byLogNext, logNext)
JOBS_RAC_SIGNAL_NOARG_METHOD(byLogError, logError)
JOBS_RAC_SIGNAL_NOARG_METHOD(byLogCompleted, logCompleted)
JOBS_RAC_SIGNAL_NOARG_METHOD(byRepeat, repeat)
JOBS_RAC_SIGNAL_NOARG_METHOD(byCollect, collect)
JOBS_RAC_SIGNAL_NOARG_METHOD(byConcatInnerSignals, concat)
JOBS_RAC_SIGNAL_NOARG_METHOD(bySwitchToLatest, switchToLatest)
JOBS_RAC_SIGNAL_NOARG_METHOD(byReplay, replay)
JOBS_RAC_SIGNAL_NOARG_METHOD(byReplayLast, replayLast)
JOBS_RAC_SIGNAL_NOARG_METHOD(byReplayLazily, replayLazily)
JOBS_RAC_SIGNAL_NOARG_METHOD(byDeliverOnMainThread, deliverOnMainThread)
JOBS_RAC_SIGNAL_NOARG_METHOD(byAny, any)
JOBS_RAC_SIGNAL_NOARG_METHOD(byRetry, retry)
JOBS_RAC_SIGNAL_NOARG_METHOD(byIgnoreValues, ignoreValues)
JOBS_RAC_SIGNAL_NOARG_METHOD(byMaterialize, materialize)
JOBS_RAC_SIGNAL_NOARG_METHOD(byDematerialize, dematerialize)
JOBS_RAC_SIGNAL_NOARG_METHOD(byNot, not)
JOBS_RAC_SIGNAL_NOARG_METHOD(byAnd, and)
JOBS_RAC_SIGNAL_NOARG_METHOD(byOr, or)
JOBS_RAC_SIGNAL_NOARG_METHOD(byReduceApply, reduceApply)

-(JobsRetIDByVoidBlock)byFirst{
    @jobs_weakify(self)
    return ^id _Nullable(void){
        @jobs_strongify(self)
        return self ? [self first] : nil;
    };
}

-(JobsRetRACMulticastConnectionByVoidBlock)byPublish{
    @jobs_weakify(self)
    return ^__kindof RACMulticastConnection *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self publish] : nil;
    };
}

-(JobsRetRACSignalByRACBindBlockProviderBlock)byBind{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRACSignalBindBlockProvider _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self bind:^RACSignalBindBlock{
            JobsRACSignalBindResultBlock resultBlock = block();
            return ^RACSignal *(id value, BOOL *stop) {
                return resultBlock ? resultBlock(value, stop) : nil;
            };
        }];
    };
}

-(JobsRetRACSignalByRACSignalBlock)byConcatSignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACSignal *_Nullable signal){
        @jobs_strongify(self)
        return (self && signal) ? [self concat:signal] : nil;
    };
}

-(JobsRetRACSignalByRACSignalBlock)byZipWith{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACSignal *_Nullable signal){
        @jobs_strongify(self)
        return (self && signal) ? [self zipWith:signal] : nil;
    };
}

-(JobsRetRACSignalByRACSignalValueBlock)byFlattenMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self flattenMap:^__kindof RACSignal *(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByRACIDTransformBlock)byMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self map:^id(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByIDBlock)byMapReplace{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self mapReplace:data] : nil;
    };
}

-(JobsRetRACSignalByRACBoolPredicateBlock)byFilter{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self filter:^BOOL(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByIDBlock)byIgnore{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self ignore:data] : nil;
    };
}

-(JobsRetRACSignalByIDBlock)byReduceEach{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self reduceEach:block] : nil;
    };
}

-(JobsRetRACSignalByIDBlock)byStartWith{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self startWith:data] : nil;
    };
}

#define JOBS_RAC_SIGNAL_NSINTEGER_ARG(_name, _selector) \
-(JobsRetRACSignalByNSUIntegerBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSignal *_Nullable(NSUInteger data){ \
        @jobs_strongify(self) \
        return self ? [self _selector:data] : nil; \
    }; \
}

JOBS_RAC_SIGNAL_NSINTEGER_ARG(bySkip, skip)
JOBS_RAC_SIGNAL_NSINTEGER_ARG(byTake, take)
JOBS_RAC_SIGNAL_NSINTEGER_ARG(byTakeLast, takeLast)
JOBS_RAC_SIGNAL_NSINTEGER_ARG(byFlattenMaxConcurrent, flatten)

#define JOBS_RAC_SIGNAL_PREDICATE_ARG(_name, _selector) \
-(JobsRetRACSignalByRACBoolPredicateBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByRACValueBlock _Nullable block){ \
        @jobs_strongify(self) \
        if (!self || !block) return nil; \
        return [self _selector:^BOOL(id value) { return block(value); }]; \
    }; \
}

JOBS_RAC_SIGNAL_PREDICATE_ARG(byTakeUntilBlock, takeUntilBlock)
JOBS_RAC_SIGNAL_PREDICATE_ARG(byTakeWhileBlock, takeWhileBlock)
JOBS_RAC_SIGNAL_PREDICATE_ARG(bySkipUntilBlock, skipUntilBlock)
JOBS_RAC_SIGNAL_PREDICATE_ARG(bySkipWhileBlock, skipWhileBlock)
JOBS_RAC_SIGNAL_PREDICATE_ARG(byAnyPassingTest, any)
JOBS_RAC_SIGNAL_PREDICATE_ARG(byAll, all)

-(JobsRetRACDisposableByRACSubscriberBlock)bySubscribe{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(id<RACSubscriber> _Nullable subscriber){
        @jobs_strongify(self)
        return (self && subscriber) ? [self subscribe:subscriber] : nil;
    };
}

-(JobsRetRACDisposableByRACNextBlock)bySubscribeNext{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByRACNextBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeNext:block] : nil;
    };
}

-(JobsRetRACDisposableByRACErrorBlock)bySubscribeError{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByRACErrorBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeError:block] : nil;
    };
}

-(JobsRetRACDisposableByRACCompletedBlock)bySubscribeCompleted{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByRACCompletedBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeCompleted:block] : nil;
    };
}

-(JobsRetRACSignalByRACNextBlock)byDoNext{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByRACNextBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doNext:block] : nil;
    };
}

-(JobsRetRACSignalByRACErrorBlock)byDoError{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByRACErrorBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doError:block] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock)byDoCompleted{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByRACCompletedBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doCompleted:block] : nil;
    };
}

-(JobsRetRACSignalByTimeIntervalBlock)byThrottle{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return self ? [self throttle:data] : nil;
    };
}

-(JobsRetRACSignalByTimeIntervalBlock)byDelay{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return self ? [self delay:data] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock)byInitially{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByRACCompletedBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self initially:block] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock)byFinally{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByRACCompletedBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self finally:block] : nil;
    };
}

#define JOBS_RAC_SIGNAL_SIGNAL_ARG(_name, _selector) \
-(JobsRetRACSignalByRACSignalBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSignal *_Nullable(__kindof RACSignal *_Nullable signal){ \
        @jobs_strongify(self) \
        return (self && signal) ? [self _selector:signal] : nil; \
    }; \
}

JOBS_RAC_SIGNAL_SIGNAL_ARG(byCombineLatestWith, combineLatestWith)
JOBS_RAC_SIGNAL_SIGNAL_ARG(byMergeSignal, merge)
JOBS_RAC_SIGNAL_SIGNAL_ARG(byTakeUntil, takeUntil)
JOBS_RAC_SIGNAL_SIGNAL_ARG(byTakeUntilReplacement, takeUntilReplacement)
JOBS_RAC_SIGNAL_SIGNAL_ARG(byCatchTo, catchTo)
JOBS_RAC_SIGNAL_SIGNAL_ARG(bySample, sample)

-(JobsRetRACSignalByRACSignalProviderBlock)byThen{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByVoidBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self then:^RACSignal *{
            return block();
        }];
    };
}

-(JobsRetRACSignalByRACSignalErrorBlock)byCatch{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByNSErrorBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self catch:^RACSignal *(NSError *error) {
            return block(error);
        }];
    };
}

-(JobsRetRACSignalByRACBoolErrorPredicateBlock)byTryFilter{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByIDNSErrorPointerBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self try:^BOOL(id value, NSError **errorPtr) {
            return block(value, errorPtr);
        }];
    };
}

-(JobsRetRACSignalByRACIDErrorTransformBlock)byTryMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByIDNSErrorPointerBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self tryMap:^id(id value, NSError **errorPtr) {
            return block(value, errorPtr);
        }];
    };
}

-(JobsRetIDByIDBlock)byFirstOrDefault{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self firstOrDefault:data] : nil;
    };
}

-(JobsRetRACMulticastConnectionByRACSubjectBlock)byMulticast{
    @jobs_weakify(self)
    return ^__kindof RACMulticastConnection *_Nullable(__kindof RACSubject *_Nullable subject){
        @jobs_strongify(self)
        return (self && subject) ? [self multicast:subject] : nil;
    };
}

-(JobsRetRACSignalByRACSchedulerBlock)byDeliverOn{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self deliverOn:scheduler] : nil;
    };
}

-(JobsRetRACSignalByRACSchedulerBlock)bySubscribeOn{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self subscribeOn:scheduler] : nil;
    };
}

-(JobsRetRACSignalByRACIDTransformBlock)byGroupBy{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self groupBy:^id(id object) {
            return block(object);
        }];
    };
}

-(JobsRetRACSignalByNSIntegerBlock)byRetryCount{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSInteger data){
        @jobs_strongify(self)
        return self ? [self retry:data] : nil;
    };
}
@end

#pragma mark —— RACSubject / RACReplaySubject
@implementation RACSubject (JobsChain)
+(JobsRetRACSubjectByVoidBlock)bySubject{
    return ^__kindof RACSubject *_Nullable(void){
        return [self subject];
    };
}

-(JobsRetRACSubjectByIDBlock)bySendNext{
    @jobs_weakify(self)
    return ^__kindof RACSubject *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendNext:data];
        return self;
    };
}

-(JobsRetRACSubjectByNSErrorBlock)bySendError{
    @jobs_weakify(self)
    return ^__kindof RACSubject *_Nullable(NSError *_Nullable error){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendError:error];
        return self;
    };
}

-(JobsRetRACSubjectByVoidBlock)bySendCompleted{
    @jobs_weakify(self)
    return ^__kindof RACSubject *_Nullable(void){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendCompleted];
        return self;
    };
}
@end

@implementation RACReplaySubject (JobsChain)
+(JobsRetRACReplaySubjectByNSUIntegerBlock)byReplaySubjectWithCapacity{
    return ^__kindof RACReplaySubject *_Nullable(NSUInteger capacity){
        return [self replaySubjectWithCapacity:capacity];
    };
}
@end

#pragma mark —— RACMulticastConnection
@implementation RACMulticastConnection (JobsChain)
-(JobsRetRACSignalByVoidBlock)bySignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.signal;
    };
}

-(JobsRetRACDisposableByVoidBlock)byConnect{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self connect] : nil;
    };
}

-(JobsRetRACSignalByVoidBlock)byAutoconnect{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self autoconnect] : nil;
    };
}
@end

#pragma mark —— RACScheduler
@implementation RACScheduler (JobsChain)
+(JobsRetRACSchedulerByVoidBlock)byImmediateScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self immediateScheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock)byMainThreadScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self mainThreadScheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock)byScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self scheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock)byCurrentScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self currentScheduler]; };
}

+(JobsRetRACSchedulerByNSIntegerBlock)bySchedulerWithPriority{
    return ^__kindof RACScheduler *_Nullable(NSInteger priority){
        return [self schedulerWithPriority:(RACSchedulerPriority)priority];
    };
}

-(JobsRetRACDisposableByVoidCallbackForSchedulerBlock)bySchedule{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self schedule:block] : nil;
    };
}

-(JobsRetRACDisposableBySchedulerRecursiveBlock)byScheduleRecursiveBlock{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByRACSchedulerRecursiveBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self scheduleRecursiveBlock:^(void (^reschedule)(void)) {
            block(reschedule);
        }];
    };
}
@end

#pragma mark —— RACSequence
@implementation RACSequence (JobsChain)
+(JobsRetRACSequenceByIDBlock)byReturn{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return [self return:data]; };
}

+(JobsRetRACSequenceByVoidBlock)byEmpty{
    return ^__kindof RACSequence *_Nullable(void){ return [self empty]; };
}

+(JobsRetRACSequenceByIDBlock)byZip{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return data ? [self zip:data] : nil; };
}

+(JobsRetRACSequenceByIDBlock)byConcat{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return data ? [self concat:data] : nil; };
}

-(JobsRetIDByVoidBlock)byHead{
    @jobs_weakify(self)
    return ^id _Nullable(void){ @jobs_strongify(self) return self.head; };
}

-(JobsRetRACSequenceByVoidBlock)byTail{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.tail; };
}

-(JobsRetArrByVoidBlock)byArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(void){ @jobs_strongify(self) return self.array; };
}

-(JobsRetIDByVoidBlock)byObjectEnumerator{
    @jobs_weakify(self)
    return ^id _Nullable(void){ @jobs_strongify(self) return self.objectEnumerator; };
}

-(JobsRetRACSequenceByVoidBlock)byEagerSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.eagerSequence; };
}

-(JobsRetRACSequenceByVoidBlock)byLazySequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.lazySequence; };
}

-(JobsRetRACSignalByVoidBlock)bySignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){ @jobs_strongify(self) return self ? [self signal] : nil; };
}

-(JobsRetRACSignalByRACSchedulerBlock)bySignalWithScheduler{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self signalWithScheduler:scheduler] : nil;
    };
}

-(JobsRetRACSequenceByRACBindBlockProviderBlock)byBind{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRACSequenceBindBlockProvider _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self bind:^RACSequenceBindBlock{
            JobsRACSequenceBindResultBlock resultBlock = block();
            return ^RACSequence *(id value, BOOL *stop) {
                return resultBlock ? resultBlock(value, stop) : nil;
            };
        }];
    };
}

-(JobsRetRACSequenceByRACSequenceBlock)byConcatSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(__kindof RACSequence *_Nullable sequence){
        @jobs_strongify(self)
        return (self && sequence) ? [self concat:sequence] : nil;
    };
}

-(JobsRetRACSequenceByRACSequenceBlock)byZipWith{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(__kindof RACSequence *_Nullable sequence){
        @jobs_strongify(self)
        return (self && sequence) ? [self zipWith:sequence] : nil;
    };
}

-(JobsRetRACSequenceByRACSequenceValueBlock)byFlattenMap{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetRACSequenceByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self flattenMap:^__kindof RACSequence *(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByVoidBlock)byFlatten{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self ? [self flatten] : nil; };
}

-(JobsRetRACSequenceByRACIDTransformBlock)byMap{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self map:^id(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByIDBlock)byMapReplace{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self mapReplace:data] : nil; };
}

-(JobsRetRACSequenceByRACBoolPredicateBlock)byFilter{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetBOOLByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self filter:^BOOL(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByIDBlock)byIgnore{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self ignore:data] : nil; };
}

-(JobsRetRACSequenceByIDBlock)byReduceEach{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable block){ @jobs_strongify(self) return (self && block) ? [self reduceEach:block] : nil; };
}

-(JobsRetRACSequenceByIDBlock)byStartWith{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self startWith:data] : nil; };
}

#define JOBS_RAC_SEQUENCE_NSINTEGER_ARG(_name, _selector) \
-(JobsRetRACSequenceByNSUIntegerBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSequence *_Nullable(NSUInteger data){ @jobs_strongify(self) return self ? [self _selector:data] : nil; }; \
}

JOBS_RAC_SEQUENCE_NSINTEGER_ARG(bySkip, skip)
JOBS_RAC_SEQUENCE_NSINTEGER_ARG(byTake, take)

#define JOBS_RAC_SEQUENCE_PREDICATE_ARG(_name, _selector) \
-(JobsRetRACSequenceByRACBoolPredicateBlock)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSequence *_Nullable(JobsRetBOOLByRACValueBlock _Nullable block){ \
        @jobs_strongify(self) \
        if (!self || !block) return nil; \
        return [self _selector:^BOOL(id value) { return block(value); }]; \
    }; \
}

JOBS_RAC_SEQUENCE_PREDICATE_ARG(byTakeUntilBlock, takeUntilBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(byTakeWhileBlock, takeWhileBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(bySkipUntilBlock, skipUntilBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(bySkipWhileBlock, skipWhileBlock)

-(JobsRetRACSequenceByVoidBlock)byDistinctUntilChanged{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self ? [self distinctUntilChanged] : nil; };
}

-(JobsRetBOOLByRACBoolPredicateBlock)byAny{
    @jobs_weakify(self)
    return ^BOOL(JobsRetBOOLByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self any:^BOOL(id value) { return block(value); }] : NO;
    };
}

-(JobsRetBOOLByRACBoolPredicateBlock)byAll{
    @jobs_weakify(self)
    return ^BOOL(JobsRetBOOLByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self all:^BOOL(id value) { return block(value); }] : NO;
    };
}

-(JobsRetIDByRACBoolPredicateBlock)byObjectPassingTest{
    @jobs_weakify(self)
    return ^id _Nullable(JobsRetBOOLByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self objectPassingTest:^BOOL(id value) { return block(value); }] : nil;
    };
}
@end

#pragma mark —— RACTuple
@implementation RACTuple (JobsChain)
+(JobsRetRACTupleByArrBlock)byTupleWithObjectsFromArray{
    return ^__kindof RACTuple *_Nullable(__kindof NSArray *_Nullable data){
        return data ? [self tupleWithObjectsFromArray:data] : nil;
    };
}

-(JobsRetNSUIntegerByVoidBlock)byCount{
    @jobs_weakify(self)
    return ^NSUInteger(void){ @jobs_strongify(self) return self.count; };
}

#define JOBS_RAC_TUPLE_ID_PROP(_name, _prop) \
-(JobsRetIDByVoidBlock)_name{ \
    @jobs_weakify(self) \
    return ^id _Nullable(void){ @jobs_strongify(self) return self._prop; }; \
}

JOBS_RAC_TUPLE_ID_PROP(byFirst, first)
JOBS_RAC_TUPLE_ID_PROP(bySecond, second)
JOBS_RAC_TUPLE_ID_PROP(byThird, third)
JOBS_RAC_TUPLE_ID_PROP(byFourth, fourth)
JOBS_RAC_TUPLE_ID_PROP(byFifth, fifth)
JOBS_RAC_TUPLE_ID_PROP(byLast, last)

-(JobsRetIDByNSUIntegerBlock)byObjectAtIndex{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){ @jobs_strongify(self) return self ? [self objectAtIndex:index] : nil; };
}

-(JobsRetArrByVoidBlock)byAllObjects{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(void){ @jobs_strongify(self) return self ? [self allObjects] : nil; };
}

-(JobsRetRACTupleByIDBlock)byTupleByAddingObject{
    @jobs_weakify(self)
    return ^__kindof RACTuple *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self tupleByAddingObject:data] : nil; };
}

-(JobsRetRACSequenceByVoidBlock)byRacSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.rac_sequence; };
}
@end

#endif
