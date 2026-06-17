//
//  CAKeyframeAnimation+DSL.m
//  JobsOCBaseConfigDemo
//
#import "CAKeyframeAnimation+DSL.h"

@implementation CAKeyframeAnimation (JobsChain)
-(JobsRetCAKeyframeAnimationByArrBlock)byValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.values = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCGPathRefBlock)byPath{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CGPathRef _Nullable data){
        @jobs_strongify(self)
        self.path = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock)byKeyTimes{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.keyTimes = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock)byTimingFunctions{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.timingFunctions = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCAAnimationCalculationModeBlock)byCalculationMode{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CAAnimationCalculationMode _Nullable data){
        @jobs_strongify(self)
        self.calculationMode = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock)byTensionValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.tensionValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock)byContinuityValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.continuityValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock)byBiasValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.biasValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCAAnimationRotationModeBlock)byRotationMode{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CAAnimationRotationMode _Nullable data){
        @jobs_strongify(self)
        self.rotationMode = data;
        return self;
    };
}

@end
