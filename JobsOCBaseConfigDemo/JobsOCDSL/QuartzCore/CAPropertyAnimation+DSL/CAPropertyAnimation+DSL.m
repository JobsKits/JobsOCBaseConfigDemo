//
//  CAPropertyAnimation+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CAPropertyAnimation+DSL.h"

@implementation CAPropertyAnimation (JobsChain)
+(JobsRetCAPropertyAnimationByStrBlock _Nonnull)byAnimationWithKeyPath{
    return ^__kindof CAPropertyAnimation *_Nullable(NSString *_Nullable data){
        return [self animationWithKeyPath:data];
    };
}

-(JobsRetCAPropertyAnimationByStrBlock _Nonnull)byKeyPath{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.keyPath = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)byAdditive{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.additive = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock _Nonnull)byCumulative{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.cumulative = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByCAValueFunctionBlock _Nonnull)byValueFunction{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(CAValueFunction *_Nullable data){
        @jobs_strongify(self)
        self.valueFunction = data;
        return self;
    };
}

@end
