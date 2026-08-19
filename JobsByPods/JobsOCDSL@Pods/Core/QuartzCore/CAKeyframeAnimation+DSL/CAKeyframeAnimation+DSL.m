//
//  CAKeyframeAnimation+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CAKeyframeAnimation+DSL.h"

@implementation CAKeyframeAnimation (JobsChain)
-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.values = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCGPathRefBlock _Nonnull)byPath{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CGPathRef _Nullable data){
        @jobs_strongify(self)
        self.path = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byKeyTimes{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.keyTimes = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byTimingFunctions{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.timingFunctions = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCAAnimationCalculationModeBlock _Nonnull)byCalculationMode{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CAAnimationCalculationMode _Nullable data){
        @jobs_strongify(self)
        self.calculationMode = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byTensionValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.tensionValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byContinuityValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.continuityValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByArrBlock _Nonnull)byBiasValues{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(__kindof NSArray *_Nullable data){
        @jobs_strongify(self)
        self.biasValues = data;
        return self;
    };
}

-(JobsRetCAKeyframeAnimationByCAAnimationRotationModeBlock _Nonnull)byRotationMode{
    @jobs_weakify(self)
    return ^__kindof CAKeyframeAnimation *_Nullable(CAAnimationRotationMode _Nullable data){
        @jobs_strongify(self)
        self.rotationMode = data;
        return self;
    };
}

@end
