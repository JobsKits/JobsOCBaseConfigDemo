//
//  LOTAnimationView+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年11月13日，星期五.
//

#import "LOTAnimationView+DSL.h"

@implementation LOTAnimationView (DSL)

-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation{
    __weak typeof(self) weakSelf = self;
    return ^LOTAnimationView *_Nullable(BOOL loopAnimation){
        __strong typeof(weakSelf) self = weakSelf;
        self.loopAnimation = loopAnimation;
        return self;
    };
}

-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress{
    __weak typeof(self) weakSelf = self;
    return ^LOTAnimationView *_Nullable(CGFloat animationProgress){
        __strong typeof(weakSelf) self = weakSelf;
        self.animationProgress = animationProgress;
        return self;
    };
}

@end
