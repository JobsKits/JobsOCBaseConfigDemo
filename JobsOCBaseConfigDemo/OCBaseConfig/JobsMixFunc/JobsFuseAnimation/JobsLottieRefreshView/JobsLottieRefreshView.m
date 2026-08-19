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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsLottieRefreshView
@interface JobsLottieRefreshView (JobsPropertyDSLSetterAutogen_2136b59cf2)
-(void)setWantsAnimating:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsLottieRefreshView

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_2136b59cf2)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;
-(void)setAnimationProgress:(CGFloat)data;
-(void)setLoopAnimation:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation JobsLottieRefreshView
-(instancetype)initWithAnimationNamed:(NSString *)animationName {
    if (self = [super initWithFrame:CGRectZero]) {
        _animationName = animationName.copy ?: @"";
        _indicatorSize = CGSizeMake(24, 24);
        self.byUserInteractionEnabled(NO);
        _lottieView = [LOTAnimationView animationNamed:_animationName.stringByDeletingPathExtension];
        self.jobs_setupLottieView();
    };return self;
}

-(instancetype)initWithAnimationPath:(NSString *)animationPath {
    if (self = [super initWithFrame:CGRectZero]) {
        _animationName = animationPath.copy ?: @"";
        _indicatorSize = CGSizeMake(24, 24);
        self.byUserInteractionEnabled(NO);
        _lottieView = animationPath.length ? [LOTAnimationView animationWithFilePath:animationPath] : nil;
        self.jobs_setupLottieView();
    };return self;
}

-(CGSize)intrinsicContentSize{
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLottieRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.indicatorSize;
    };
}

-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLottieRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.lottieView.byFrame(self.bounds);
    };
}

-(jobsByVoidBlock _Nonnull)jobsDidMoveToWindow {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didMoveToWindow];
        if (self.wantsAnimating && self.window) self.byResume();
        if (!self.window) self.lottieView.pause;
    };
}

-(void)didMoveToWindow{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsLottieRefreshView.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(JobsRetIDByVoidBlock _Nonnull)byStart {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.byHidden(NO);
        if (UIAccessibilityIsReduceMotionEnabled()) {
            self.lottieView.stop;
            self.lottieView.animationProgress = 1;
        } else {
            self.lottieView.loopAnimation = YES;
            [self.lottieView play];
        };return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byPause {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.lottieView.pause;
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byResume {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.byStart();
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStop {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.lottieView.stop;
        self.lottieView.animationProgress = 0;
        return self;
    };
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(JobsRetViewByVoidBlock _Nonnull)refreshAnimatorView {
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self;
    };
}

-(JobsRetCGSizeByVoidBlock _Nonnull)refreshAnimatorPreferredSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.indicatorSize;
    };
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalized = MIN(1, MAX(0, progress));
    switch (phase) {
        /// 处理 JobsRefreshAnimatorPhasePulling 分支
        case JobsRefreshAnimatorPhasePulling:
            self.byWantsAnimating(NO);
            self.lottieView.pause;
            self.lottieView.byAnimationProgress(normalized);
            self.byHidden(NO).byAlpha(0.35 + normalized * 0.65);
            break;
        /// 处理 JobsRefreshAnimatorPhaseReady 分支
        case JobsRefreshAnimatorPhaseReady:
            self.byWantsAnimating(NO);
            self.lottieView.pause;
            self.lottieView.byAnimationProgress(1);
            self.byHidden(NO).byAlpha(1);
            break;
        /// 处理 JobsRefreshAnimatorPhaseRefreshing 分支
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byAlpha(1);
            self.byStart();
            break;
        /// 处理 JobsRefreshAnimatorPhaseEnding 分支
        case JobsRefreshAnimatorPhaseEnding:
            self.byPause();
            self.byHidden(NO).byAlpha(1);
            break;
        /// 处理 JobsRefreshAnimatorPhaseIdle 分支
        case JobsRefreshAnimatorPhaseIdle:
        /// 处理 JobsRefreshAnimatorPhaseInactive 分支
        case JobsRefreshAnimatorPhaseInactive:
            self.byStop();
            self.byHidden(YES).byAlpha(0);
            break;
    }
}

#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)jobs_setupLottieView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.lottieView.byLoopAnimation(YES);
        self.lottieView.byContentMode(UIViewContentModeScaleAspectFit)
            .byUserInteractionEnabled(NO)
            .addOn(self);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsLottieRefreshView
-(JobsRetJobsLottieRefreshViewByBOOLBlock _Nonnull)byWantsAnimating{
    @jobs_weakify(self)
    return ^__kindof JobsLottieRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWantsAnimating:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsLottieRefreshView
@end
