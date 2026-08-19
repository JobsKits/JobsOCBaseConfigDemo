//
//  UIView+JobsViewPush.m
//  JobsViewPush
//
//  Created by Jobs on 2026/6/22.
//

#import "UIView+JobsViewPush.h"

@class JobsViewPushPresentation;

@interface JobsViewPushTransitionView : UIView

Prop_weak()JobsViewPushPresentation *presentation;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsViewPushTransitionView
-(JobsRetJobsViewPushTransitionViewByJobsViewPushPresentationBlock _Nonnull)byPresentation;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsViewPushTransitionView
@end

@interface JobsViewPushPresentation () <UIGestureRecognizerDelegate>

Prop_weak(readwrite)UIView *sourceView;
Prop_weak(readwrite)UIView *presentedView;
Prop_assign(readwrite)BOOL isPresented;
Prop_strong()JobsViewPushConfiguration *configuration;
Prop_strong()JobsViewPushTransitionView *transitionView;
Prop_strong(nullable)UIPanGestureRecognizer *panGesture;
Prop_strong(nullable)UITapGestureRecognizer *backgroundTapGesture;
Prop_assign()BOOL isAnimatingTransition;

-(instancetype)initWithSourceView:(UIView *)sourceView
                    presentedView:(UIView *)presentedView
                    configuration:(JobsViewPushConfiguration *)configuration;
-(void)presentWithCompletion:(nullable JobsViewPushCompletionBlock)completion;
-(jobsByJobsViewPushCompletionBlockBlock _Nonnull)presentWithCompletion;
-(jobsByVoidBlock _Nonnull)layoutPresentedView;
-(JobsRetCGRectByCGRectBlock _Nonnull)visibleFrameForBounds;
-(JobsRetCGRectByCGRectBlock _Nonnull)hiddenFrameForVisibleFrame;

@end

@interface UIView (JobsViewPushPrivate)

Prop_strong(nullable)JobsViewPushPresentation *jobsViewPushPresentation;

@end

@implementation JobsViewPushConfiguration
+(JobsRetJobsViewPushConfigurationByVoidBlock _Nonnull)defaultConfiguration{
    return ^JobsViewPushConfiguration *{
        return self.new;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _direction = JobsViewPushDirectionRight;
        _presentedRatio = 1;
        _animationDuration = 0.35;
        _allowsInteractiveDismiss = YES;
        _dismissOnBackgroundTap = YES;
        _backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.18];
    };return self;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsViewPushConfiguration *configuration = [[[self class] allocWithZone:zone] init];
    configuration.byDirection(self.direction);
    configuration.byPresentedRatio(self.presentedRatio);
    configuration.byAnimationDuration(self.animationDuration);
    configuration.byAllowsInteractiveDismiss(self.allowsInteractiveDismiss);
    configuration.byDismissOnBackgroundTap(self.dismissOnBackgroundTap);
    configuration.byBackgroundColor(self.backgroundColor);
    return configuration;
}

-(JobsRetJobsViewPushConfigurationByJobsViewPushDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(JobsViewPushDirection direction){
        @jobs_strongify(self)
        if (!self) return nil;
        self.direction = direction;
        return self;
    };
}

-(JobsRetJobsViewPushConfigurationByCGFloatBlock _Nonnull)byPresentedRatio{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(CGFloat presentedRatio){
        @jobs_strongify(self)
        if (!self) return nil;
        self.presentedRatio = MIN(MAX(presentedRatio, 0.1), 1);
        return self;
    };
}

-(JobsRetJobsViewPushConfigurationByNSTimeIntervalBlock _Nonnull)byAnimationDuration{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(NSTimeInterval animationDuration){
        @jobs_strongify(self)
        if (!self) return nil;
        self.animationDuration = MAX(animationDuration, 0);
        return self;
    };
}

-(JobsRetJobsViewPushConfigurationByBOOLBlock _Nonnull)byAllowsInteractiveDismiss{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(BOOL allowsInteractiveDismiss){
        @jobs_strongify(self)
        if (!self) return nil;
        self.allowsInteractiveDismiss = allowsInteractiveDismiss;
        return self;
    };
}

