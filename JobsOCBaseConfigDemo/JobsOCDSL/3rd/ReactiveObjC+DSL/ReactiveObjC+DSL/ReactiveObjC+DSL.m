//
//  ReactiveObjC+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "ReactiveObjC+DSL.h"

#pragma mark —— NSObject.racDisposable
@implementation NSObject (JobsRACDisposableChain)
-(JobsRetIDByRACDisposableBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^id _Nullable(__kindof RACDisposable *_Nullable disposable){
        @jobs_strongify(self)
        if (!self) return nil;
        SEL setter = NSSelectorFromString(@"setRacDisposable:");
        if ([self respondsToSelector:setter]) {
            ((void (*)(id, SEL, RACDisposable *))objc_msgSend)(self, setter, disposable);
        };return self;
    };
}

@end

#pragma mark —— RACDisposable
@implementation RACDisposable (JobsChain)
+(JobsRetRACDisposableByVoidCallbackBlock _Nonnull)byDisposable{
    return ^__kindof RACDisposable *_Nullable(jobsByVoidBlock _Nullable block){
        return [self disposableWithBlock:block ?: ^{}];
    };
}

-(JobsRetBOOLByVoidBlock _Nonnull)byDisposed{
    @jobs_weakify(self)
    return ^BOOL(void){
        @jobs_strongify(self)
        return self ? self.disposed : YES;
    };
}

-(JobsRetRACDisposableByVoidBlock _Nonnull)byDispose{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(void){
        @jobs_strongify(self)
        if (!self) return nil;
        [self dispose];
        return self;
    };
}

-(JobsRetRACScopedDisposableByVoidBlock _Nonnull)byScopedDisposable{
    @jobs_weakify(self)
    return ^__kindof RACScopedDisposable *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self asScopedDisposable] : nil;
    };
}

@end

#pragma mark —— RACScopedDisposable
@implementation RACScopedDisposable (JobsChain)
+(JobsRetRACScopedDisposableByRACDisposableBlock _Nonnull)byScopedDisposable{
    return ^__kindof RACScopedDisposable *_Nullable(__kindof RACDisposable *_Nullable disposable){
        return disposable ? [self scopedDisposableWithDisposable:disposable] : nil;
    };
}

@end

#pragma mark —— RACCompoundDisposable
@implementation RACCompoundDisposable (JobsChain)
+(JobsRetRACCompoundDisposableByVoidBlock _Nonnull)byCompoundDisposable{
    return ^__kindof RACCompoundDisposable *_Nullable(void){
        return [self compoundDisposable];
    };
}

+(JobsRetRACCompoundDisposableByArrBlock _Nonnull)byCompoundDisposableByDisposables{
    return ^__kindof RACCompoundDisposable *_Nullable(__kindof NSArray *_Nullable disposables){
        return [self compoundDisposableWithDisposables:disposables];
    };
}

-(JobsRetRACCompoundDisposableByRACDisposableBlock _Nonnull)byAddDisposable{
    @jobs_weakify(self)
    return ^__kindof RACCompoundDisposable *_Nullable(__kindof RACDisposable *_Nullable disposable){
        @jobs_strongify(self)
        if (!self) return nil;
        [self addDisposable:disposable];
        return self;
    };
}

-(JobsRetRACCompoundDisposableByRACDisposableBlock _Nonnull)byRemoveDisposable{
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
+(JobsRetRACCommandByRACSignalValueBlock _Nonnull)bySignalBlock{
    return ^__kindof RACCommand *_Nullable(JobsRetRACSignalByIDBlock _Nullable block){
        if (!block) return nil;
        return [[self alloc] initWithSignalBlock:^RACSignal *(id input) {
            return block(input);
        }];
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)byExecutionSignals{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.executionSignals;
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)byExecuting{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.executing;
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)byEnabled{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.enabled;
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)byErrors{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.errors;
    };
}

-(JobsRetRACCommandByBOOLBlock _Nonnull)byAllowsConcurrentExecution{
    @jobs_weakify(self)
    return ^__kindof RACCommand *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.allowsConcurrentExecution = data;
        return self;
    };
}

-(JobsRetRACSignalByIDBlock _Nonnull)byExecute{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self execute:data] : nil;
    };
}

@end

#pragma mark —— RACSignal
@implementation RACSignal (JobsChain)
+(JobsRetRACSignalByIDBlock _Nonnull)byReturn{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return [self return:data];
    };
}

+(JobsRetRACSignalByNSErrorBlock _Nonnull)byError{
    return ^__kindof RACSignal *_Nullable(NSError *_Nullable error){
        return [self error:error];
    };
}

