//
//  UIViewController+Lottie.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+Lottie.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_c09ce720a4)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;
-(void)setAnimationProgress:(CGFloat)data;
-(void)setLoopAnimation:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation UIViewController (Lottie)
/// 加盖一个Lottie播放器在本控制器view之上
/// @param lottieImage LottieName
-(jobsByStrBlock _Nonnull)addLottieImage{
    @jobs_weakify(self)
    return ^(NSString * lottieImage){
        @jobs_strongify(self)
        if (!self) return;
        if (isValue(lottieImage)) {
    //        self.view.backgroundColor = JobsLightGrayColor;
            LOTAnimationView *lottieView = [LOTAnimationView animationNamed:lottieImage];
            lottieView.byFrame(UIScreen.mainScreen.bounds);
            lottieView.byContentMode(UIViewContentModeScaleAspectFit);
            lottieView.byLoopAnimation(YES);
            lottieView.byTag(100);
            [self.view addSubview:lottieView];
        }
    };
}
/// 开始播放Lottie动画
-(jobsByVoidBlock _Nonnull)lottieImagePlay{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        LOTAnimationView *lottieView = (LOTAnimationView *)[self.view viewWithTag:100];
        if (!lottieView ||
            ![lottieView isKindOfClass:LOTAnimationView.class]) {
            return;
        }
        lottieView.byAnimationProgress(0);
        [lottieView play];
    };
}

@end