-(JobsRetJobsViewPushConfigurationByBOOLBlock _Nonnull)byDismissOnBackgroundTap{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(BOOL dismissOnBackgroundTap){
        @jobs_strongify(self)
        if (!self) return nil;
        self.dismissOnBackgroundTap = dismissOnBackgroundTap;
        return self;
    };
}

-(JobsRetJobsViewPushConfigurationByUIColorBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^JobsViewPushConfiguration *(UIColor * backgroundColor){
        @jobs_strongify(self)
        if (!self) return nil;
        self.backgroundColor = backgroundColor;
        return self;
    };
}

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsViewPushPresentation
@interface JobsViewPushPresentation (JobsPropertyDSLSetterAutogen_3bef8544d1)
-(void)setIsAnimatingTransition:(BOOL)data;
-(void)setIsPresented:(BOOL)data;
-(void)setTransitionView:(JobsViewPushTransitionView * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsViewPushPresentation

@implementation JobsViewPushPresentation
-(instancetype)initWithSourceView:(UIView *)sourceView
                    presentedView:(UIView *)presentedView
                    configuration:(JobsViewPushConfiguration *)configuration{
    if (self = [super init]) {
        _sourceView = sourceView;
        _presentedView = presentedView;
        _configuration = configuration.copy;
        self.install();
    };return self;
}

-(void)presentWithCompletion:(JobsViewPushCompletionBlock)completion{
    ((((jobsByJobsViewPushCompletionBlockBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushPresentation.class, @selector(presentWithCompletion)))(self, @selector(presentWithCompletion))))(completion);
}
-(jobsByJobsViewPushCompletionBlockBlock _Nonnull)presentWithCompletion{
    @jobs_weakify(self)
    return ^(JobsViewPushCompletionBlock completion){
        @jobs_strongify(self)
        if (!self) return;
        UIView *presentedView = self.presentedView;
        if (!presentedView) return;
        self.byPresented(YES);
        self.byAnimatingTransition(YES);
        CGRect visibleFrame = self.visibleFrameForBounds(self.transitionView.bounds);
        presentedView.byTransform(CGAffineTransformIdentity);
        presentedView.byFrame(self.hiddenFrameForVisibleFrame(visibleFrame));
        JobsViewPushCompletionBlock animations = ^{
            presentedView.byFrame(visibleFrame);
            self.transitionView.byBgColor(self.configuration.backgroundColor);
            [presentedView layoutIfNeeded];
        };
        if (self.configuration.animationDuration <= 0) {
            animations();
            self.byAnimatingTransition(NO);
            if (completion) completion();
            return;
        }
        [UIView animateWithDuration:self.configuration.animationDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:animations
                         completion:^(__unused BOOL finished) {
            self.byAnimatingTransition(NO);
            if (completion) completion();
        }];
    };
}

-(void)dismissAnimated:(BOOL)animated completion:(JobsViewPushCompletionBlock)completion{
    UIView *presentedView = self.presentedView;
    if (!self.isPresented || !presentedView) {
        if (completion) completion();
        return;
    }
    self.byPresented(NO);
    self.byAnimatingTransition(YES);
    [presentedView.layer removeAllAnimations];
    [self.transitionView.layer removeAllAnimations];
    CGRect visibleFrame = self.visibleFrameForBounds(self.transitionView.bounds);
    presentedView.byTransform(CGAffineTransformIdentity);
    presentedView.byFrame(visibleFrame);
    [presentedView.superview layoutIfNeeded];
    JobsViewPushCompletionBlock animations = ^{
        presentedView.byFrame(self.hiddenFrameForVisibleFrame(visibleFrame));
        self.transitionView.byBgColor(UIColor.clearColor);
        [presentedView layoutIfNeeded];
    };
    void (^finish)(BOOL) = ^(__unused BOOL finished) {
        self.byAnimatingTransition(NO);
        [presentedView removeFromSuperview];
        [self.transitionView removeFromSuperview];
        if (self.sourceView.jobsViewPushPresentation == self) {
            self.sourceView.byJobsViewPushPresentation(nil);
        }
        if (self.onDismiss) self.onDismiss();
        if (completion) completion();
    };
    if (!animated || self.configuration.animationDuration <= 0) {
        animations();
        finish(YES);
        return;
    }
    [UIView animateWithDuration:self.configuration.animationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:animations
                     completion:finish];
}

-(jobsByVoidBlock _Nonnull)install{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *sourceView = self.sourceView;
        UIView *presentedView = self.presentedView;
        if (!sourceView || !presentedView) return;
        self.byTransitionView([[JobsViewPushTransitionView alloc] initWithFrame:sourceView.bounds]);
        self.transitionView.byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.transitionView.byBgColor(UIColor.clearColor);
        self.transitionView.byPresentation(self);
        [sourceView addSubview:self.transitionView];
        [self.transitionView addSubview:presentedView];
        self.layoutPresentedView();
        if (self.configuration.dismissOnBackgroundTap) {
            self.backgroundTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(backgroundTapped:)];
            self.backgroundTapGesture.byDelegate(self);
            [self.transitionView addGestureRecognizer:self.backgroundTapGesture];
        }
        if (self.configuration.allowsInteractiveDismiss) {
            self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                      action:@selector(panned:)];
            [presentedView addGestureRecognizer:self.panGesture];
        }
    };
}