+(JobsRetRACSignalByVoidBlock _Nonnull)byNever{
    return ^__kindof RACSignal *_Nullable(void){
        return [self never];
    };
}

+(JobsRetRACSignalByVoidBlock _Nonnull)byEmpty{
    return ^__kindof RACSignal *_Nullable(void){
        return [self empty];
    };
}

+(JobsRetRACSignalByIDBlock _Nonnull)byZip{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self zip:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock _Nonnull)byConcat{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self concat:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock _Nonnull)byCombineLatest{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self combineLatest:data] : nil;
    };
}

+(JobsRetRACSignalByIDBlock _Nonnull)byMerge{
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        return data ? [self merge:data] : nil;
    };
}

+(JobsRetRACSignalByRACIDErrorTransformBlock _Nonnull)byTry{
    return ^__kindof RACSignal *_Nullable(JobsRetIDByIDNSErrorPointerBlock _Nullable block){
        if (!block) return nil;
        return [self try:^id(NSError **errorPtr) {
            return block(nil, errorPtr);
        }];
    };
}

+(JobsRetRACSignalByRACSignalProviderBlock _Nonnull)byDefer{
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByVoidBlock _Nullable block){
        if (!block) return nil;
        return [self defer:^RACSignal *{
            return block();
        }];
    };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)bySequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){
        @jobs_strongify(self)
        return self.sequence;
    };
}

#define JOBS_RAC_SIGNAL_NOARG_METHOD(_name, _selector) \
-(JobsRetRACSignalByVoidBlock _Nonnull)_name{ \
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

-(JobsRetIDByVoidBlock _Nonnull)byFirst{
    @jobs_weakify(self)
    return ^id _Nullable(void){
        @jobs_strongify(self)
        return self ? [self first] : nil;
    };
}

-(JobsRetRACMulticastConnectionByVoidBlock _Nonnull)byPublish{
    @jobs_weakify(self)
    return ^__kindof RACMulticastConnection *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self publish] : nil;
    };
}

-(JobsRetRACSignalByRACBindBlockProviderBlock _Nonnull)byBind{
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

-(JobsRetRACSignalByRACSignalBlock _Nonnull)byConcatSignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACSignal *_Nullable signal){
        @jobs_strongify(self)
        return (self && signal) ? [self concat:signal] : nil;
    };
}

-(JobsRetRACSignalByRACSignalBlock _Nonnull)byZipWith{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACSignal *_Nullable signal){
        @jobs_strongify(self)
        return (self && signal) ? [self zipWith:signal] : nil;
    };
}

-(JobsRetRACSignalByRACSignalValueBlock _Nonnull)byFlattenMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self flattenMap:^__kindof RACSignal *(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByRACIDTransformBlock _Nonnull)byMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self map:^id(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByIDBlock _Nonnull)byMapReplace{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self mapReplace:data] : nil;
    };
}

-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)byFilter{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self filter:^BOOL(id value) {
            return block(value);
        }];
    };
}

-(JobsRetRACSignalByIDBlock _Nonnull)byIgnore{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self ignore:data] : nil;
    };
}

-(JobsRetRACSignalByIDBlock _Nonnull)byReduceEach{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self reduceEach:block] : nil;
    };
}

-(JobsRetRACSignalByIDBlock _Nonnull)byStartWith{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self startWith:data] : nil;
    };
}

#define JOBS_RAC_SIGNAL_NSINTEGER_ARG(_name, _selector) \
-(JobsRetRACSignalByNSUIntegerBlock _Nonnull)_name{ \
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
-(JobsRetRACSignalByRACBoolPredicateBlock _Nonnull)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByIDBlock _Nullable block){ \
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

-(JobsRetRACDisposableByRACSubscriberBlock _Nonnull)bySubscribe{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(id<RACSubscriber> _Nullable subscriber){
        @jobs_strongify(self)
        return (self && subscriber) ? [self subscribe:subscriber] : nil;
    };
}

-(JobsRetRACDisposableByRACNextBlock _Nonnull)bySubscribeNext{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByIDBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeNext:block] : nil;
    };
}

-(JobsRetRACDisposableByRACErrorBlock _Nonnull)bySubscribeError{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByErrBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeError:block] : nil;
    };
}

-(JobsRetRACDisposableByRACCompletedBlock _Nonnull)bySubscribeCompleted{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self subscribeCompleted:block] : nil;
    };
}

-(JobsRetRACSignalByRACNextBlock _Nonnull)byDoNext{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByIDBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doNext:block] : nil;
    };
}

