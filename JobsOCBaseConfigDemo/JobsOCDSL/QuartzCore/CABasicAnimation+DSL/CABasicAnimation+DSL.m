//
//  CABasicAnimation+DSL.m
//  JobsOCBaseConfigDemo
//
#import "CABasicAnimation+DSL.h"

@implementation CABasicAnimation (JobsChain)
-(JobsRetCABasicAnimationByIDBlock)byFromValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.fromValue = data;
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock)byToValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.toValue = data;
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock)byByValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.byValue = data;
        return self;
    };
}

@end