-(jobsByVoidBlock _Nonnull)layoutPresentedView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *presentedView = self.presentedView;
        if (!presentedView) return;
        if (self.isAnimatingTransition) return;
        CGRect bounds = self.transitionView.bounds;
        CGRect visibleFrame = self.visibleFrameForBounds(bounds);
        presentedView.byTransform(CGAffineTransformIdentity);
        presentedView.byFrame(self.isPresented ? visibleFrame : self.hiddenFrameForVisibleFrame(visibleFrame));
    };
}

-(JobsRetCGRectByCGRectBlock _Nonnull)visibleFrameForBounds{
    @jobs_weakify(self)
    return ^CGRect(CGRect bounds){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGFloat ratio = self.configuration.presentedRatio;
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop: {
                CGFloat height = CGRectGetHeight(bounds) * ratio;
                return CGRectMake(0, 0, CGRectGetWidth(bounds), height);
            }
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom: {
                CGFloat height = CGRectGetHeight(bounds) * ratio;
                return CGRectMake(0, CGRectGetHeight(bounds) - height, CGRectGetWidth(bounds), height);
            }
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
                return CGRectMake(0, 0, CGRectGetWidth(bounds) * ratio, CGRectGetHeight(bounds));
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight: {
                CGFloat width = CGRectGetWidth(bounds) * ratio;
                return CGRectMake(CGRectGetWidth(bounds) - width, 0, width, CGRectGetHeight(bounds));
            }
        };return CGRectZero;
    };
}

-(JobsRetCGRectByCGRectBlock _Nonnull)hiddenFrameForVisibleFrame{
    @jobs_weakify(self)
    return ^CGRect(CGRect visibleFrame){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGRect hiddenFrame = visibleFrame;
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop:
                hiddenFrame.origin.y = -CGRectGetHeight(visibleFrame);
                break;
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom:
                hiddenFrame.origin.y = CGRectGetMaxY(self.transitionView.bounds);
                break;
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
                hiddenFrame.origin.x = -CGRectGetWidth(visibleFrame);
                break;
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight:
                hiddenFrame.origin.x = CGRectGetMaxX(self.transitionView.bounds);
                break;
        };return hiddenFrame;
    };
}

-(JobsRetByCGPointBlock _Nonnull)interactiveOffsetForTranslation{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint translation){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop:
                return MIN(translation.y, 0);
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom:
                return MAX(translation.y, 0);
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
                return MIN(translation.x, 0);
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight:
                return MAX(translation.x, 0);
        };return 0;
    };
}

