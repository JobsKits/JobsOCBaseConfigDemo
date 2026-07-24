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
-(void)layoutPresentedView;
-(CGRect)visibleFrameForBounds:(CGRect)bounds;
-(CGRect)hiddenFrameForVisibleFrame:(CGRect)visibleFrame;

@end

@interface UIView (JobsViewPushPrivate)

Prop_strong(nullable)JobsViewPushPresentation *jobsViewPushPresentation;

@end

@implementation JobsViewPushConfiguration
+(instancetype)defaultConfiguration{
    return self.new;
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
    configuration.direction = self.direction;
    configuration.presentedRatio = self.presentedRatio;
    configuration.animationDuration = self.animationDuration;
    configuration.allowsInteractiveDismiss = self.allowsInteractiveDismiss;
    configuration.dismissOnBackgroundTap = self.dismissOnBackgroundTap;
    configuration.backgroundColor = self.backgroundColor;
    return configuration;
}

-(instancetype)byDirection:(JobsViewPushDirection)direction{
    self.direction = direction;
    return self;
}

-(instancetype)byPresentedRatio:(CGFloat)presentedRatio{
    self.presentedRatio = MIN(MAX(presentedRatio, 0.1), 1);
    return self;
}

-(instancetype)byAnimationDuration:(NSTimeInterval)animationDuration{
    self.animationDuration = MAX(animationDuration, 0);
    return self;
}

-(instancetype)byAllowsInteractiveDismiss:(BOOL)allowsInteractiveDismiss{
    self.allowsInteractiveDismiss = allowsInteractiveDismiss;
    return self;
}

-(instancetype)byDismissOnBackgroundTap:(BOOL)dismissOnBackgroundTap{
    self.dismissOnBackgroundTap = dismissOnBackgroundTap;
    return self;
}

-(instancetype)byBackgroundColor:(UIColor *)backgroundColor{
    self.backgroundColor = backgroundColor;
    return self;
}

@end

@implementation JobsViewPushPresentation
-(instancetype)initWithSourceView:(UIView *)sourceView
                    presentedView:(UIView *)presentedView
                    configuration:(JobsViewPushConfiguration *)configuration{
    if (self = [super init]) {
        _sourceView = sourceView;
        _presentedView = presentedView;
        _configuration = configuration.copy;
        [self install];
    };return self;
}

-(void)presentWithCompletion:(JobsViewPushCompletionBlock)completion{
    UIView *presentedView = self.presentedView;
    if (!presentedView) return;
    self.isPresented = YES;
    self.isAnimatingTransition = YES;
    CGRect visibleFrame = [self visibleFrameForBounds:self.transitionView.bounds];
    presentedView.transform = CGAffineTransformIdentity;
    presentedView.frame = [self hiddenFrameForVisibleFrame:visibleFrame];
    JobsViewPushCompletionBlock animations = ^{
        presentedView.frame = visibleFrame;
        self.transitionView.byBgColor(self.configuration.backgroundColor);
        [presentedView layoutIfNeeded];
    };
    if (self.configuration.animationDuration <= 0) {
        animations();
        self.isAnimatingTransition = NO;
        if (completion) completion();
        return;
    }
    [UIView animateWithDuration:self.configuration.animationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:animations
                     completion:^(__unused BOOL finished) {
        self.isAnimatingTransition = NO;
        if (completion) completion();
    }];
}

