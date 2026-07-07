//
//  JobsPresentTransitionMgr.m
//  JobsPresentTransitionMgr
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsPresentTransitionMgr.h"

static const CGFloat JobsPresentTransitionDefaultTime = 0.35f;
static const CGFloat JobsPresentTransitionDefaultRatio = 0.5f;
static const CGFloat JobsPresentTransitionDefaultDimmingAlpha = 0.5f;
static const CGFloat JobsPresentTransitionDefaultCornerRadius = 16.f;
static char JobsPresentTransitionMgrAssociatedKey;

@interface JobsPresentTransitionMgr ()

Prop_strong()UIView *dimmingView;
Prop_strong()UIView *presentationWrappingView;
Prop_strong()UIView *presentationRoundedCornerView;
Prop_strong()UIView *presentedViewControllerWrapperView;
Prop_strong()UIPanGestureRecognizer *panGestureRecognizer;
Prop_assign()CGRect panStartFrame;
Prop_assign()CGRect interactiveFrame;
Prop_assign()BOOL hasInteractiveFrame;
Prop_assign()BOOL hasCustomPresentedRatio;

-(void)jobs_dimmingViewDidTap:(UITapGestureRecognizer *)tapGestureRecognizer;
-(void)jobs_handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer;

@end

@implementation JobsPresentTransitionMgr
@synthesize time = _time;
@synthesize direction = _direction;
@synthesize presentedRatio = _presentedRatio;
@synthesize dimmingAlpha = _dimmingAlpha;
@synthesize cornerRadius = _cornerRadius;

#pragma mark —— Init
-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                      presentingViewController:(UIViewController *)presentingViewController{
    if (self = [super initWithPresentedViewController:presentedViewController
                             presentingViewController:presentingViewController]) {
        _time = JobsPresentTransitionDefaultTime;
        _direction = JobsTransitionDirectionBottom;
        _presentedRatio = JobsPresentTransitionDefaultRatio;
        _dimmingAlpha = JobsPresentTransitionDefaultDimmingAlpha;
        _cornerRadius = JobsPresentTransitionDefaultCornerRadius;
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
        presentedViewController.transitioningDelegate = self;
        objc_setAssociatedObject(presentedViewController,
                                 &JobsPresentTransitionMgrAssociatedKey,
                                 self,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };return self;
}

#pragma mark —— Public
+(instancetype)presentViewController:(UIViewController *)presentedViewController
                   fromViewController:(UIViewController *)presentingViewController{
    return [self presentViewController:presentedViewController
                    fromViewController:presentingViewController
                             configure:nil
                            completion:nil];
}

+(instancetype)presentViewController:(UIViewController *)presentedViewController
                   fromViewController:(UIViewController *)presentingViewController
                            configure:(jobsByPresentTransitionManagerBlock)configure
                           completion:(jobsByVoidBlock)completion{
    if (!presentedViewController || !presentingViewController) return nil;
    JobsPresentTransitionMgr *manager = [self.alloc initWithPresentedViewController:presentedViewController
                                                           presentingViewController:presentingViewController];
    if (configure) configure(manager);
    [manager presentFromViewController:presentingViewController
                            completion:completion];
    return manager;
}

-(void)presentFromViewController:(UIViewController *)presentingViewController
                      completion:(jobsByVoidBlock)completion{
    if (!presentingViewController || presentingViewController.presentedViewController) return;
    self.presentedViewController.transitioningDelegate = self;
    [presentingViewController presentViewController:self.presentedViewController
                                          animated:YES
                                        completion:completion];
}

#pragma mark —— Setter
-(void)setPresentedRatio:(CGFloat)presentedRatio{
    _hasCustomPresentedRatio = YES;
    _presentedRatio = [self jobs_clampedRatio:presentedRatio];
}

-(void)setDimmingAlpha:(CGFloat)dimmingAlpha{
    _dimmingAlpha = MIN(MAX(0, dimmingAlpha), 1);
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = MAX(0, cornerRadius);
}

#pragma mark —— UIPresentationController
-(BOOL)shouldRemovePresentersView{
    return NO;
}

-(UIView *)presentedView{
    return self.presentationWrappingView;
}

-(void)presentationTransitionWillBegin{
    UIView *presentedViewControllerView = [super presentedView];
    UIView *presentationWrapperView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(self.frameOfPresentedViewInContainerView)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
            .byLayer(^(CALayer *layer) {
                layer
                    .byShadowOpacity(0.44f)
                    .byShadowRadius(13.f)
                    .byShadowOffset([self jobs_shadowOffset]);
            });
    });
    self.presentationWrappingView = presentationWrapperView;
    self.panGestureRecognizer = [UIPanGestureRecognizer.alloc initWithTarget:self
                                                                      action:@selector(jobs_handlePanGesture:)];
    self.panGestureRecognizer.delegate = self;
    [presentationWrapperView addGestureRecognizer:self.panGestureRecognizer];

    UIView *presentationRoundedCornerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(presentationWrapperView.bounds)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
            .byLayer(^(CALayer *layer) {
                layer
                    .byCornerRadius(self.cornerRadius)
                    .byMaskedCorners([self jobs_maskedCorners])
                    .byMasksToBounds(YES);
            });
    });
    self.presentationRoundedCornerView = presentationRoundedCornerView;

    UIView *presentedViewControllerWrapperView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(presentationRoundedCornerView.bounds)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    });
    self.presentedViewControllerWrapperView = presentedViewControllerWrapperView;

    presentedViewControllerView
        .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
        .byFrame(presentedViewControllerWrapperView.bounds)
        .addOn(presentedViewControllerWrapperView);
    presentedViewControllerWrapperView.addOn(presentationRoundedCornerView);
    presentationRoundedCornerView.addOn(presentationWrapperView);

    UIView *dimmingView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byFrame(self.containerView.bounds)
            .byBgColor(UIColor.blackColor)
            .byOpaque(NO)
            .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    });
    [dimmingView addGestureRecognizer:[UITapGestureRecognizer.alloc initWithTarget:self
                                                                            action:@selector(jobs_dimmingViewDidTap:)]];
    self.dimmingView = dimmingView;
    dimmingView.addOn(self.containerView);

    self.dimmingView.byAlpha(0.f);
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    if (transitionCoordinator) {
        @jobs_weakify(self)
        [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            @jobs_strongify(self)
            self.dimmingView.byAlpha(self.dimmingAlpha);
        } completion:NULL];
    }else self.dimmingView.byAlpha(self.dimmingAlpha);
}

