//
//  JobsDouyinRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsDouyinRefreshView.h"

@interface JobsDouyinRefreshView ()

Prop_strong(readwrite)JobsDouyinRefreshConfig *config;
Prop_assign(readwrite,getter=isAnimating)BOOL animating;
Prop_strong()CAShapeLayer *redDotLayer;
Prop_strong()CAShapeLayer *greenDotLayer;
Prop_assign()BOOL wantsAnimating;
Prop_assign()CFTimeInterval pausedTime;
Prop_assign()CGRect lastAnimationBounds;

-(void)jobs_setupDouyinRefreshView;
-(void)jobs_syncAnimationState;
-(void)jobs_layoutDots;
-(void)jobs_installAnimations;
-(void)jobs_pauseAnimations;
-(void)jobs_resumeAnimations;
-(void)jobs_removeAnimations;
-(CAAnimationGroup *)jobs_animationGroupWithPositions:(NSArray<NSValue *> *)positions
                                              scales:(NSArray<NSNumber *> *)scales
                                           opacities:(NSArray<NSNumber *> *)opacities
                                          zPositions:(NSArray<NSNumber *> *)zPositions;

@end

@implementation JobsDouyinRefreshView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _config = JobsDouyinRefreshConfig.config;
        [self jobs_setupDouyinRefreshView];
    };return self;
}

-(instancetype)initWithConfig:(JobsDouyinRefreshConfig *)config {
    JobsDouyinRefreshConfig *normalizedConfig = [config copy] ?: JobsDouyinRefreshConfig.config;
    if (self = [super initWithFrame:CGRectMake(0,
                                              0,
                                              normalizedConfig.indicatorSize.width,
                                              normalizedConfig.indicatorSize.height)]) {
        _config = normalizedConfig;
        [self jobs_setupDouyinRefreshView];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _config = JobsDouyinRefreshConfig.config;
        [self jobs_setupDouyinRefreshView];
    };return self;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(CGSize)intrinsicContentSize {
    return self.config.indicatorSize;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self jobs_layoutDots];
    if (self.wantsAnimating &&
        self.window &&
        !UIAccessibilityIsReduceMotionEnabled() &&
        !CGRectEqualToRect(self.lastAnimationBounds, self.bounds)) {
        [self jobs_installAnimations];
    }
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    [self jobs_syncAnimationState];
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self jobs_layoutDots];
}

-(instancetype)byConfig:(JobsDouyinRefreshConfig *)config {
    BOOL shouldRestart = self.wantsAnimating;
    [self jobs_removeAnimations];
    self.config = [config copy] ?: JobsDouyinRefreshConfig.config;
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
    if (shouldRestart) {
        [self layoutIfNeeded];
        [self jobs_syncAnimationState];
    };return self;
}

-(instancetype)byStart {
    self.wantsAnimating = YES;
    [self jobs_syncAnimationState];
    return self;
}

-(instancetype)byPause {
    self.wantsAnimating = NO;
    [self jobs_pauseAnimations];
    return self;
}

-(instancetype)byResume {
    self.wantsAnimating = YES;
    [self jobs_syncAnimationState];
    return self;
}

-(instancetype)byStop {
    self.wantsAnimating = NO;
    [self jobs_removeAnimations];
    [self jobs_layoutDots];
    return self;
}

-(void)jobs_setupDouyinRefreshView {
    self.userInteractionEnabled = NO;
    self.isAccessibilityElement = YES;
    self.accessibilityLabel = @"刷新中";
    _redDotLayer = CAShapeLayer.layer;
    _greenDotLayer = CAShapeLayer.layer;
    [self.layer addSublayer:self.redDotLayer];
    [self.layer addSublayer:self.greenDotLayer];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(jobs_environmentDidChange)
                                               name:UIAccessibilityReduceMotionStatusDidChangeNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(jobs_environmentDidChange)
                                               name:UIApplicationDidBecomeActiveNotification
                                             object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(jobs_applicationDidEnterBackground)
                                               name:UIApplicationDidEnterBackgroundNotification
                                             object:nil];
    [self jobs_layoutDots];
}

-(void)jobs_environmentDidChange {
    [self jobs_syncAnimationState];
}

-(void)jobs_applicationDidEnterBackground {
    if (self.wantsAnimating) [self jobs_pauseAnimations];
}

-(void)jobs_syncAnimationState {
    if (!self.wantsAnimating ||
        !self.window ||
        UIApplication.sharedApplication.applicationState != UIApplicationStateActive ||
        UIAccessibilityIsReduceMotionEnabled()) {
        if (UIAccessibilityIsReduceMotionEnabled()) {
            [self jobs_removeAnimations];
            [self jobs_layoutDots];
        } else if (self.isAnimating) {
            [self jobs_pauseAnimations];
        };return;
    }
    [self layoutIfNeeded];
    if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
    if (![self.redDotLayer animationForKey:@"jobs.douyin.refresh"] ||
        ![self.greenDotLayer animationForKey:@"jobs.douyin.refresh"]) {
        [self jobs_installAnimations];
    } else {
        [self jobs_resumeAnimations];
    }
}

