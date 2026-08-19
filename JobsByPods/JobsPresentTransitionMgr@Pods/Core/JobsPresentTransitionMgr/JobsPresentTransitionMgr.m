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
-(jobsByTapGestureRecognizerBlock _Nonnull)jobsJobs_dimmingViewDidTap;
-(void)jobs_handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer;
-(jobsByPanGestureRecognizerBlock _Nonnull)jobsJobs_handlePanGesture;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsPresentTransitionMgr
@interface JobsPresentTransitionMgr (JobsPropertyDSLSetterAutogen_478a868eec)
-(void)setDimmingView:(UIView * _Nullable)data;
-(void)setHasInteractiveFrame:(BOOL)data;
-(void)setInteractiveFrame:(CGRect)data;
-(void)setPanGestureRecognizer:(UIPanGestureRecognizer * _Nullable)data;
-(void)setPanStartFrame:(CGRect)data;
-(void)setPresentationRoundedCornerView:(UIView * _Nullable)data;
-(void)setPresentationWrappingView:(UIView * _Nullable)data;
-(void)setPresentedViewControllerWrapperView:(UIView * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsPresentTransitionMgr

@implementation JobsPresentTransitionMgr
@synthesize time = _time;
@synthesize direction = _direction;
@synthesize presentedRatio = _presentedRatio;
@synthesize dimmingAlpha = _dimmingAlpha;
@synthesize cornerRadius = _cornerRadius;

-(JobsRetJobsPresentTransitionMgrByTimeIntervalBlock _Nonnull)byTime{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr *_Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        self.time = data;
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr *_Nullable(JobsTransitionDirection data){
        @jobs_strongify(self)
        self.direction = data;
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byPresentedRatio{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.presentedRatio = data;
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byDimmingAlpha{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.dimmingAlpha = data;
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byCornerRadius{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr *_Nullable(CGFloat data){
        @jobs_strongify(self)
        self.cornerRadius = data;
        return self;
    };
}

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
    self.presentedViewController.byTransitioningDelegate(self);
    [presentingViewController presentViewController:self.presentedViewController
                                          animated:YES
                                        completion:completion];
}

#pragma mark —— Setter
-(void)setPresentedRatio:(CGFloat)presentedRatio{
    _hasCustomPresentedRatio = YES;
    _presentedRatio = self.jobs_clampedRatio(presentedRatio);
}

-(void)setDimmingAlpha:(CGFloat)dimmingAlpha{
    _dimmingAlpha = MIN(MAX(0, dimmingAlpha), 1);
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = MAX(0, cornerRadius);
}

#pragma mark —— UIPresentationController
-(BOOL)shouldRemovePresentersView{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsShouldRemovePresentersView)))(self, @selector(jobsShouldRemovePresentersView)))();
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsShouldRemovePresentersView{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NO;
    };
}

-(UIView *)presentedView{
    return (((JobsRetViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsPresentedView)))(self, @selector(jobsPresentedView)))();
}

-(JobsRetViewByVoidBlock _Nonnull)jobsPresentedView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.presentationWrappingView;
    };
}

-(void)presentationTransitionWillBegin{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsPresentationTransitionWillBegin)))(self, @selector(jobsPresentationTransitionWillBegin)))();
}