-(void)presentationTransitionDidEnd:(BOOL)completed{
    if (!completed) [self jobs_clearPresentationViews];
}

-(void)dismissalTransitionWillBegin{
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    if (transitionCoordinator) {
        @jobs_weakify(self)
        [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            @jobs_strongify(self)
            self.dimmingView.byAlpha(0.f);
        } completion:NULL];
    }else self.dimmingView.byAlpha(0.f);
}

-(void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        objc_setAssociatedObject(self.presentedViewController,
                                 &JobsPresentTransitionMgrAssociatedKey,
                                 nil,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self jobs_clearPresentationViews];
    }
}

-(void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container{
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    if (container == self.presentedViewController) [self.containerView setNeedsLayout];
}

-(CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container
              withParentContainerSize:(CGSize)parentSize{
    if (container == self.presentedViewController) {
        return [self jobs_targetFrameInContainerBounds:CGRectMake(0, 0, parentSize.width, parentSize.height)].size;
    }else return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}

-(CGRect)frameOfPresentedViewInContainerView{
    if (self.hasInteractiveFrame) return self.interactiveFrame;
    return [self jobs_targetFrameInContainerBounds:self.containerView.bounds];
}

-(void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];
    self.dimmingView.byFrame(self.containerView.bounds);
    self.presentationWrappingView.byFrame(self.frameOfPresentedViewInContainerView);
    self.presentationRoundedCornerView.byFrame(self.presentationWrappingView.bounds);
    self.presentedViewControllerWrapperView.byFrame(self.presentationRoundedCornerView.bounds);
    self.presentedViewController.view.byFrame(self.presentedViewControllerWrapperView.bounds);
}

#pragma mark —— UIViewControllerTransitioningDelegate
-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented
                                                     presentingViewController:(UIViewController *)presenting
                                                         sourceViewController:(UIViewController *)source{
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting
                                                                     sourceController:(UIViewController *)source{
    return self;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self;
}

#pragma mark —— UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return transitionContext.isAnimated ? self.time : 0;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey] ? : toViewController.view;
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey] ? : fromViewController.view;
    BOOL isPresenting = (toViewController == self.presentedViewController);

    if (isPresenting) {
        CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toViewController];
        if (CGRectIsEmpty(toViewFinalFrame)) toViewFinalFrame = self.frameOfPresentedViewInContainerView;
        toView.byFrame([self jobs_offscreenFrameFromFrame:toViewFinalFrame
                                          inContainerView:containerView]);
        [containerView addSubview:toView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.88
              initialSpringVelocity:0.8
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            toView.byFrame(toViewFinalFrame);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }else{
        if (toView && !toView.superview) [containerView insertSubview:toView belowSubview:fromView];
        CGRect fromViewInitialFrame = fromView.frame;
        CGRect fromViewFinalFrame = [self jobs_offscreenFrameFromFrame:fromViewInitialFrame
                                                       inContainerView:containerView];
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.88
              initialSpringVelocity:0.8
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
            fromView.byFrame(fromViewFinalFrame);
        } completion:^(BOOL finished) {
            if (transitionContext.transitionWasCancelled) fromView.byFrame(fromViewInitialFrame);
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }];
    }
}