-(JobsRetRACSignalByRACErrorBlock _Nonnull)byDoError{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByErrBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doError:block] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byDoCompleted{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self doCompleted:block] : nil;
    };
}

-(JobsRetRACSignalByTimeIntervalBlock _Nonnull)byThrottle{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return self ? [self throttle:data] : nil;
    };
}

-(JobsRetRACSignalByTimeIntervalBlock _Nonnull)byDelay{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        return self ? [self delay:data] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byInitially{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self initially:block] : nil;
    };
}

-(JobsRetRACSignalByRACCompletedBlock _Nonnull)byFinally{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self finally:block] : nil;
    };
}

#define JOBS_RAC_SIGNAL_SIGNAL_ARG(_name, _selector) \
-(JobsRetRACSignalByRACSignalBlock _Nonnull)_name{ \
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

-(JobsRetRACSignalByRACSignalProviderBlock _Nonnull)byThen{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByVoidBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self then:^RACSignal *{
            return block();
        }];
    };
}

-(JobsRetRACSignalByRACSignalErrorBlock _Nonnull)byCatch{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetRACSignalByNSErrorBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self catch:^RACSignal *(NSError *error) {
            return block(error);
        }];
    };
}

-(JobsRetRACSignalByRACBoolErrorPredicateBlock _Nonnull)byTryFilter{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetBOOLByIDNSErrorPointerBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self try:^BOOL(id value, NSError **errorPtr) {
            return block(value, errorPtr);
        }];
    };
}

-(JobsRetRACSignalByRACIDErrorTransformBlock _Nonnull)byTryMap{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByIDNSErrorPointerBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self tryMap:^id(id value, NSError **errorPtr) {
            return block(value, errorPtr);
        }];
    };
}

-(JobsRetIDByIDBlock _Nonnull)byFirstOrDefault{
    @jobs_weakify(self)
    return ^id _Nullable(id _Nullable data){
        @jobs_strongify(self)
        return self ? [self firstOrDefault:data] : nil;
    };
}

-(JobsRetRACMulticastConnectionByRACSubjectBlock _Nonnull)byMulticast{
    @jobs_weakify(self)
    return ^__kindof RACMulticastConnection *_Nullable(__kindof RACSubject *_Nullable subject){
        @jobs_strongify(self)
        return (self && subject) ? [self multicast:subject] : nil;
    };
}

-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)byDeliverOn{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self deliverOn:scheduler] : nil;
    };
}

-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)bySubscribeOn{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self subscribeOn:scheduler] : nil;
    };
}

-(JobsRetRACSignalByRACIDTransformBlock _Nonnull)byGroupBy{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self groupBy:^id(id object) {
            return block(object);
        }];
    };
}

-(JobsRetRACSignalByNSIntegerBlock _Nonnull)byRetryCount{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(NSInteger data){
        @jobs_strongify(self)
        return self ? [self retry:data] : nil;
    };
}

@end

#pragma mark —— RACSubject / RACReplaySubject
@implementation RACSubject (JobsChain)
+(JobsRetRACSubjectByVoidBlock _Nonnull)bySubject{
    return ^__kindof RACSubject *_Nullable(void){
        return [self subject];
    };
}

-(JobsRetRACSubjectByIDBlock _Nonnull)bySendNext{
    @jobs_weakify(self)
    return ^__kindof RACSubject *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendNext:data];
        return self;
    };
}

-(JobsRetRACSubjectByNSErrorBlock _Nonnull)bySendError{
    @jobs_weakify(self)
    return ^__kindof RACSubject *_Nullable(NSError *_Nullable error){
        @jobs_strongify(self)
        if (!self) return nil;
        [self sendError:error];
        return self;
    };
}

-(JobsRetRACSubjectByVoidBlock _Nonnull)bySendCompleted{
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
+(JobsRetRACReplaySubjectByNSUIntegerBlock _Nonnull)byReplaySubjectWithCapacity{
    return ^__kindof RACReplaySubject *_Nullable(NSUInteger capacity){
        return [self replaySubjectWithCapacity:capacity];
    };
}

@end

#pragma mark —— RACMulticastConnection
@implementation RACMulticastConnection (JobsChain)
-(JobsRetRACSignalByVoidBlock _Nonnull)bySignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self.signal;
    };
}

-(JobsRetRACDisposableByVoidBlock _Nonnull)byConnect{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self connect] : nil;
    };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)byAutoconnect{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){
        @jobs_strongify(self)
        return self ? [self autoconnect] : nil;
    };
}

@end