-(jobsByVoidBlock _Nonnull)jobsPresentationTransitionWillBegin{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIView *presentedViewControllerView = [super presentedView];
        UIView *presentationWrapperView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(self.frameOfPresentedViewInContainerView)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byShadowOpacity(0.44f)
                        .byShadowRadius(13.f)
                        .byShadowOffset(self.jobs_shadowOffset());
                });
        });
        self.byPresentationWrappingView(presentationWrapperView);
        self.panGestureRecognizer = [UIPanGestureRecognizer.alloc initWithTarget:self
                                                                          action:@selector(jobs_handlePanGesture:)];
        self.panGestureRecognizer.byDelegate(self);
        [presentationWrapperView addGestureRecognizer:self.panGestureRecognizer];
        UIView *presentationRoundedCornerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(presentationWrapperView.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .byLayer(^(CALayer *layer) {
                    layer
                        .byCornerRadius(self.cornerRadius)
                        .byMaskedCorners(self.jobs_maskedCorners())
                        .byMasksToBounds(YES);
                });
        });
        self.byPresentationRoundedCornerView(presentationRoundedCornerView);
        UIView *presentedViewControllerWrapperView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(presentationRoundedCornerView.bounds)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        });
        self.byPresentedViewControllerWrapperView(presentedViewControllerWrapperView);
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
        self.byDimmingView(dimmingView);
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
    };
}

-(void)presentationTransitionDidEnd:(BOOL)completed{
    ((((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(presentationTransitionDidEnd)))(self, @selector(presentationTransitionDidEnd))))(completed);
}
-(jobsByBOOLBlock _Nonnull)presentationTransitionDidEnd{
    @jobs_weakify(self)
    return ^(BOOL completed){
        @jobs_strongify(self)
        if (!self) return;
        if (!completed) self.jobs_clearPresentationViews();
    };
}

-(void)dismissalTransitionWillBegin{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsDismissalTransitionWillBegin)))(self, @selector(jobsDismissalTransitionWillBegin)))();
}

-(jobsByVoidBlock _Nonnull)jobsDismissalTransitionWillBegin{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
        if (transitionCoordinator) {
            @jobs_weakify(self)
            [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
                @jobs_strongify(self)
                self.dimmingView.byAlpha(0.f);
            } completion:NULL];
        }else self.dimmingView.byAlpha(0.f);
    };
}

-(void)dismissalTransitionDidEnd:(BOOL)completed{
    ((((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(dismissalTransitionDidEnd)))(self, @selector(dismissalTransitionDidEnd))))(completed);
}
-(jobsByBOOLBlock _Nonnull)dismissalTransitionDidEnd{
    @jobs_weakify(self)
    return ^(BOOL completed){
        @jobs_strongify(self)
        if (!self) return;
        if (completed) {
            objc_setAssociatedObject(self.presentedViewController,
                                     &JobsPresentTransitionMgrAssociatedKey,
                                     nil,
                                     OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            self.jobs_clearPresentationViews();
        }
    };
}

-(void)preferredContentSizeDidChangeForChildContentContainer:(id<UIContentContainer>)container{
    ((((jobsByIDUIContentContainerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(preferredContentSizeDidChangeForChildContentContainer)))(self, @selector(preferredContentSizeDidChangeForChildContentContainer))))(container);
}
-(jobsByIDUIContentContainerBlock _Nonnull)preferredContentSizeDidChangeForChildContentContainer{
    @jobs_weakify(self)
    return ^(id<UIContentContainer> container){
        @jobs_strongify(self)
        if (!self) return;
        [super preferredContentSizeDidChangeForChildContentContainer:container];
        if (container == self.presentedViewController) [self.containerView setNeedsLayout];
    };
}

-(CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container
              withParentContainerSize:(CGSize)parentSize{
    if (container == self.presentedViewController) {
        return self.jobs_targetFrameInContainerBounds(CGRectMake(0, 0, parentSize.width, parentSize.height)).size;
    }else return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
}

-(CGRect)frameOfPresentedViewInContainerView{
    JobsRetFrameByVoidBlock action = ((JobsRetFrameByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsFrameOfPresentedViewInContainerView)))(self, @selector(jobsFrameOfPresentedViewInContainerView));
    return action ? action() : (CGRect){0};
}

-(JobsRetFrameByVoidBlock _Nonnull)jobsFrameOfPresentedViewInContainerView{
    @jobs_weakify(self)
    return ^CGRect{
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        if (self.hasInteractiveFrame) return self.interactiveFrame;
        return self.jobs_targetFrameInContainerBounds(self.containerView.bounds);
    };
}

-(void)containerViewWillLayoutSubviews{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsContainerViewWillLayoutSubviews)))(self, @selector(jobsContainerViewWillLayoutSubviews)))();
}

