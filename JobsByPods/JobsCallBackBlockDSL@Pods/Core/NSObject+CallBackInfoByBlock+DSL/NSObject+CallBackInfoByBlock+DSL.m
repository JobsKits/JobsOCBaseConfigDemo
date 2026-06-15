//
//  NSObject+CallBackInfoByBlock+DSL.m
//  JobsCallBackBlockDSL
//
//  Created by Jobs on 2026年6月14日，星期日。
//

#import "NSObject+CallBackInfoByBlock+DSL.h"

@implementation NSObject (CallBackInfoByBlockDSL)
#pragma mark —— 无返回值回调
-(JobsRetNSObjectByJobsByVoidBlock _Nonnull)byVoidBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByVoidBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionVoidBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByIDBlock _Nonnull)byObjBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionObjBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByGestureRecognizerBlock _Nonnull)byGestureRecognizerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByGestureRecognizerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionGestureRecognizerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsBySELBlock _Nonnull)bySelBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsBySELBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionSelBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByStrBlock _Nonnull)byStringBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByStrBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionStringBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByNSIntegerBlock _Nonnull)byIntegerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByNSIntegerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionIntegerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByNSUIntegerBlock _Nonnull)byUIntegerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByNSUIntegerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUIntegerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByCGFloatBlock _Nonnull)byCGFloatBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByCGFloatBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionCGFloatBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByBOOLBlock _Nonnull)byBOOLBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByBOOLBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionBOOLBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByIntBlock _Nonnull)byIntBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByIntBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionIntBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByUnsignedIntBlock _Nonnull)byUnsignedIntBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByUnsignedIntBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUnsignedIntBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByFloatBlock _Nonnull)byFloatBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByFloatBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionFloatBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByDoubleBlock _Nonnull)byDoubleBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByDoubleBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionDoubleBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByCharBlock _Nonnull)byCharBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByCharBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionCharBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByUnsignedCharBlock _Nonnull)byUnsignedCharBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByUnsignedCharBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUnsignedCharBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByShortBlock _Nonnull)byShortBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByShortBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionShortBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByUnsignedShortBlock _Nonnull)byUnsignedShortBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByUnsignedShortBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUnsignedShortBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByLongBlock _Nonnull)byLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByUnsignedLongBlock _Nonnull)byUnsignedLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByUnsignedLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUnsignedLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByUnsignedLongLongBlock _Nonnull)byUnsignedLongLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByUnsignedLongLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionUnsignedLongLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsByTwoIDBlock _Nonnull)bySelectorBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(jobsByTwoIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionSelectorBlock:block];
        return self;
    };
}
#pragma mark —— 有返回值回调
-(JobsRetNSObjectByJobsRetIDByVoidBlock _Nonnull)byRetIDByVoidBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDByVoidBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIDByVoidBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIDByGestureBlock _Nonnull)byRetIDByGestureRecognizerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDByGestureBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIDByGestureRecognizerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIDBySELBlock _Nonnull)byRetIDBySELBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDBySELBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIDBySELBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIDByStrBlock _Nonnull)byRetIDByStringBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDByStrBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIDByStringBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetNSIntegerByIDBlock _Nonnull)byRetIntegerByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetNSIntegerByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIntegerByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetNSUIntegerByIDBlock _Nonnull)byRetUIntegerByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetNSUIntegerByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUIntegerByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetCGFloatByIDBlock _Nonnull)byRetCGFloatByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetCGFloatByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetCGFloatByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetBOOLByIDBlock _Nonnull)byRetBoolByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetBOOLByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetBoolByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIntByIDBlock _Nonnull)byRetIntByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIntByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIntByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetUnsignedIntByIDBlock _Nonnull)byRetUnsignedIntByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetUnsignedIntByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedIntByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetFloatByIDBlock _Nonnull)byRetFloatByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetFloatByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetFloatByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetDoubleByIDBlock _Nonnull)byRetDoubleByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetDoubleByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetDoubleByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetCharByIDBlock _Nonnull)byRetCharByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetCharByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetCharByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetUnsignedCharByIDBlock _Nonnull)byRetUnsignedCharByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetUnsignedCharByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedCharByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetShortByIDBlock _Nonnull)byRetShortByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetShortByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetShortByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetUnsignedShortByIDBlock _Nonnull)byRetUnsignedShortByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetUnsignedShortByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedShortByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetLongByIDBlock _Nonnull)byRetLongByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetLongByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetLongByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetUnsignedLongByIDBlock _Nonnull)byRetUnsignedLongByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetUnsignedLongByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedLongByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetUnsignedLongLongByIDBlock _Nonnull)byRetUnsignedLongLongByIDBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetUnsignedLongLongByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedLongLongByIDBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIDByIDBlock _Nonnull)byRetObjBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDByIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetObjBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByNSIntegerBlock _Nonnull)byRetIntegerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByNSIntegerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIntegerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByNSUIntegerBlock _Nonnull)byRetUIntegerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByNSUIntegerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUIntegerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetCGFloatByCGFloatBlock _Nonnull)byRetCGFloatBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetCGFloatByCGFloatBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetCGFloatBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetBOOLByBOOLBlock _Nonnull)byRetBoolBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetBOOLByBOOLBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetBoolBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetBOOLByNSUIntegerBlock _Nonnull)byRetBoolByUIntegerBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetBOOLByNSUIntegerBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetBoolByUIntegerBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIntByIntBlock _Nonnull)byRetIntBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIntByIntBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIntBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByUnsignedIntBlock _Nonnull)byRetUnsignedIntBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByUnsignedIntBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedIntBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByFloatBlock _Nonnull)byRetFloatBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByFloatBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetFloatBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByDoubleBlock _Nonnull)byRetDoubleBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByDoubleBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetDoubleBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByCharBlock _Nonnull)byRetCharBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByCharBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetCharBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByUnsignedCharBlock _Nonnull)byRetUnsignedCharBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByUnsignedCharBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedCharBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByShortBlock _Nonnull)byRetShortBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByShortBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetShortBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByUnsignedShortBlock _Nonnull)byRetUnsignedShortBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByUnsignedShortBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedShortBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByLongBlock _Nonnull)byRetLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByUnsignedLongBlock _Nonnull)byRetUnsignedLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByUnsignedLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetByUnsignedLongLongBlock _Nonnull)byRetUnsignedLongLongBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetByUnsignedLongLongBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetUnsignedLongLongBlock:block];
        return self;
    };
}

-(JobsRetNSObjectByJobsRetIDByTwoIDBlock _Nonnull)byRetIDBySelectorBlock{
    @jobs_weakify(self)
    return ^__kindof NSObject *_Nullable(JobsRetIDByTwoIDBlock _Nullable block) {
        @jobs_strongify(self)
        [self actionRetIDBySelectorBlock:block];
        return self;
    };
}

@end