#pragma mark —— RACScheduler
@implementation RACScheduler (JobsChain)
+(JobsRetRACSchedulerByVoidBlock _Nonnull)byImmediateScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self immediateScheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock _Nonnull)byMainThreadScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self mainThreadScheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock _Nonnull)byScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self scheduler]; };
}

+(JobsRetRACSchedulerByVoidBlock _Nonnull)byCurrentScheduler{
    return ^__kindof RACScheduler *_Nullable(void){ return [self currentScheduler]; };
}

+(JobsRetRACSchedulerByNSIntegerBlock _Nonnull)bySchedulerWithPriority{
    return ^__kindof RACScheduler *_Nullable(NSInteger priority){
        return [self schedulerWithPriority:(RACSchedulerPriority)priority];
    };
}

-(JobsRetRACDisposableByVoidCallbackForSchedulerBlock _Nonnull)bySchedule{
    @jobs_weakify(self)
    return ^__kindof RACDisposable *_Nullable(jobsByVoidBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self schedule:block] : nil;
    };
}

-(JobsRetRACDisposableBySchedulerRecursiveBlock _Nonnull)byScheduleRecursiveBlock{
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
+(JobsRetRACSequenceByIDBlock _Nonnull)byReturn{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return [self return:data]; };
}

+(JobsRetRACSequenceByVoidBlock _Nonnull)byEmpty{
    return ^__kindof RACSequence *_Nullable(void){ return [self empty]; };
}

+(JobsRetRACSequenceByIDBlock _Nonnull)byZip{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return data ? [self zip:data] : nil; };
}

+(JobsRetRACSequenceByIDBlock _Nonnull)byConcat{
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ return data ? [self concat:data] : nil; };
}

-(JobsRetIDByVoidBlock _Nonnull)byHead{
    @jobs_weakify(self)
    return ^id _Nullable(void){ @jobs_strongify(self) return self.head; };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)byTail{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.tail; };
}

-(JobsRetArrByVoidBlock _Nonnull)byArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(void){ @jobs_strongify(self) return self.array; };
}

-(JobsRetIDByVoidBlock _Nonnull)byObjectEnumerator{
    @jobs_weakify(self)
    return ^id _Nullable(void){ @jobs_strongify(self) return self.objectEnumerator; };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)byEagerSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.eagerSequence; };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)byLazySequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.lazySequence; };
}

-(JobsRetRACSignalByVoidBlock _Nonnull)bySignal{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(void){ @jobs_strongify(self) return self ? [self signal] : nil; };
}

-(JobsRetRACSignalByRACSchedulerBlock _Nonnull)bySignalWithScheduler{
    @jobs_weakify(self)
    return ^__kindof RACSignal *_Nullable(__kindof RACScheduler *_Nullable scheduler){
        @jobs_strongify(self)
        return (self && scheduler) ? [self signalWithScheduler:scheduler] : nil;
    };
}

-(JobsRetRACSequenceByRACBindBlockProviderBlock _Nonnull)byBind{
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

-(JobsRetRACSequenceByRACSequenceBlock _Nonnull)byConcatSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(__kindof RACSequence *_Nullable sequence){
        @jobs_strongify(self)
        return (self && sequence) ? [self concat:sequence] : nil;
    };
}

-(JobsRetRACSequenceByRACSequenceBlock _Nonnull)byZipWith{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(__kindof RACSequence *_Nullable sequence){
        @jobs_strongify(self)
        return (self && sequence) ? [self zipWith:sequence] : nil;
    };
}

-(JobsRetRACSequenceByRACSequenceValueBlock _Nonnull)byFlattenMap{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetRACSequenceByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self flattenMap:^__kindof RACSequence *(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)byFlatten{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self ? [self flatten] : nil; };
}

-(JobsRetRACSequenceByRACIDTransformBlock _Nonnull)byMap{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetIDByRACValueBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self map:^id(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByIDBlock _Nonnull)byMapReplace{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self mapReplace:data] : nil; };
}

-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)byFilter{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(JobsRetBOOLByIDBlock _Nullable block){
        @jobs_strongify(self)
        if (!self || !block) return nil;
        return [self filter:^BOOL(id value) { return block(value); }];
    };
}

-(JobsRetRACSequenceByIDBlock _Nonnull)byIgnore{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self ignore:data] : nil; };
}

-(JobsRetRACSequenceByIDBlock _Nonnull)byReduceEach{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable block){ @jobs_strongify(self) return (self && block) ? [self reduceEach:block] : nil; };
}

-(JobsRetRACSequenceByIDBlock _Nonnull)byStartWith{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self startWith:data] : nil; };
}

