//
//  JobsSideDrawer.m
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "JobsSideDrawer.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsSideDrawer
@interface JobsSideDrawer (JobsPropertyDSLSetterAutogen_fb69639d81)
-(void)setInteractiveProgress:(NSNumber * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsSideDrawer

@implementation JobsSideDrawerConfiguration
-(instancetype)init{
    if (self = [super init]) {
        _direction = JobsSideDrawerDirectionLeft;
        _contentMode = JobsSideDrawerContentModeFollowing;
        _presentedRatio = 0.5;
        _animationDuration = 0.28;
        _dimColor = [UIColor.blackColor colorWithAlphaComponent:0.35];
        _allowsInteractiveTransition = YES;
    };return self;
}

-(JobsRetJobsSideDrawerConfigurationByJobsSideDrawerDirectionBlock _Nonnull)byDirection{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(JobsSideDrawerDirection direction) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.direction = direction;
        return self;
    };
}

-(JobsRetJobsSideDrawerConfigurationByJobsSideDrawerContentModeBlock _Nonnull)byContentMode{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(JobsSideDrawerContentMode contentMode) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.contentMode = contentMode;
        return self;
    };
}

-(JobsRetJobsSideDrawerConfigurationByCGFloatBlock _Nonnull)byPresentedRatio{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(CGFloat presentedRatio) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.presentedRatio = presentedRatio;
        return self;
    };
}

-(JobsRetJobsSideDrawerConfigurationByTimeIntervalBlock _Nonnull)byAnimationDuration{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(NSTimeInterval animationDuration) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.animationDuration = animationDuration;
        return self;
    };
}

-(JobsRetJobsSideDrawerConfigurationByCorBlock _Nonnull)byDimColor{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(UIColor *_Nullable dimColor) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.dimColor = dimColor;
        return self;
    };
}

-(JobsRetJobsSideDrawerConfigurationByBOOLBlock _Nonnull)byAllowsInteractiveTransition{
    @jobs_weakify(self)
    return ^JobsSideDrawerConfiguration *(BOOL allowsInteractiveTransition) {
        @jobs_strongify(self)
        if (!self) return nil;
        self.allowsInteractiveTransition = allowsInteractiveTransition;
        return self;
    };
}

@end

@interface JobsSideDrawer () <UIGestureRecognizerDelegate>

Prop_weak()UIView *hostView;
Prop_strong()UIView *drawerView;
Prop_weak()UIView *contentView;
Prop_strong()UIControl *dimControl;
Prop_strong()UIScreenEdgePanGestureRecognizer *openGesture;
Prop_strong()UIPanGestureRecognizer *closeGesture;
Prop_strong(nullable)NSNumber *interactiveProgress;
Prop_assign(getter=isAnimatingTransition)BOOL animatingTransition;
Prop_strong(readwrite)JobsSideDrawerConfiguration *configuration;
Prop_assign(readwrite,getter=isOpen)BOOL open;

@end

@implementation JobsSideDrawer
-(instancetype)initWithHostView:(UIView *)hostView
                     drawerView:(UIView *)drawerView
                    contentView:(UIView *)contentView
                  configuration:(JobsSideDrawerConfiguration *)configuration{
    if (self = [super init]) {
        _hostView = hostView;
        _drawerView = drawerView;
        _contentView = contentView;
        _configuration = configuration;
        _configuration.byPresentedRatio(MAX(0.1, MIN(1, configuration.presentedRatio)));
        _dimControl = [UIControl new];
        _dimControl.byBgColor(configuration.dimColor);
        _dimControl.byAlpha(0);
        _dimControl.byHidden(YES);
        [_dimControl addTarget:self action:@selector(closeFromDim) forControlEvents:UIControlEventTouchUpInside];
        [hostView insertSubview:drawerView belowSubview:contentView];
        [contentView addSubview:_dimControl];
        _openGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(handleOpenGesture:)];
        _closeGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                action:@selector(handleCloseGesture:)];
        _openGesture.byDelegate(self);
        _closeGesture.byDelegate(self);
        [hostView addGestureRecognizer:_openGesture];
        [drawerView addGestureRecognizer:_closeGesture];
        self.updateGestureConfiguration();
        self.updateLayout();
    };return self;
}

