//
//  JobsSideDrawer.m
//  JobsViewPush
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "JobsSideDrawer.h"

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
        _configuration.presentedRatio = MAX(0.1, MIN(1, configuration.presentedRatio));
        _dimControl = [UIControl new];
        _dimControl.backgroundColor = configuration.dimColor;
        _dimControl.alpha = 0;
        _dimControl.hidden = YES;
        [_dimControl addTarget:self action:@selector(closeFromDim) forControlEvents:UIControlEventTouchUpInside];
        [hostView insertSubview:drawerView belowSubview:contentView];
        [contentView addSubview:_dimControl];
        _openGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(handleOpenGesture:)];
        _closeGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                action:@selector(handleCloseGesture:)];
        _openGesture.delegate = self;
        _closeGesture.delegate = self;
        [hostView addGestureRecognizer:_openGesture];
        [drawerView addGestureRecognizer:_closeGesture];
        [self updateGestureConfiguration];
        [self updateLayout];
    };return self;
}

-(void)updateLayout{
    [self updateLayoutWithProgress:self.interactiveProgress ? self.interactiveProgress.doubleValue : (self.isOpen ? 1 : 0)];
}

-(void)updateLayoutWithProgress:(CGFloat)progress{
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
    self.dimControl.frame = self.contentView.bounds;
    self.dimControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.dimControl.alpha = progress;
    self.contentView.layer.transform = CATransform3DMakeAffineTransform([self contentTransformWithDistance:distance
                                                                                              progress:progress]);
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

-(void)applyConfigurationAnimated:(BOOL)animated{
    self.configuration.presentedRatio = MAX(0.1, MIN(1, self.configuration.presentedRatio));
    self.dimControl.backgroundColor = self.configuration.dimColor;
    [self updateGestureConfiguration];
    [self setOpen:self.isOpen animated:animated];
}

-(void)toggleAnimated:(BOOL)animated{
    [self setOpen:!self.isOpen animated:animated];
}

-(void)openAnimated:(BOOL)animated{
    [self setOpen:YES animated:animated];
}

-(void)closeAnimated:(BOOL)animated{
    [self setOpen:NO animated:animated];
}

-(void)setOpen:(BOOL)open animated:(BOOL)animated{
    self.interactiveProgress = nil;
    self.animatingTransition = animated;
    _open = open;
    if (open) self.dimControl.hidden = NO;
    [self updateGestureAvailability];
    void (^changes)(void) = ^{
        [self updateLayoutWithProgress:open ? 1 : 0];
    };
    void (^completion)(BOOL) = ^(BOOL finished) {
        self.animatingTransition = NO;
        if (!open) self.dimControl.hidden = YES;
        if (!open && self.configuration.contentMode == JobsSideDrawerContentModeFixed) {
            [self.hostView bringSubviewToFront:self.contentView];
        }
        [self updateGestureAvailability];
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

-(void)updateGestureConfiguration{
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
    [self updateGestureAvailability];
}

-(void)updateGestureAvailability{
    BOOL allowsGesture = self.configuration.allowsInteractiveTransition && !self.isAnimatingTransition;
    self.openGesture.enabled = allowsGesture && !self.isOpen;
    self.closeGesture.enabled = allowsGesture && self.isOpen;
}

-(CGFloat)interactiveDistance{
    BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
    CGFloat length = horizontal ? CGRectGetWidth(self.hostView.bounds) : CGRectGetHeight(self.hostView.bounds);
    return MAX(length * self.configuration.presentedRatio, 1);
}

-(CGFloat)openingComponentForPoint:(CGPoint)point{
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
}

-(void)updateInteractiveGesture:(UIPanGestureRecognizer *)gesture
                        opening:(BOOL)opening{
    CGFloat component = [self openingComponentForPoint:[gesture translationInView:self.hostView]];
    CGFloat directionalOffset = MAX(opening ? component : -component, 0);
    CGFloat progress = MIN(directionalOffset / self.interactiveDistance, 1);
    CGFloat targetProgress = opening ? progress : 1 - progress;
    switch (gesture.state) {
        /// 处理 UIGestureRecognizerStateBegan 分支
        case UIGestureRecognizerStateBegan:
            self.dimControl.hidden = NO;
            self.interactiveProgress = @(opening ? 0 : 1);
            [self updateLayoutWithProgress:self.interactiveProgress.doubleValue];
            break;
        /// 处理 UIGestureRecognizerStateChanged 分支
        case UIGestureRecognizerStateChanged:
            self.interactiveProgress = @(targetProgress);
            [self updateLayoutWithProgress:targetProgress];
            break;
        /// 处理 UIGestureRecognizerStateEnded 分支
        case UIGestureRecognizerStateEnded:
        /// 处理 UIGestureRecognizerStateCancelled 分支
        case UIGestureRecognizerStateCancelled:
        /// 处理 UIGestureRecognizerStateFailed 分支
        case UIGestureRecognizerStateFailed: {
            CGFloat openingVelocity = [self openingComponentForPoint:[gesture velocityInView:self.hostView]];
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
    [self updateInteractiveGesture:gesture opening:YES];
}

-(void)handleCloseGesture:(UIPanGestureRecognizer *)gesture{
    [self updateInteractiveGesture:gesture opening:NO];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer != self.closeGesture) return YES;
    CGPoint velocity = [(UIPanGestureRecognizer *)gestureRecognizer velocityInView:self.hostView];
    BOOL horizontal = self.configuration.direction == JobsSideDrawerDirectionLeft || self.configuration.direction == JobsSideDrawerDirectionRight;
    CGFloat openingVelocity = [self openingComponentForPoint:velocity];
    BOOL primaryDirection = horizontal ? fabs(velocity.x) > fabs(velocity.y) : fabs(velocity.y) > fabs(velocity.x);
    return primaryDirection && openingVelocity < 0;
}

-(void)invalidate{
    [self.hostView removeGestureRecognizer:self.openGesture];
    [self.drawerView removeGestureRecognizer:self.closeGesture];
    [self.drawerView removeFromSuperview];
    [self.dimControl removeFromSuperview];
    self.contentView.layer.transform = CATransform3DIdentity;
}

-(void)closeFromDim{
    [self closeAnimated:YES];
}

@end
