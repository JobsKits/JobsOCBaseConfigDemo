//
//  JobsLottieRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsLottieRefreshView.h"

@interface JobsLottieRefreshView ()

Prop_copy(readwrite)NSString *animationName;
Prop_strong(nullable)LOTAnimationView *lottieView;
Prop_assign()BOOL wantsAnimating;

@end

@implementation JobsLottieRefreshView
-(instancetype)initWithAnimationNamed:(NSString *)animationName {
    if (self = [super initWithFrame:CGRectZero]) {
        _animationName = animationName.copy ?: @"";
        _indicatorSize = CGSizeMake(24, 24);
        self.byUserInteractionEnabled(NO);
        _lottieView = [LOTAnimationView animationNamed:_animationName.stringByDeletingPathExtension];
        [self jobs_setupLottieView];
    };return self;
}

-(instancetype)initWithAnimationPath:(NSString *)animationPath {
    if (self = [super initWithFrame:CGRectZero]) {
        _animationName = animationPath.copy ?: @"";
        _indicatorSize = CGSizeMake(24, 24);
        self.byUserInteractionEnabled(NO);
        _lottieView = animationPath.length ? [LOTAnimationView animationWithFilePath:animationPath] : nil;
        [self jobs_setupLottieView];
    };return self;
}

-(CGSize)intrinsicContentSize {
    return self.indicatorSize;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.lottieView.byFrame(self.bounds);
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.wantsAnimating && self.window) [self byResume];
    if (!self.window) [self.lottieView pause];
}

-(instancetype)byStart {
    self.wantsAnimating = YES;
    self.byHidden(NO);
    if (UIAccessibilityIsReduceMotionEnabled()) {
        [self.lottieView stop];
        self.lottieView.animationProgress = 1;
    } else {
        self.lottieView.loopAnimation = YES;
        [self.lottieView play];
    };return self;
}

-(instancetype)byPause {
    self.wantsAnimating = NO;
    [self.lottieView pause];
    return self;
}

-(instancetype)byResume {
    return [self byStart];
}

-(instancetype)byStop {
    self.wantsAnimating = NO;
    [self.lottieView stop];
    self.lottieView.animationProgress = 0;
    return self;
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(UIView *)refreshAnimatorView {
    return self;
}

-(CGSize)refreshAnimatorPreferredSize {
    return self.indicatorSize;
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalized = MIN(1, MAX(0, progress));
    switch (phase) {
        case JobsRefreshAnimatorPhasePulling:
            self.wantsAnimating = NO;
            [self.lottieView pause];
            self.lottieView.animationProgress = normalized;
            self.byHidden(NO).byAlpha(0.35 + normalized * 0.65);
            break;
        case JobsRefreshAnimatorPhaseReady:
            self.wantsAnimating = NO;
            [self.lottieView pause];
            self.lottieView.animationProgress = 1;
            self.byHidden(NO).byAlpha(1);
            break;
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byAlpha(1);
            [self byStart];
            break;
        case JobsRefreshAnimatorPhaseEnding:
            [self byPause];
            self.byHidden(NO).byAlpha(1);
            break;
        case JobsRefreshAnimatorPhaseIdle:
        case JobsRefreshAnimatorPhaseInactive:
            [self byStop];
            self.byHidden(YES).byAlpha(0);
            break;
    }
}

#pragma mark —— Private
-(void)jobs_setupLottieView {
    self.lottieView.loopAnimation = YES;
    self.lottieView.byContentMode(UIViewContentModeScaleAspectFit)
        .byUserInteractionEnabled(NO)
        .addOn(self);
}

@end