#define JOBS_RAC_SEQUENCE_NSINTEGER_ARG(_name, _selector) \
-(JobsRetRACSequenceByNSUIntegerBlock _Nonnull)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSequence *_Nullable(NSUInteger data){ @jobs_strongify(self) return self ? [self _selector:data] : nil; }; \
}

JOBS_RAC_SEQUENCE_NSINTEGER_ARG(bySkip, skip)
JOBS_RAC_SEQUENCE_NSINTEGER_ARG(byTake, take)

#define JOBS_RAC_SEQUENCE_PREDICATE_ARG(_name, _selector) \
-(JobsRetRACSequenceByRACBoolPredicateBlock _Nonnull)_name{ \
    @jobs_weakify(self) \
    return ^__kindof RACSequence *_Nullable(JobsRetBOOLByIDBlock _Nullable block){ \
        @jobs_strongify(self) \
        if (!self || !block) return nil; \
        return [self _selector:^BOOL(id value) { return block(value); }]; \
    }; \
}

JOBS_RAC_SEQUENCE_PREDICATE_ARG(byTakeUntilBlock, takeUntilBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(byTakeWhileBlock, takeWhileBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(bySkipUntilBlock, skipUntilBlock)
JOBS_RAC_SEQUENCE_PREDICATE_ARG(bySkipWhileBlock, skipWhileBlock)

-(JobsRetRACSequenceByVoidBlock _Nonnull)byDistinctUntilChanged{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self ? [self distinctUntilChanged] : nil; };
}

-(JobsRetBOOLByRACBoolPredicateBlock _Nonnull)byAny{
    @jobs_weakify(self)
    return ^BOOL(JobsRetBOOLByIDBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self any:^BOOL(id value) { return block(value); }] : NO;
    };
}

-(JobsRetBOOLByRACBoolPredicateBlock _Nonnull)byAll{
    @jobs_weakify(self)
    return ^BOOL(JobsRetBOOLByIDBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self all:^BOOL(id value) { return block(value); }] : NO;
    };
}

-(JobsRetIDByRACBoolPredicateBlock _Nonnull)byObjectPassingTest{
    @jobs_weakify(self)
    return ^id _Nullable(JobsRetBOOLByIDBlock _Nullable block){
        @jobs_strongify(self)
        return (self && block) ? [self objectPassingTest:^BOOL(id value) { return block(value); }] : nil;
    };
}

@end

#pragma mark —— RACTuple
@implementation RACTuple (JobsChain)
+(JobsRetRACTupleByArrBlock _Nonnull)byTupleWithObjectsFromArray{
    return ^__kindof RACTuple *_Nullable(__kindof NSArray *_Nullable data){
        return data ? [self tupleWithObjectsFromArray:data] : nil;
    };
}

-(JobsRetNSUIntegerByVoidBlock _Nonnull)byCount{
    @jobs_weakify(self)
    return ^NSUInteger(void){ @jobs_strongify(self) return self.count; };
}

#define JOBS_RAC_TUPLE_ID_PROP(_name, _prop) \
-(JobsRetIDByVoidBlock _Nonnull)_name{ \
    @jobs_weakify(self) \
    return ^id _Nullable(void){ @jobs_strongify(self) return self._prop; }; \
}

JOBS_RAC_TUPLE_ID_PROP(byFirst, first)
JOBS_RAC_TUPLE_ID_PROP(bySecond, second)
JOBS_RAC_TUPLE_ID_PROP(byThird, third)
JOBS_RAC_TUPLE_ID_PROP(byFourth, fourth)
JOBS_RAC_TUPLE_ID_PROP(byFifth, fifth)
JOBS_RAC_TUPLE_ID_PROP(byLast, last)

-(JobsRetIDByUIntegerBlock _Nonnull)byObjectAtIndex{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger index){ @jobs_strongify(self) return self ? [self objectAtIndex:index] : nil; };
}

-(JobsRetArrByVoidBlock _Nonnull)byAllObjects{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(void){ @jobs_strongify(self) return self ? [self allObjects] : nil; };
}

-(JobsRetRACTupleByIDBlock _Nonnull)byTupleByAddingObject{
    @jobs_weakify(self)
    return ^__kindof RACTuple *_Nullable(id _Nullable data){ @jobs_strongify(self) return self ? [self tupleByAddingObject:data] : nil; };
}

-(JobsRetRACSequenceByVoidBlock _Nonnull)byRacSequence{
    @jobs_weakify(self)
    return ^__kindof RACSequence *_Nullable(void){ @jobs_strongify(self) return self.rac_sequence; };
}

@end
