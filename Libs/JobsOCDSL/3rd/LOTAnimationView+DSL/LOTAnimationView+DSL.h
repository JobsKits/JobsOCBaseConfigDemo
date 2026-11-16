//
//  LOTAnimationView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年11月13日，星期五.
//

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface LOTAnimationView (DSL)

-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;

@end

NS_ASSUME_NONNULL_END