-(jobsByVoidBlock _Nonnull)updateLayout{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.updateLayoutWithProgress(self.interactiveProgress ? self.interactiveProgress.doubleValue : (self.isOpen ? 1 : 0));
    };
}

-(jobsByCGFloatBlock _Nonnull)updateLayoutWithProgress{
    @jobs_weakify(self)
    return ^(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return;
        UIView *hostView = self.hostView;
        if (!hostView) return;
        progress = MAX(0, MIN(1, progress));
        CGRect bounds = hostView.bounds;
        BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
        CGFloat distance = (horizontal ? CGRectGetWidth(bounds) : CGRectGetHeight(bounds)) * self.configuration.presentedRatio;
        CGRect shownFrame = bounds;
        if (horizontal) shownFrame.size.width = distance;
        else shownFrame.size.height = distance;
        if (self.configuration.direction == JobsSideDrawerDirectionRight) shownFrame.origin.x = CGRectGetWidth(bounds) - distance;
        if (self.configuration.direction == JobsSideDrawerDirectionBottom) shownFrame.origin.y = CGRectGetHeight(bounds) - distance;
        CGRect hiddenFrame = shownFrame;
        if (self.configuration.direction == JobsSideDrawerDirectionLeft) hiddenFrame.origin.x = -distance;
        if (self.configuration.direction == JobsSideDrawerDirectionRight) hiddenFrame.origin.x = CGRectGetWidth(bounds);
        if (self.configuration.direction == JobsSideDrawerDirectionTop) hiddenFrame.origin.y = -distance;
        if (self.configuration.direction == JobsSideDrawerDirectionBottom) hiddenFrame.origin.y = CGRectGetHeight(bounds);
        self.drawerView.frame = CGRectMake(hiddenFrame.origin.x + (shownFrame.origin.x - hiddenFrame.origin.x) * progress,
                                           hiddenFrame.origin.y + (shownFrame.origin.y - hiddenFrame.origin.y) * progress,
                                           shownFrame.size.width,
                                           shownFrame.size.height);
        if (self.configuration.contentMode == JobsSideDrawerContentModeFixed &&
            (progress > 0 || self.interactiveProgress || self.isAnimatingTransition)) {
            [hostView bringSubviewToFront:self.drawerView];
        }else{
            [hostView bringSubviewToFront:self.contentView];
        }
        self.dimControl.byFrame(self.contentView.bounds);
        self.dimControl.byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.dimControl.byAlpha(progress);
        self.contentView.layer.transform = CATransform3DMakeAffineTransform([self contentTransformWithDistance:distance
                                                                                                  progress:progress]);
    };
}

-(CGAffineTransform)contentTransformWithDistance:(CGFloat)distance
                                        progress:(CGFloat)progress{
    if (progress <= 0 || self.configuration.contentMode == JobsSideDrawerContentModeFixed) return CGAffineTransformIdentity;
    distance *= progress;
    switch (self.configuration.direction) {
        /// 处理 JobsSideDrawerDirectionTop 分支
        case JobsSideDrawerDirectionTop: return CGAffineTransformMakeTranslation(0, distance);
        /// 处理 JobsSideDrawerDirectionBottom 分支
        case JobsSideDrawerDirectionBottom: return CGAffineTransformMakeTranslation(0, -distance);
        /// 处理 JobsSideDrawerDirectionRight 分支
        case JobsSideDrawerDirectionRight: return CGAffineTransformMakeTranslation(-distance, 0);
        /// 处理 JobsSideDrawerDirectionLeft 分支
        case JobsSideDrawerDirectionLeft: return CGAffineTransformMakeTranslation(distance, 0);
    }
}

-(jobsByBOOLBlock _Nonnull)applyConfigurationAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        self.configuration.byPresentedRatio(MAX(0.1, MIN(1, self.configuration.presentedRatio)));
        self.dimControl.byBgColor(self.configuration.dimColor);
        self.updateGestureConfiguration();
        [self setOpen:self.isOpen animated:animated];
    };
}

