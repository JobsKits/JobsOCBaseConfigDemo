//
//  RACModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "RACModel+DSL.h"

@implementation RACModel (DSL)

#pragma mark —— 来自 RACProtocol
-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACDisposable * data))byRacDisposable{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACDisposable * data) {
        @jobs_strongify(self)
        self.racDisposable = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSubject * data))byRacSubject{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACSubject * data) {
        @jobs_strongify(self)
        self.racSubject = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSignal * data))byReqSignal{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACSignal * data) {
        @jobs_strongify(self)
        self.reqSignal = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACCommand * data))byActionCommand{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACCommand * data) {
        @jobs_strongify(self)
        self.actionCommand = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACSequence * data))byDataSequence{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACSequence * data) {
        @jobs_strongify(self)
        self.dataSequence = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACMulticastConnection * data))byDataConnection{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACMulticastConnection * data) {
        @jobs_strongify(self)
        self.dataConnection = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byMainScheduler{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.mainScheduler = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACScheduler * data))byBackgroundScheduler{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACScheduler * data) {
        @jobs_strongify(self)
        self.backgroundScheduler = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(RACTuple * data))byDataTuple{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(RACTuple * data) {
        @jobs_strongify(self)
        self.dataTuple = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data))bySignalDisposableMap{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(NSMutableDictionary <__kindof RACDisposable *, __kindof RACSignal *> * data) {
        @jobs_strongify(self)
        self.signalDisposableMap = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(jobsByIDBlock data))byDoSthByIDBlock{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(jobsByIDBlock data) {
        @jobs_strongify(self)
        self.doSthByIDBlock = data;
        return self;
    };
}

-(__kindof RACModel *_Nonnull (^ _Nonnull)(jobsByVoidBlock data))byDoSthBlock{
    @jobs_weakify(self)
    return ^__kindof RACModel *_Nonnull(jobsByVoidBlock data) {
        @jobs_strongify(self)
        self.doSthBlock = data;
        return self;
    };
}

@end
