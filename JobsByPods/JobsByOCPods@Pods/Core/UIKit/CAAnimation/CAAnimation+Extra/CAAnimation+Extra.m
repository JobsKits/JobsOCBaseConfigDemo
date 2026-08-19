//
//  CAAnimation+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CAAnimation+Extra.h"

@implementation CAAnimation (Extra)
-(JobsRetCAAnimationByCAMediaTimingFunctionBlock _Nonnull)timingFunctionBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(CAMediaTimingFunction *_Nullable data){
        @jobs_strongify(self)
        [self setTimingFunction:data];
        return self;
    };
}

-(JobsRetCAAnimationByDelegateBlock _Nonnull)delegateBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(id<CAAnimationDelegate> _Nullable delegate){
        @jobs_strongify(self)
        [self setDelegate:delegate];
        return self;
    };
}

-(JobsRetCAAnimationByBOOLBlock _Nonnull)removedOnCompletionBy{
    @jobs_weakify(self)
    return ^__kindof CAAnimation *_Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRemovedOnCompletion:data];
        return self;
    };
}

@end