-(void)jobs_layoutDots {
    CGFloat diameter = self.config.dotDiameter;
    CGFloat middleY = CGRectGetMidY(self.bounds);
    CGPoint redCenter = CGPointMake(CGRectGetMidX(self.bounds) - self.config.horizontalTravel / 2, middleY);
    CGPoint greenCenter = CGPointMake(CGRectGetMidX(self.bounds) + self.config.horizontalTravel / 2, middleY);
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.redDotLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    self.redDotLayer.position = redCenter;
    self.redDotLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.redDotLayer.bounds].CGPath;
    self.redDotLayer.fillColor = self.config.redColor.CGColor;
    self.redDotLayer.transform = CATransform3DIdentity;
    self.redDotLayer.opacity = 1;
    self.redDotLayer.zPosition = 1;
    self.greenDotLayer.bounds = CGRectMake(0, 0, diameter, diameter);
    self.greenDotLayer.position = greenCenter;
    self.greenDotLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.greenDotLayer.bounds].CGPath;
    self.greenDotLayer.fillColor = self.config.greenColor.CGColor;
    self.greenDotLayer.transform = CATransform3DIdentity;
    self.greenDotLayer.opacity = 1;
    self.greenDotLayer.zPosition = 0;
    [CATransaction commit];
}

-(void)jobs_installAnimations {
    [self jobs_removeAnimations];
    [self jobs_layoutDots];
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat halfTravel = self.config.horizontalTravel / 2;
    NSArray<NSValue *> *redPositions = @[
        [NSValue valueWithCGPoint:CGPointMake(center.x - halfTravel, center.y)],
        [NSValue valueWithCGPoint:CGPointMake(center.x, center.y - self.config.jumpHeight)],
        [NSValue valueWithCGPoint:CGPointMake(center.x + halfTravel, center.y)],
        [NSValue valueWithCGPoint:CGPointMake(center.x, center.y + self.config.jumpHeight * 0.55)],
        [NSValue valueWithCGPoint:CGPointMake(center.x - halfTravel, center.y)]
    ];
    NSArray<NSValue *> *greenPositions = @[
        [NSValue valueWithCGPoint:CGPointMake(center.x + halfTravel, center.y)],
        [NSValue valueWithCGPoint:CGPointMake(center.x, center.y + self.config.jumpHeight * 0.55)],
        [NSValue valueWithCGPoint:CGPointMake(center.x - halfTravel, center.y)],
        [NSValue valueWithCGPoint:CGPointMake(center.x, center.y - self.config.jumpHeight)],
        [NSValue valueWithCGPoint:CGPointMake(center.x + halfTravel, center.y)]
    ];
    CAAnimationGroup *redAnimation = [self jobs_animationGroupWithPositions:redPositions
                                                                     scales:@[@0.84, @1.12, @0.84, @0.72, @0.84]
                                                                  opacities:@[@0.88, @1, @0.88, @0.74, @0.88]
                                                                 zPositions:@[@1, @2, @1, @0, @1]];
    CAAnimationGroup *greenAnimation = [self jobs_animationGroupWithPositions:greenPositions
                                                                       scales:@[@0.84, @0.72, @0.84, @1.12, @0.84]
                                                                    opacities:@[@0.88, @0.74, @0.88, @1, @0.88]
                                                                   zPositions:@[@0, @0, @1, @2, @0]];
    [self.redDotLayer addAnimation:redAnimation forKey:@"jobs.douyin.refresh"];
    [self.greenDotLayer addAnimation:greenAnimation forKey:@"jobs.douyin.refresh"];
    self.lastAnimationBounds = self.bounds;
    self.pausedTime = 0;
    self.animating = YES;
}

-(CAAnimationGroup *)jobs_animationGroupWithPositions:(NSArray<NSValue *> *)positions
                                              scales:(NSArray<NSNumber *> *)scales
                                           opacities:(NSArray<NSNumber *> *)opacities
                                          zPositions:(NSArray<NSNumber *> *)zPositions {
    NSArray<NSNumber *> *keyTimes = @[@0, @0.25, @0.5, @0.75, @1];
    CAMediaTimingFunction *timing = [CAMediaTimingFunction functionWithControlPoints:0.45 :0 :0.2 :1];
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.values = positions;
    positionAnimation.keyTimes = keyTimes;
    positionAnimation.timingFunctions = @[timing, timing, timing, timing];
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = scales;
    scaleAnimation.keyTimes = keyTimes;
    scaleAnimation.timingFunctions = @[timing, timing, timing, timing];
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = opacities;
    opacityAnimation.keyTimes = keyTimes;
    opacityAnimation.timingFunctions = @[timing, timing, timing, timing];
    CAKeyframeAnimation *zPositionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
    zPositionAnimation.values = zPositions;
    zPositionAnimation.keyTimes = keyTimes;
    zPositionAnimation.calculationMode = kCAAnimationDiscrete;
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[positionAnimation, scaleAnimation, opacityAnimation, zPositionAnimation];
    group.duration = self.config.cycleDuration;
    group.repeatCount = HUGE_VALF;
    group.removedOnCompletion = NO;
    return group;
}

-(void)jobs_pauseAnimations {
    if (!self.isAnimating || self.redDotLayer.speed == 0) return;
    self.pausedTime = [self.redDotLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
        dotLayer.speed = 0;
        dotLayer.timeOffset = self.pausedTime;
    }
}

-(void)jobs_resumeAnimations {
    if (!self.isAnimating || self.redDotLayer.speed != 0) return;
    CFTimeInterval pausedTime = self.redDotLayer.timeOffset;
    for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
        dotLayer.speed = 1;
        dotLayer.timeOffset = 0;
        dotLayer.beginTime = 0;
        dotLayer.beginTime = [dotLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    }
    self.pausedTime = 0;
}

-(void)jobs_removeAnimations {
    for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
        [dotLayer removeAllAnimations];
        dotLayer.speed = 1;
        dotLayer.timeOffset = 0;
        dotLayer.beginTime = 0;
    }
    self.pausedTime = 0;
    self.lastAnimationBounds = CGRectNull;
    self.animating = NO;
}

@end