-(jobsByVoidBlock _Nonnull)jobsContainerViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super containerViewWillLayoutSubviews];
        self.dimmingView.byFrame(self.containerView.bounds);
        self.presentationWrappingView.byFrame(self.frameOfPresentedViewInContainerView);
        self.presentationRoundedCornerView.byFrame(self.presentationWrappingView.bounds);
        self.presentedViewControllerWrapperView.byFrame(self.presentationRoundedCornerView.bounds);
        self.presentedViewController.view.byFrame(self.presentedViewControllerWrapperView.bounds);
    };
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
    return ((((JobsRetIDUIViewControllerAnimatedTransitioningByUIViewControllerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(animationControllerForDismissedController)))(self, @selector(animationControllerForDismissedController))))(dismissed);
}
-(JobsRetIDUIViewControllerAnimatedTransitioningByUIViewControllerBlock _Nonnull)animationControllerForDismissedController{
    @jobs_weakify(self)
    return ^id<UIViewControllerAnimatedTransitioning>(UIViewController * dismissed){
        @jobs_strongify(self)
        if (!self) return nil;
        return self;
    };
}

#pragma mark —— UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock action = ((JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsTransitionDuration)))(self, @selector(jobsTransitionDuration));
    return action ? action(transitionContext) : (NSTimeInterval){0};
}

-(JobsRetNSTimeIntervalByIDUIViewControllerContextTransitioningBlock _Nonnull)jobsTransitionDuration{
    @jobs_weakify(self)
    return ^NSTimeInterval(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return (NSTimeInterval){0};
        return transitionContext.isAnimated ? self.time : 0;
    };
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ((((jobsByIDUIViewControllerContextTransitioningBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(animateTransition)))(self, @selector(animateTransition))))(transitionContext);
}
-(jobsByIDUIViewControllerContextTransitioningBlock _Nonnull)animateTransition{
    @jobs_weakify(self)
    return ^(id<UIViewControllerContextTransitioning> transitionContext){
        @jobs_strongify(self)
        if (!self) return;
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
            toView.addOn(containerView);
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
    };
}

#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    JobsRetBOOLByUIGestureRecognizerBlock action = ((JobsRetBOOLByUIGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsGestureRecognizerShouldBegin)))(self, @selector(jobsGestureRecognizerShouldBegin));
    return action ? action(gestureRecognizer) : NO;
}

-(JobsRetBOOLByUIGestureRecognizerBlock _Nonnull)jobsGestureRecognizerShouldBegin{
    @jobs_weakify(self)
    return ^BOOL(UIGestureRecognizer * gestureRecognizer){
        @jobs_strongify(self)
        if (!self) return NO;
        if (gestureRecognizer != self.panGestureRecognizer) return YES;
        UIPanGestureRecognizer *panGestureRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint velocity = [panGestureRecognizer velocityInView:self.containerView];
        if (!self.jobs_isVelocityTowardDismissDirection(velocity)) return NO;
        UIScrollView *scrollView = self.jobs_hitScrollViewByGesture(gestureRecognizer);
        if (!scrollView) return YES;
        CGFloat scrollTop = -scrollView.contentInset.top;
        if (self.direction == JobsTransitionDirectionBottom && velocity.y > 0 && scrollView.contentOffset.y > scrollTop + 0.5) return NO;
        return YES;
    };
}

#pragma mark —— Gesture
-(void)jobs_dimmingViewDidTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    jobsByTapGestureRecognizerBlock action = ((jobsByTapGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsJobs_dimmingViewDidTap)))(self, @selector(jobsJobs_dimmingViewDidTap));
    if (action) action(tapGestureRecognizer);
}