-(void)dismissAnimated:(BOOL)animated completion:(JobsViewPushCompletionBlock)completion{
    UIView *presentedView = self.presentedView;
    if (!self.isPresented || !presentedView) {
        if (completion) completion();
        return;
    }
    self.isPresented = NO;
    self.isAnimatingTransition = YES;
    [presentedView.layer removeAllAnimations];
    [self.transitionView.layer removeAllAnimations];
    CGRect visibleFrame = [self visibleFrameForBounds:self.transitionView.bounds];
    presentedView.transform = CGAffineTransformIdentity;
    presentedView.frame = visibleFrame;
    [presentedView.superview layoutIfNeeded];
    JobsViewPushCompletionBlock animations = ^{
        presentedView.frame = [self hiddenFrameForVisibleFrame:visibleFrame];
        self.transitionView.byBgColor(UIColor.clearColor);
        [presentedView layoutIfNeeded];
    };
    void (^finish)(BOOL) = ^(__unused BOOL finished) {
        self.isAnimatingTransition = NO;
        [presentedView removeFromSuperview];
        [self.transitionView removeFromSuperview];
        if (self.sourceView.jobsViewPushPresentation == self) {
            self.sourceView.jobsViewPushPresentation = nil;
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

-(void)install{
    UIView *sourceView = self.sourceView;
    UIView *presentedView = self.presentedView;
    if (!sourceView || !presentedView) return;
    self.transitionView = [[JobsViewPushTransitionView alloc] initWithFrame:sourceView.bounds];
    self.transitionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.transitionView.byBgColor(UIColor.clearColor);
    self.transitionView.presentation = self;
    self.transitionView.addOn(sourceView);
    presentedView.addOn(self.transitionView);
    [self layoutPresentedView];
    if (self.configuration.dismissOnBackgroundTap) {
        self.backgroundTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(backgroundTapped:)];
        self.backgroundTapGesture.delegate = self;
        [self.transitionView addGestureRecognizer:self.backgroundTapGesture];
    }
    if (self.configuration.allowsInteractiveDismiss) {
        self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                  action:@selector(panned:)];
        [presentedView addGestureRecognizer:self.panGesture];
    }
}

-(void)layoutPresentedView{
    UIView *presentedView = self.presentedView;
    if (!presentedView) return;
    if (self.isAnimatingTransition) return;
    CGRect bounds = self.transitionView.bounds;
    CGRect visibleFrame = [self visibleFrameForBounds:bounds];
    presentedView.transform = CGAffineTransformIdentity;
    presentedView.frame = self.isPresented ? visibleFrame : [self hiddenFrameForVisibleFrame:visibleFrame];
}

-(CGRect)visibleFrameForBounds:(CGRect)bounds{
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
}

-(CGRect)hiddenFrameForVisibleFrame:(CGRect)visibleFrame{
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
}

-(CGFloat)interactiveOffsetForTranslation:(CGPoint)translation{
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
}

-(CGFloat)interactiveVelocityForVelocity:(CGPoint)velocity{
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
}

-(CGFloat)interactiveDistance{
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
}

-(void)applyInteractiveOffset:(CGFloat)offset{
    UIView *presentedView = self.presentedView;
    if (!presentedView) return;
    CGFloat progress = MIN(fabs(offset) / self.interactiveDistance, 1);
    CGFloat limitedOffset = self.interactiveDistance * progress;
    switch (self.configuration.direction) {
        /// 处理 JobsViewPushDirectionTop 分支
        case JobsViewPushDirectionTop:
            presentedView.frame = CGRectOffset([self visibleFrameForBounds:self.transitionView.bounds], 0, -limitedOffset);
            break;
        /// 处理 JobsViewPushDirectionBottom 分支
        case JobsViewPushDirectionBottom:
            presentedView.frame = CGRectOffset([self visibleFrameForBounds:self.transitionView.bounds], 0, limitedOffset);
            break;
        /// 处理 JobsViewPushDirectionLeft 分支
        case JobsViewPushDirectionLeft:
            presentedView.frame = CGRectOffset([self visibleFrameForBounds:self.transitionView.bounds], -limitedOffset, 0);
            break;
        /// 处理 JobsViewPushDirectionRight 分支
        case JobsViewPushDirectionRight:
            presentedView.frame = CGRectOffset([self visibleFrameForBounds:self.transitionView.bounds], limitedOffset, 0);
            break;
    }
    CGFloat alpha = CGColorGetAlpha(self.configuration.backgroundColor.CGColor) * (1 - progress);
    self.transitionView.byBgColor([self.configuration.backgroundColor colorWithAlphaComponent:alpha]);
}

-(void)restoreAfterInteractiveDismiss{
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
        self.presentedView.transform = CGAffineTransformIdentity;
        self.presentedView.frame = [self visibleFrameForBounds:self.transitionView.bounds];
        self.transitionView.byBgColor(self.configuration.backgroundColor);
        [self.presentedView layoutIfNeeded];
    }
                     completion:nil];
}

-(void)backgroundTapped:(UITapGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self dismissAnimated:YES completion:nil];
    }
}

-(void)panned:(UIPanGestureRecognizer *)gesture{
    CGFloat offset = [self interactiveOffsetForTranslation:[gesture translationInView:self.transitionView]];
    switch (gesture.state) {
        /// 处理 UIGestureRecognizerStateBegan 分支
        case UIGestureRecognizerStateBegan:
        /// 处理 UIGestureRecognizerStateChanged 分支
        case UIGestureRecognizerStateChanged:
            [self applyInteractiveOffset:offset];
            break;
        /// 处理 UIGestureRecognizerStateEnded 分支
        case UIGestureRecognizerStateEnded:
        /// 处理 UIGestureRecognizerStateCancelled 分支
        case UIGestureRecognizerStateCancelled:
        /// 处理 UIGestureRecognizerStateFailed 分支
        case UIGestureRecognizerStateFailed: {
            CGFloat progress = MIN(fabs(offset) / self.interactiveDistance, 1);
            CGFloat velocity = [self interactiveVelocityForVelocity:[gesture velocityInView:self.transitionView]];
            BOOL shouldDismiss = gesture.state == UIGestureRecognizerStateEnded &&
                (progress >= 0.35 || velocity >= 500);
            shouldDismiss ? [self dismissAnimated:YES completion:nil] : [self restoreAfterInteractiveDismiss];
            break;
        }
        /// 未匹配已知分支时执行兜底处理
        default:
            break;
    }
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
      shouldReceiveTouch:(UITouch *)touch{
    if (gestureRecognizer != self.backgroundTapGesture || !self.presentedView) return YES;
    return ![touch.view isDescendantOfView:self.presentedView];
}

@end

@implementation JobsViewPushTransitionView
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.presentation layoutPresentedView];
}

@end

@implementation UIView (JobsViewPush)
-(JobsViewPushPresentation *)jobsPushView:(UIView *)presentedView{
    return [self jobsPushView:presentedView
                configuration:nil
                   completion:nil];
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
                                              configuration:configuration ?: JobsViewPushConfiguration.defaultConfiguration];
    self.jobsViewPushPresentation = presentation;
    [presentation presentWithCompletion:completion];
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