-(jobsByBOOLBlock _Nonnull)toggleAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self setOpen:!self.isOpen animated:animated];
    };
}

-(jobsByBOOLBlock _Nonnull)openAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self setOpen:YES animated:animated];
    };
}

-(jobsByBOOLBlock _Nonnull)closeAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [self setOpen:NO animated:animated];
    };
}

-(void)setOpen:(BOOL)open animated:(BOOL)animated{
    self.interactiveProgress = nil;
    self.animatingTransition = animated;
    _open = open;
    if (open) self.dimControl.hidden = NO;
    self.updateGestureAvailability();
    void (^changes)(void) = ^{
        self.updateLayoutWithProgress(open ? 1 : 0);
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        self.animatingTransition = NO;
        if (!open) self.dimControl.hidden = YES;
        if (!open && self.configuration.contentMode == JobsSideDrawerContentModeFixed) {
            [self.hostView bringSubviewToFront:self.contentView];
        }
        self.updateGestureAvailability();
        if (self.stateChanged) self.stateChanged(open);
    };
    if (!animated) {
        changes();
        completion(YES);
        return;
    }
    [UIView animateWithDuration:self.configuration.animationDuration
                          delay:0
         usingSpringWithDamping:0.92
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:changes
                     completion:completion];
}

-(jobsByVoidBlock _Nonnull)updateGestureConfiguration{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        switch (self.configuration.direction) {
            /// 处理 JobsSideDrawerDirectionLeft 分支
            case JobsSideDrawerDirectionLeft: self.openGesture.edges = UIRectEdgeLeft; break;
            /// 处理 JobsSideDrawerDirectionRight 分支
            case JobsSideDrawerDirectionRight: self.openGesture.edges = UIRectEdgeRight; break;
            /// 处理 JobsSideDrawerDirectionTop 分支
            case JobsSideDrawerDirectionTop: self.openGesture.edges = UIRectEdgeTop; break;
            /// 处理 JobsSideDrawerDirectionBottom 分支
            case JobsSideDrawerDirectionBottom: self.openGesture.edges = UIRectEdgeBottom; break;
        }
        self.updateGestureAvailability();
    };
}

-(jobsByVoidBlock _Nonnull)updateGestureAvailability{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        BOOL allowsGesture = self.configuration.allowsInteractiveTransition && !self.isAnimatingTransition;
        if (self.openGesture) self.openGesture.byEnabled(allowsGesture && !self.isOpen);
        if (self.closeGesture) self.closeGesture.byEnabled(allowsGesture && self.isOpen);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)interactiveDistance{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
        CGFloat length = horizontal ? CGRectGetWidth(self.hostView.bounds) : CGRectGetHeight(self.hostView.bounds);
        return MAX(length * self.configuration.presentedRatio, 1);
    };
}

-(JobsRetByCGPointBlock _Nonnull)openingComponentForPoint{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint point){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        switch (self.configuration.direction) {
            /// 处理 JobsSideDrawerDirectionLeft 分支
            case JobsSideDrawerDirectionLeft: return point.x;
            /// 处理 JobsSideDrawerDirectionRight 分支
            case JobsSideDrawerDirectionRight: return -point.x;
            /// 处理 JobsSideDrawerDirectionTop 分支
            case JobsSideDrawerDirectionTop: return point.y;
            /// 处理 JobsSideDrawerDirectionBottom 分支
            case JobsSideDrawerDirectionBottom: return -point.y;
        };return 0;
    };
}