#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer != self.panGestureRecognizer) return YES;
    UIPanGestureRecognizer *panGestureRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
    CGPoint velocity = [panGestureRecognizer velocityInView:self.containerView];
    if (![self jobs_isVelocityTowardDismissDirection:velocity]) return NO;
    UIScrollView *scrollView = [self jobs_hitScrollViewByGesture:gestureRecognizer];
    if (!scrollView) return YES;
    CGFloat scrollTop = -scrollView.contentInset.top;
    if (self.direction == JobsTransitionDirectionBottom && velocity.y > 0 && scrollView.contentOffset.y > scrollTop + 0.5) return NO;
    return YES;
}

#pragma mark —— Gesture
-(void)jobs_dimmingViewDidTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

-(void)jobs_handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    if (!self.presentationWrappingView || !self.containerView) return;
    switch (panGestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.panStartFrame = self.presentationWrappingView.frame;
            self.interactiveFrame = self.panStartFrame;
            self.hasInteractiveFrame = YES;
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat movement = [self jobs_dismissMovementByTranslation:[panGestureRecognizer translationInView:self.containerView]];
            self.interactiveFrame = [self jobs_interactiveFrameByMovement:movement];
            self.presentationWrappingView.byFrame(self.interactiveFrame);
        } break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed: {
            CGFloat movement = [self jobs_dismissMovementByTranslation:[panGestureRecognizer translationInView:self.containerView]];
            CGFloat velocity = [self jobs_dismissMovementByVelocity:[panGestureRecognizer velocityInView:self.containerView]];
            CGFloat threshold = [self jobs_axisLengthOfFrame:self.presentationWrappingView.frame] * 0.25f;
            if (movement > threshold || velocity > 600.f) {
                [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
            }else{
                self.interactiveFrame = [self jobs_targetFrameInContainerBounds:self.containerView.bounds];
                [UIView animateWithDuration:0.28
                                      delay:0
                     usingSpringWithDamping:0.88
                      initialSpringVelocity:fabs(velocity) / 1000.f
                                    options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{
                    self.presentationWrappingView.byFrame(self.interactiveFrame);
                } completion:^(BOOL finished) {
                    self.hasInteractiveFrame = NO;
                }];
            }
        } break;
        default:
            break;
    }
}

#pragma mark —— Frame
-(CGRect)jobs_targetFrameInContainerBounds:(CGRect)containerViewBounds{
    CGRect frame = containerViewBounds;
    CGFloat ratio = [self jobs_effectivePresentedRatioInContainerBounds:containerViewBounds];
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            frame.size.height = CGRectGetHeight(containerViewBounds) * ratio;
            frame.origin.y = CGRectGetMinY(containerViewBounds);
            break;
        case JobsTransitionDirectionBottom:
            frame.size.height = CGRectGetHeight(containerViewBounds) * ratio;
            frame.origin.y = CGRectGetMaxY(containerViewBounds) - CGRectGetHeight(frame);
            break;
        case JobsTransitionDirectionLeft:
            frame.size.width = CGRectGetWidth(containerViewBounds) * ratio;
            frame.origin.x = CGRectGetMinX(containerViewBounds);
            break;
        case JobsTransitionDirectionRight:
            frame.size.width = CGRectGetWidth(containerViewBounds) * ratio;
            frame.origin.x = CGRectGetMaxX(containerViewBounds) - CGRectGetWidth(frame);
            break;
    };return frame;
}

-(CGRect)jobs_offscreenFrameFromFrame:(CGRect)frame
                      inContainerView:(UIView *)containerView{
    CGRect containerBounds = containerView.bounds;
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            frame.origin.y = CGRectGetMinY(containerBounds) - CGRectGetHeight(frame);
            break;
        case JobsTransitionDirectionBottom:
            frame.origin.y = CGRectGetMaxY(containerBounds);
            break;
        case JobsTransitionDirectionLeft:
            frame.origin.x = CGRectGetMinX(containerBounds) - CGRectGetWidth(frame);
            break;
        case JobsTransitionDirectionRight:
            frame.origin.x = CGRectGetMaxX(containerBounds);
            break;
    };return frame;
}

