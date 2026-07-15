//
//  CAPropertyAnimation+DSL.m
//  JobsOCDSL
//

#import "CAPropertyAnimation+DSL.h"

@implementation CAPropertyAnimation (JobsChain)
+(JobsRetCAPropertyAnimationByStrBlock)byAnimationWithKeyPath{
    return ^__kindof CAPropertyAnimation *_Nullable(NSString *_Nullable data){
        return [self animationWithKeyPath:data];
    };
}

-(JobsRetCAPropertyAnimationByStrBlock)byKeyPath{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.keyPath = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock)byAdditive{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.additive = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByBOOLBlock)byCumulative{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.cumulative = data;
        return self;
    };
}

-(JobsRetCAPropertyAnimationByCAValueFunctionBlock)byValueFunction{
    @jobs_weakify(self)
    return ^__kindof CAPropertyAnimation *_Nullable(CAValueFunction *_Nullable data){
        @jobs_strongify(self)
        self.valueFunction = data;
        return self;
    };
}

@end