-(void)updateInteractiveGesture:(UIPanGestureRecognizer *)gesture
                        opening:(BOOL)opening{
    CGFloat component = self.openingComponentForPoint([gesture translationInView:self.hostView]);
    CGFloat directionalOffset = MAX(opening ? component : -component, 0);
    CGFloat progress = MIN(directionalOffset / self.interactiveDistance(), 1);
    CGFloat targetProgress = opening ? progress : 1 - progress;
    switch (gesture.state) {
        /// 处理 UIGestureRecognizerStateBegan 分支
        case UIGestureRecognizerStateBegan:
            self.dimControl.byHidden(NO);
            self.byInteractiveProgress(@(opening ? 0 : 1));
            self.updateLayoutWithProgress(self.interactiveProgress.doubleValue);
            break;
        /// 处理 UIGestureRecognizerStateChanged 分支
        case UIGestureRecognizerStateChanged:
            self.byInteractiveProgress(@(targetProgress));
            self.updateLayoutWithProgress(targetProgress);
            break;
        /// 处理 UIGestureRecognizerStateEnded 分支
        case UIGestureRecognizerStateEnded:
        /// 处理 UIGestureRecognizerStateCancelled 分支
        case UIGestureRecognizerStateCancelled:
        /// 处理 UIGestureRecognizerStateFailed 分支
        case UIGestureRecognizerStateFailed: {
            CGFloat openingVelocity = self.openingComponentForPoint([gesture velocityInView:self.hostView]);
            CGFloat directionalVelocity = opening ? openingVelocity : -openingVelocity;
            BOOL completed = gesture.state == UIGestureRecognizerStateEnded && (progress >= 0.35 || directionalVelocity >= 500);
            [self setOpen:opening ? completed : !completed animated:YES];
            break;
        }
        /// 未匹配已知分支时执行兜底处理
        default:
            break;
    }
}

-(void)handleOpenGesture:(UIScreenEdgePanGestureRecognizer *)gesture{
    jobsByScreenEdgePanGestureRecognizerBlock action = ((jobsByScreenEdgePanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSideDrawer.class, @selector(jobsHandleOpenGesture)))(self, @selector(jobsHandleOpenGesture));
    if (action) action(gesture);
}

-(jobsByScreenEdgePanGestureRecognizerBlock _Nonnull)jobsHandleOpenGesture{
    @jobs_weakify(self)
    return ^(UIScreenEdgePanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        [self updateInteractiveGesture:gesture opening:YES];
    };
}

-(void)handleCloseGesture:(UIPanGestureRecognizer *)gesture{
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSideDrawer.class, @selector(jobsHandleCloseGesture)))(self, @selector(jobsHandleCloseGesture));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsHandleCloseGesture{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        [self updateInteractiveGesture:gesture opening:NO];
    };
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    JobsRetBOOLByUIGestureRecognizerBlock action = ((JobsRetBOOLByUIGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSideDrawer.class, @selector(jobsGestureRecognizerShouldBegin)))(self, @selector(jobsGestureRecognizerShouldBegin));
    return action ? action(gestureRecognizer) : NO;
}

-(JobsRetBOOLByUIGestureRecognizerBlock _Nonnull)jobsGestureRecognizerShouldBegin{
    @jobs_weakify(self)
    return ^BOOL(UIGestureRecognizer * gestureRecognizer){
        @jobs_strongify(self)
        if (!self) return NO;
        if (gestureRecognizer != self.closeGesture) return YES;
        CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.hostView];
        BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
        CGFloat openingVelocity = self.openingComponentForPoint(velocity);
        BOOL primaryDirection = horizontal ? fabs(velocity.x) > fabs(velocity.y) : fabs(velocity.y) > fabs(velocity.x);
        return primaryDirection && openingVelocity < 0;
    };
}

-(jobsByVoidBlock _Nonnull)invalidate{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.hostView removeGestureRecognizer:self.openGesture];
        [self.drawerView removeGestureRecognizer:self.closeGesture];
        [self.drawerView removeFromSuperview];
        [self.dimControl removeFromSuperview];
        self.contentView.layer.byTransform(CATransform3DIdentity);
    };
}

-(void)closeFromDim{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSideDrawer.class, @selector(jobsCloseFromDim)))(self, @selector(jobsCloseFromDim));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsCloseFromDim{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.closeAnimated(YES);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsSideDrawer
-(JobsRetJobsSideDrawerByNSNumberBlock _Nonnull)byInteractiveProgress{
    @jobs_weakify(self)
    return ^__kindof JobsSideDrawer * _Nullable(NSNumber * _Nullable data){
        @jobs_strongify(self)
        [self setInteractiveProgress:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsSideDrawer
@end
