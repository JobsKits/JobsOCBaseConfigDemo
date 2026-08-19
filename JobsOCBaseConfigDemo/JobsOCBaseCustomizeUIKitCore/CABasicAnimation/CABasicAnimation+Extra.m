//
//  CABasicAnimation+Extra.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/6/3.
//

#import "CABasicAnimation+Extra.h"

@implementation CABasicAnimation (Extra)
+(JobsRetCABasicAnimationByStrBlock _Nonnull)animationByKeyPath{
    return ^CABasicAnimation *_Nullable(NSString *_Nullable data){
        return [CABasicAnimation animationWithKeyPath:data];;
    };
}

-(JobsRetCABasicAnimationByIDBlock _Nonnull)fromValueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        [self setFromValue:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock _Nonnull)toValueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        [self setToValue:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock _Nonnull)valueBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        [self setByValue:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)beginTimeBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setBeginTime:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)durationBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setDuration:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByFloatBlock _Nonnull)speedBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(float data){
        @jobs_strongify(self)
        [self setSpeed:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByCFTimeIntervalBlock _Nonnull)timeOffsetBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setTimeOffset:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByFloatBlock _Nonnull)repeatCountBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(float data){
        @jobs_strongify(self)
        [self setRepeatCount:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByBOOLBlock _Nonnull)autoreversesBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAutoreverses:data];
        return self;
    };
}

-(JobsRetCABasicAnimationByCAMediaTimingFillModeBlock _Nonnull)fillModeBy{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(CAMediaTimingFillMode _Nullable data){
        @jobs_strongify(self)
        [self setFillMode:data];
        return self;
    };
}

@end