-(JobsRetByCGPointBlock _Nonnull)interactiveVelocityForVelocity{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint velocity){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop:
                return -velocity.y;
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom:
                return velocity.y;
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
                return -velocity.x;
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight:
                return velocity.x;
        };return 0;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)interactiveDistance{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop:
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom:
                return MAX(self.presentedView.bounds.size.height, 1);
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight:
                return MAX(self.presentedView.bounds.size.width, 1);
        };return 1;
    };
}

-(jobsByCGFloatBlock _Nonnull)applyInteractiveOffset{
    @jobs_weakify(self)
    return ^(CGFloat offset){
        @jobs_strongify(self)
        if (!self) return;
        UIView *presentedView = self.presentedView;
        if (!presentedView) return;
        CGFloat progress = MIN(fabs(offset) / self.interactiveDistance(), 1);
        CGFloat limitedOffset = self.interactiveDistance() * progress;
        switch (self.configuration.direction) {
            /// 处理 JobsViewPushDirectionTop 分支
            case JobsViewPushDirectionTop:
                presentedView.byFrame(CGRectOffset(self.visibleFrameForBounds(self.transitionView.bounds), 0, -limitedOffset));
                break;
            /// 处理 JobsViewPushDirectionBottom 分支
            case JobsViewPushDirectionBottom:
                presentedView.byFrame(CGRectOffset(self.visibleFrameForBounds(self.transitionView.bounds), 0, limitedOffset));
                break;
            /// 处理 JobsViewPushDirectionLeft 分支
            case JobsViewPushDirectionLeft:
                presentedView.byFrame(CGRectOffset(self.visibleFrameForBounds(self.transitionView.bounds), -limitedOffset, 0));
                break;
            /// 处理 JobsViewPushDirectionRight 分支
            case JobsViewPushDirectionRight:
                presentedView.byFrame(CGRectOffset(self.visibleFrameForBounds(self.transitionView.bounds), limitedOffset, 0));
                break;
        }
        CGFloat alpha = CGColorGetAlpha(self.configuration.backgroundColor.CGColor) * (1 - progress);
        self.transitionView.byBgColor([self.configuration.backgroundColor colorWithAlphaComponent:alpha]);
    };
}

-(jobsByVoidBlock _Nonnull)restoreAfterInteractiveDismiss{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
            self.presentedView.byTransform(CGAffineTransformIdentity);
            self.presentedView.byFrame(self.visibleFrameForBounds(self.transitionView.bounds));
            self.transitionView.byBgColor(self.configuration.backgroundColor);
            [self.presentedView layoutIfNeeded];
        }
                         completion:nil];
    };
}

-(void)backgroundTapped:(UITapGestureRecognizer *)gesture{
    jobsByTapGestureRecognizerBlock action = ((jobsByTapGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushPresentation.class, @selector(jobsBackgroundTapped)))(self, @selector(jobsBackgroundTapped));
    if (action) action(gesture);
}

-(jobsByTapGestureRecognizerBlock _Nonnull)jobsBackgroundTapped{
    @jobs_weakify(self)
    return ^(UITapGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (gesture.state == UIGestureRecognizerStateEnded) {
            [self dismissAnimated:YES completion:nil];
        }
    };
}

-(void)panned:(UIPanGestureRecognizer *)gesture{
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushPresentation.class, @selector(jobsPanned)))(self, @selector(jobsPanned));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsPanned{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat offset = self.interactiveOffsetForTranslation([gesture translationInView:self.transitionView]);
        switch (gesture.state) {
            /// 处理 UIGestureRecognizerStateBegan 分支
            case UIGestureRecognizerStateBegan:
            /// 处理 UIGestureRecognizerStateChanged 分支
            case UIGestureRecognizerStateChanged:
                self.applyInteractiveOffset(offset);
                break;
            /// 处理 UIGestureRecognizerStateEnded 分支
            case UIGestureRecognizerStateEnded:
            /// 处理 UIGestureRecognizerStateCancelled 分支
            case UIGestureRecognizerStateCancelled:
            /// 处理 UIGestureRecognizerStateFailed 分支
            case UIGestureRecognizerStateFailed: {
                CGFloat progress = MIN(fabs(offset) / self.interactiveDistance(), 1);
                CGFloat velocity = self.interactiveVelocityForVelocity([gesture velocityInView:self.transitionView]);
                BOOL shouldDismiss = gesture.state == UIGestureRecognizerStateEnded &&
                    (progress >= 0.35 || velocity >= 500);
                shouldDismiss ? [self dismissAnimated:YES completion:nil] : self.restoreAfterInteractiveDismiss();
                break;
            }
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    };
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    if (gestureRecognizer != self.backgroundTapGesture || !self.presentedView) return YES;
    return ![touch.view isDescendantOfView:self.presentedView];
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsViewPushPresentation
-(JobsRetJobsViewPushPresentationByBOOLBlock _Nonnull)byAnimatingTransition{
    @jobs_weakify(self)
    return ^__kindof JobsViewPushPresentation * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsAnimatingTransition:data];
        return self;
    };
}

