//
//  RACModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "RACModel+DSL.h"

@implementation RACModel (DSL)

-(JobsRetRACModelByRACDisposablePointerBlock _Nonnull)byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACDisposable * _Nullable data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(JobsRetRACModelByRACSubjectPointerBlock _Nonnull)byRacSubject{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACSubject * _Nullable data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(JobsRetRACModelByRACSignalPointerBlock _Nonnull)byReqSignal{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACSignal * _Nullable data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(JobsRetRACModelByRACCommandPointerBlock _Nonnull)byActionCommand{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACCommand * _Nullable data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(JobsRetRACModelByRACSequencePointerBlock _Nonnull)byDataSequence{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACSequence * _Nullable data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(JobsRetRACModelByRACMulticastConnectionPointerBlock _Nonnull)byDataConnection{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACMulticastConnection * _Nullable data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(JobsRetRACModelByRACSchedulerPointerBlock _Nonnull)byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(JobsRetRACModelByRACSchedulerPointerBlock _Nonnull)byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACScheduler * _Nullable data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(JobsRetRACModelByRACTuplePointerBlock _Nonnull)byDataTuple{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(RACTuple * _Nullable data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(JobsRetRACModelByMutableDicBlock _Nonnull)bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * _Nullable data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(JobsRetRACModelByJobsByIDBlockBlock _Nonnull)byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(jobsByIDBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(JobsRetRACModelByJobsByVoidBlockBlock _Nonnull)byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nullable(jobsByVoidBlock _Nullable data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}
@end