-(jobsByTapGestureRecognizerBlock _Nonnull)jobsJobs_dimmingViewDidTap{
    @jobs_weakify(self)
    return ^(UITapGestureRecognizer * tapGestureRecognizer){
        @jobs_strongify(self)
        if (!self) return;
        [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    };
}

-(void)jobs_handlePanGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentTransitionMgr.class, @selector(jobsJobs_handlePanGesture)))(self, @selector(jobsJobs_handlePanGesture));
    if (action) action(panGestureRecognizer);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsJobs_handlePanGesture{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * panGestureRecognizer){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.presentationWrappingView || !self.containerView) return;
        switch (panGestureRecognizer.state) {
            /// 处理 UIGestureRecognizerStateBegan 分支
            case UIGestureRecognizerStateBegan:
                self.byPanStartFrame(self.presentationWrappingView.frame);
                self.byInteractiveFrame(self.panStartFrame);
                self.byHasInteractiveFrame(YES);
                break;
            /// 处理 UIGestureRecognizerStateChanged 分支
            case UIGestureRecognizerStateChanged: {
                CGFloat movement = self.jobs_dismissMovementByTranslation([panGestureRecognizer translationInView:self.containerView]);
                self.byInteractiveFrame(self.jobs_interactiveFrameByMovement(movement));
                self.presentationWrappingView.byFrame(self.interactiveFrame);
            } break;
            /// 处理 UIGestureRecognizerStateEnded 分支
            case UIGestureRecognizerStateEnded:
            /// 处理 UIGestureRecognizerStateCancelled 分支
            case UIGestureRecognizerStateCancelled:
            /// 处理 UIGestureRecognizerStateFailed 分支
            case UIGestureRecognizerStateFailed: {
                CGFloat movement = self.jobs_dismissMovementByTranslation([panGestureRecognizer translationInView:self.containerView]);
                CGFloat velocity = self.jobs_dismissMovementByVelocity([panGestureRecognizer velocityInView:self.containerView]);
                CGFloat threshold = self.jobs_axisLengthOfFrame(self.presentationWrappingView.frame) * 0.25f;
                if (movement > threshold || velocity > 600.f) {
                    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
                }else{
                    self.byInteractiveFrame(self.jobs_targetFrameInContainerBounds(self.containerView.bounds));
                    [UIView animateWithDuration:0.28
                                          delay:0
                         usingSpringWithDamping:0.88
                          initialSpringVelocity:fabs(velocity) / 1000.f
                                        options:UIViewAnimationOptionCurveEaseOut
                                     animations:^{
                        self.presentationWrappingView.byFrame(self.interactiveFrame);
                    } completion:^(BOOL finished) {
                        self.byHasInteractiveFrame(NO);
                    }];
                }
            } break;
            /// 未匹配已知分支时执行兜底处理
            default:
                break;
        }
    };
}

#pragma mark —— Frame
-(JobsRetCGRectByCGRectBlock _Nonnull)jobs_targetFrameInContainerBounds{
    @jobs_weakify(self)
    return ^CGRect(CGRect containerViewBounds){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGRect frame = containerViewBounds;
        CGFloat ratio = self.jobs_effectivePresentedRatioInContainerBounds(containerViewBounds);
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                frame.size.height = CGRectGetHeight(containerViewBounds) * ratio;
                frame.origin.y = CGRectGetMinY(containerViewBounds);
                break;
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                frame.size.height = CGRectGetHeight(containerViewBounds) * ratio;
                frame.origin.y = CGRectGetMaxY(containerViewBounds) - CGRectGetHeight(frame);
                break;
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                frame.size.width = CGRectGetWidth(containerViewBounds) * ratio;
                frame.origin.x = CGRectGetMinX(containerViewBounds);
                break;
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                frame.size.width = CGRectGetWidth(containerViewBounds) * ratio;
                frame.origin.x = CGRectGetMaxX(containerViewBounds) - CGRectGetWidth(frame);
                break;
        };return frame;
    };
}

