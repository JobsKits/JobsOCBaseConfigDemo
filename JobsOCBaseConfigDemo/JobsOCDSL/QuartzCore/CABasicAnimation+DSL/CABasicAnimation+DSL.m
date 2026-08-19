//
//  CABasicAnimation+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "CABasicAnimation+DSL.h"

@implementation CABasicAnimation (JobsChain)
-(JobsRetCABasicAnimationByIDBlock _Nonnull)byFromValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.fromValue = data;
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock _Nonnull)byToValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.toValue = data;
        return self;
    };
}

-(JobsRetCABasicAnimationByIDBlock _Nonnull)byByValue{
    @jobs_weakify(self)
    return ^__kindof CABasicAnimation *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        self.byValue = data;
        return self;
    };
}

@end
