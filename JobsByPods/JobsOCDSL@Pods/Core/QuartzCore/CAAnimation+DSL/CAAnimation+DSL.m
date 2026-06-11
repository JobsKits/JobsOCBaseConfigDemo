//
//  CAAnimation+DSL.m
//  JobsOCDSL
//
#import "CAAnimation+DSL.h"

@implementation CAAnimation (JobsChain)
+(JobsRetCAAnimationByVoidBlock)byAnimation{
    return ^__kindof CAAnimation *_Nullable(void){
        return [self animation];
    };
}

+(JobsRetIDByStrBlock)byDefaultValueForKey{
    return ^id _Nullable(__kindof NSString *_Nullable data){
        return data ? [self defaultValueForKey:data] : nil;
    };
}

-(JobsRetCAAnimationByCAMediaTimingFunctionBlock)byTimingFunction{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFunction *_Nullable data){
        @jobs_strongify(self)
        self.timingFunction = data;
        return self;
    };
}

-(JobsRetCAAnimationByDelegateBlock)byDelegate{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(id<CAAnimationDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetCAAnimationByBOOLBlock)byRemovedOnCompletion{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.removedOnCompletion = data;
        return self;
    };
}

-(JobsRetBOOLByStrBlock)byShouldArchiveValueForKey{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self shouldArchiveValueForKey:data] : NO;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock)byBeginTime{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.beginTime = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock)byDuration{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetCAAnimationByFloatBlock)bySpeed{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.speed = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock)byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsRetCAAnimationByFloatBlock)byRepeatCount{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.repeatCount = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock)byRepeatDuration{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.repeatDuration = data;
        return self;
    };
}

-(JobsRetCAAnimationByBOOLBlock)byAutoreverses{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoreverses = data;
        return self;
    };
}

-(JobsRetCAAnimationByCAMediaTimingFillModeBlock)byFillMode{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        self.fillMode = data;
        return self;
    };
}

@end