-(CGRect)jobs_offscreenFrameFromFrame:(CGRect)frame
                      inContainerView:(UIView *)containerView{
    CGRect containerBounds = containerView.bounds;
    switch (self.direction) {
        /// 处理 JobsTransitionDirectionTop 分支
        case JobsTransitionDirectionTop:
            frame.origin.y = CGRectGetMinY(containerBounds) - CGRectGetHeight(frame);
            break;
        /// 处理 JobsTransitionDirectionBottom 分支
        case JobsTransitionDirectionBottom:
            frame.origin.y = CGRectGetMaxY(containerBounds);
            break;
        /// 处理 JobsTransitionDirectionLeft 分支
        case JobsTransitionDirectionLeft:
            frame.origin.x = CGRectGetMinX(containerBounds) - CGRectGetWidth(frame);
            break;
        /// 处理 JobsTransitionDirectionRight 分支
        case JobsTransitionDirectionRight:
            frame.origin.x = CGRectGetMaxX(containerBounds);
            break;
    };return frame;
}

-(JobsRetFrameByCGFloatBlock _Nonnull)jobs_interactiveFrameByMovement{
    @jobs_weakify(self)
    return ^CGRect(CGFloat movement){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGFloat offset = MAX(0, movement);
        CGRect frame = self.panStartFrame;
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                frame.origin.y -= offset;
                break;
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                frame.origin.y += offset;
                break;
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                frame.origin.x -= offset;
                break;
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                frame.origin.x += offset;
                break;
        };return frame;
    };
}

#pragma mark —— Helpers
-(JobsRetCGFloatByCGRectBlock _Nonnull)jobs_effectivePresentedRatioInContainerBounds{
    @jobs_weakify(self)
    return ^CGFloat(CGRect containerViewBounds){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGFloat axisLength = self.jobs_axisLengthOfFrame(containerViewBounds);
        CGFloat contentLength = self.jobs_contentLengthForDirectionInContainerBounds(containerViewBounds);
        if (!self.hasCustomPresentedRatio && contentLength > 0 && axisLength > 0) {
            return self.jobs_clampedRatio(contentLength / axisLength);
        };return self.jobs_clampedRatio(self.presentedRatio);
    };
}

-(JobsRetCGFloatByCGRectBlock _Nonnull)jobs_contentLengthForDirectionInContainerBounds{
    @jobs_weakify(self)
    return ^CGFloat(CGRect containerViewBounds){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGSize preferredContentSize = self.presentedViewController.preferredContentSize;
        BOOL vertical = self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom;
        CGFloat length = vertical ? preferredContentSize.height : preferredContentSize.width;
        if (length <= 0 && vertical) length = self.jobs_presentUpHeightFromPresentedViewController();
        CGFloat maxLength = vertical ? CGRectGetHeight(containerViewBounds) : CGRectGetWidth(containerViewBounds);
        return MIN(MAX(0, length), maxLength);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_presentUpHeightFromPresentedViewController{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        SEL selector = NSSelectorFromString(@"presentUpHeight");
        if (![self.presentedViewController respondsToSelector:selector]) return 0;
        @try {
            return [[self.presentedViewController valueForKey:@"presentUpHeight"] doubleValue];
        } @catch (NSException *exception) {
            return 0;
        }
    };
}

-(JobsRetCGFloatByCGFloatBlock _Nonnull)jobs_clampedRatio{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat ratio){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MIN(MAX(0.01f, ratio), 1.f);
    };
}

-(JobsRetCGFloatByCGRectBlock _Nonnull)jobs_axisLengthOfFrame{
    @jobs_weakify(self)
    return ^CGFloat(CGRect frame){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return (self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom) ? CGRectGetHeight(frame) : CGRectGetWidth(frame);
    };
}

-(JobsRetByCGPointBlock _Nonnull)jobs_dismissMovementByTranslation{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint translation){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                return MAX(0, -translation.y);
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                return MAX(0, translation.y);
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                return MAX(0, -translation.x);
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                return MAX(0, translation.x);
        };return 0;
    };
}

