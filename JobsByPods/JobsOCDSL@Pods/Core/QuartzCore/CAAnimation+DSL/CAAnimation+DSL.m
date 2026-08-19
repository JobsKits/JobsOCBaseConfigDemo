//
//  CAAnimation+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CAAnimation+DSL.h"

@implementation CAAnimation (JobsChain)
+(JobsRetCAAnimationByVoidBlock _Nonnull)byAnimation{
    return ^__kindof CAAnimation *_Nullable(void){
        return [self animation];
    };
}

+(JobsRetIDByStrBlock _Nonnull)byDefaultValueForKey{
    return ^id _Nullable(__kindof NSString *_Nullable data){
        return data ? [self defaultValueForKey:data] : nil;
    };
}

-(JobsRetCAAnimationByCAMediaTimingFunctionBlock _Nonnull)byTimingFunction{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFunction *_Nullable data){
        @jobs_strongify(self)
        self.timingFunction = data;
        return self;
    };
}

-(JobsRetCAAnimationByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(id<CAAnimationDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}

-(JobsRetCAAnimationByBOOLBlock _Nonnull)byRemovedOnCompletion{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.removedOnCompletion = data;
        return self;
    };
}

-(JobsRetBOOLByStrBlock _Nonnull)byShouldArchiveValueForKey{
    @jobs_weakify(self)
    return ^BOOL(__kindof NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self shouldArchiveValueForKey:data] : NO;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byBeginTime{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.beginTime = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.duration = data;
        return self;
    };
}

-(JobsRetCAAnimationByFloatBlock _Nonnull)bySpeed{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.speed = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsRetCAAnimationByFloatBlock _Nonnull)byRepeatCount{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(float data){
        @jobs_strongify(self)
        self.repeatCount = data;
        return self;
    };
}

-(JobsRetCAAnimationByCFTimeIntervalBlock _Nonnull)byRepeatDuration{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        self.repeatDuration = data;
        return self;
    };
}

-(JobsRetCAAnimationByBOOLBlock _Nonnull)byAutoreverses{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.autoreverses = data;
        return self;
    };
}

-(JobsRetCAAnimationByCAMediaTimingFillModeBlock _Nonnull)byFillMode{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        self.fillMode = data;
        return self;
    };
}

@end