-(CGRect)jobs_interactiveFrameByMovement:(CGFloat)movement{
    CGFloat offset = MAX(0, movement);
    CGRect frame = self.panStartFrame;
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            frame.origin.y -= offset;
            break;
        case JobsTransitionDirectionBottom:
            frame.origin.y += offset;
            break;
        case JobsTransitionDirectionLeft:
            frame.origin.x -= offset;
            break;
        case JobsTransitionDirectionRight:
            frame.origin.x += offset;
            break;
    };return frame;
}

#pragma mark —— Helpers
-(CGFloat)jobs_effectivePresentedRatioInContainerBounds:(CGRect)containerViewBounds{
    CGFloat axisLength = [self jobs_axisLengthOfFrame:containerViewBounds];
    CGFloat contentLength = [self jobs_contentLengthForDirectionInContainerBounds:containerViewBounds];
    if (!self.hasCustomPresentedRatio && contentLength > 0 && axisLength > 0) {
        return [self jobs_clampedRatio:contentLength / axisLength];
    };return [self jobs_clampedRatio:self.presentedRatio];
}

-(CGFloat)jobs_contentLengthForDirectionInContainerBounds:(CGRect)containerViewBounds{
    CGSize preferredContentSize = self.presentedViewController.preferredContentSize;
    BOOL vertical = self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom;
    CGFloat length = vertical ? preferredContentSize.height : preferredContentSize.width;
    if (length <= 0 && vertical) length = [self jobs_presentUpHeightFromPresentedViewController];
    CGFloat maxLength = vertical ? CGRectGetHeight(containerViewBounds) : CGRectGetWidth(containerViewBounds);
    return MIN(MAX(0, length), maxLength);
}

-(CGFloat)jobs_presentUpHeightFromPresentedViewController{
    SEL selector = NSSelectorFromString(@"presentUpHeight");
    if (![self.presentedViewController respondsToSelector:selector]) return 0;
    @try {
        return [[self.presentedViewController valueForKey:@"presentUpHeight"] doubleValue];
    } @catch (NSException *exception) {
        return 0;
    }
}

-(CGFloat)jobs_clampedRatio:(CGFloat)ratio{
    return MIN(MAX(0.01f, ratio), 1.f);
}

-(CGFloat)jobs_axisLengthOfFrame:(CGRect)frame{
    return (self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom) ? CGRectGetHeight(frame) : CGRectGetWidth(frame);
}

-(CGFloat)jobs_dismissMovementByTranslation:(CGPoint)translation{
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            return MAX(0, -translation.y);
        case JobsTransitionDirectionBottom:
            return MAX(0, translation.y);
        case JobsTransitionDirectionLeft:
            return MAX(0, -translation.x);
        case JobsTransitionDirectionRight:
            return MAX(0, translation.x);
    };return 0;
}

-(CGFloat)jobs_dismissMovementByVelocity:(CGPoint)velocity{
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            return -velocity.y;
        case JobsTransitionDirectionBottom:
            return velocity.y;
        case JobsTransitionDirectionLeft:
            return -velocity.x;
        case JobsTransitionDirectionRight:
            return velocity.x;
    };return 0;
}

-(BOOL)jobs_isVelocityTowardDismissDirection:(CGPoint)velocity{
    BOOL vertical = self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom;
    if (vertical && fabs(velocity.y) <= fabs(velocity.x)) return NO;
    if (!vertical && fabs(velocity.x) <= fabs(velocity.y)) return NO;
    return [self jobs_dismissMovementByVelocity:velocity] > 0;
}

-(UIScrollView *)jobs_hitScrollViewByGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:self.presentationWrappingView];
    UIView *hitView = [self.presentationWrappingView hitTest:point
                                                   withEvent:nil];
    while (hitView) {
        if ([hitView isKindOfClass:UIScrollView.class]) return (UIScrollView *)hitView;
        hitView = hitView.superview;
    };return nil;
}

-(CACornerMask)jobs_maskedCorners{
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            return kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
        case JobsTransitionDirectionBottom:
            return kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
        case JobsTransitionDirectionLeft:
            return kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
        case JobsTransitionDirectionRight:
            return kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner;
    };return kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
}

-(CGSize)jobs_shadowOffset{
    switch (self.direction) {
        case JobsTransitionDirectionTop:
            return CGSizeMake(0, 6.f);
        case JobsTransitionDirectionBottom:
            return CGSizeMake(0, -6.f);
        case JobsTransitionDirectionLeft:
            return CGSizeMake(6.f, 0);
        case JobsTransitionDirectionRight:
            return CGSizeMake(-6.f, 0);
    };return CGSizeZero;
}

-(void)jobs_clearPresentationViews{
    self.presentationWrappingView = nil;
    self.presentationRoundedCornerView = nil;
    self.presentedViewControllerWrapperView = nil;
    self.dimmingView = nil;
    self.panGestureRecognizer = nil;
    self.hasInteractiveFrame = NO;
}

@end