-(JobsRetByCGPointBlock _Nonnull)jobs_dismissMovementByVelocity{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint velocity){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                return -velocity.y;
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                return velocity.y;
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                return -velocity.x;
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                return velocity.x;
        };return 0;
    };
}

-(JobsRetBOOLByPointBlock _Nonnull)jobs_isVelocityTowardDismissDirection{
    @jobs_weakify(self)
    return ^BOOL(CGPoint velocity){
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        BOOL vertical = self.direction == JobsTransitionDirectionTop || self.direction == JobsTransitionDirectionBottom;
        if (vertical && fabs(velocity.y) <= fabs(velocity.x)) return NO;
        if (!vertical && fabs(velocity.x) <= fabs(velocity.y)) return NO;
        return self.jobs_dismissMovementByVelocity(velocity) > 0;
    };
}

-(JobsRetUIScrollViewByUIGestureRecognizerBlock _Nonnull)jobs_hitScrollViewByGesture{
    @jobs_weakify(self)
    return ^UIScrollView *(UIGestureRecognizer * gestureRecognizer){
        @jobs_strongify(self)
        if (!self) return nil;
        CGPoint point = [gestureRecognizer locationInView:self.presentationWrappingView];
        UIView *hitView = [self.presentationWrappingView hitTest:point
                                                       withEvent:nil];
        while (hitView) {
            if ([hitView isKindOfClass:UIScrollView.class]) return (UIScrollView *)hitView;
            hitView = hitView.superview;
        };return nil;
    };
}

-(JobsRetCACornerMaskByVoidBlock _Nonnull)jobs_maskedCorners{
    @jobs_weakify(self)
    return ^CACornerMask{
        @jobs_strongify(self)
        if (!self) return (CACornerMask){0};
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                return kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                return kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                return kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                return kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner;
        };return kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
    };
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobs_shadowOffset{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        switch (self.direction) {
            /// 处理 JobsTransitionDirectionTop 分支
            case JobsTransitionDirectionTop:
                return CGSizeMake(0, 6.f);
            /// 处理 JobsTransitionDirectionBottom 分支
            case JobsTransitionDirectionBottom:
                return CGSizeMake(0, -6.f);
            /// 处理 JobsTransitionDirectionLeft 分支
            case JobsTransitionDirectionLeft:
                return CGSizeMake(6.f, 0);
            /// 处理 JobsTransitionDirectionRight 分支
            case JobsTransitionDirectionRight:
                return CGSizeMake(-6.f, 0);
        };return CGSizeZero;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_clearPresentationViews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byPresentationWrappingView(nil);
        self.byPresentationRoundedCornerView(nil);
        self.byPresentedViewControllerWrapperView(nil);
        self.byDimmingView(nil);
        self.byPanGestureRecognizer(nil);
        self.byHasInteractiveFrame(NO);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsPresentTransitionMgr
-(JobsRetJobsPresentTransitionMgrByBOOLBlock _Nonnull)byHasInteractiveFrame{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasInteractiveFrame:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByCGRectBlock _Nonnull)byInteractiveFrame{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setInteractiveFrame:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByCGRectBlock _Nonnull)byPanStartFrame{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setPanStartFrame:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByUIPanGestureRecognizerBlock _Nonnull)byPanGestureRecognizer{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(UIPanGestureRecognizer * _Nullable data){
        @jobs_strongify(self)
        [self setPanGestureRecognizer:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byDimmingView{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setDimmingView:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentationRoundedCornerView{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setPresentationRoundedCornerView:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentationWrappingView{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setPresentationWrappingView:data];
        return self;
    };
}

-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentedViewControllerWrapperView{
    @jobs_weakify(self)
    return ^__kindof JobsPresentTransitionMgr * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setPresentedViewControllerWrapperView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsPresentTransitionMgr
@end