-(JobsRetJobsViewPushPresentationByBOOLBlock _Nonnull)byPresented{
    @jobs_weakify(self)
    return ^__kindof JobsViewPushPresentation * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsPresented:data];
        return self;
    };
}

-(JobsRetJobsViewPushPresentationByJobsViewPushTransitionViewBlock _Nonnull)byTransitionView{
    @jobs_weakify(self)
    return ^__kindof JobsViewPushPresentation * _Nullable(JobsViewPushTransitionView * _Nullable data){
        @jobs_strongify(self)
        [self setTransitionView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsViewPushPresentation
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsViewPushTransitionView
@interface JobsViewPushTransitionView (JobsPropertyDSLSetterAutogen_3bef8544d1)
-(void)setPresentation:(JobsViewPushPresentation * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsViewPushTransitionView

@implementation JobsViewPushTransitionView
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsViewPushTransitionView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.presentation.layoutPresentedView();
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsViewPushTransitionView
-(JobsRetJobsViewPushTransitionViewByJobsViewPushPresentationBlock _Nonnull)byPresentation{
    @jobs_weakify(self)
    return ^__kindof JobsViewPushTransitionView * _Nullable(JobsViewPushPresentation * _Nullable data){
        @jobs_strongify(self)
        [self setPresentation:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsViewPushTransitionView
@end

@implementation UIView (JobsViewPush)
-(JobsRetJobsViewPushPresentationByUIViewBlock _Nonnull)jobsPushView{
    @jobs_weakify(self)
    return ^JobsViewPushPresentation *(UIView * presentedView){
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobsPushView:presentedView
                    configuration:nil
                       completion:nil];
    };
}

-(JobsViewPushPresentation *)jobsPushView:(UIView *)presentedView
                            configuration:(JobsViewPushConfiguration *)configuration
                               completion:(JobsViewPushCompletionBlock)completion{
    NSAssert(NSThread.isMainThread, @"JobsViewPush 必须在主线程调用");
    [self.jobsViewPushPresentation dismissAnimated:NO completion:nil];
    [self layoutIfNeeded];
    JobsViewPushPresentation *presentation = [[JobsViewPushPresentation alloc]
                                              initWithSourceView:self
                                              presentedView:presentedView
                                              configuration:configuration ?: ((JobsViewPushConfiguration *)JobsViewPushConfiguration.defaultConfiguration())];
    self.byJobsViewPushPresentation(presentation);
    presentation.presentWithCompletion(completion);
    return presentation;
}

-(void)jobsDismissPushedViewAnimated:(BOOL)animated completion:(JobsViewPushCompletionBlock)completion{
    [self.jobsViewPushPresentation dismissAnimated:animated completion:completion];
}

@end

@implementation UIView (JobsViewPushPrivate)
JobsKey(JobsViewPushPresentationKey)
-(void)setJobsViewPushPresentation:(JobsViewPushPresentation *)jobsViewPushPresentation{
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsViewPushPresentationKey, jobsViewPushPresentation)
}

-(JobsViewPushPresentation *)jobsViewPushPresentation{
    return Jobs_getAssociatedObject(JobsViewPushPresentationKey);
}

@end
