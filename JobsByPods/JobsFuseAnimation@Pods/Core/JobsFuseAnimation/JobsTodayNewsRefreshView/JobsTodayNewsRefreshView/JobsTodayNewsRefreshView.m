//
//  JobsTodayNewsRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsTodayNewsRefreshView.h"

@interface JobsTodayNewsRefreshView ()

Prop_strong(readwrite)JobsTodayNewsRefreshConfig *config;
Prop_assign(readwrite,getter=isAnimating)BOOL animating;
Prop_strong()CALayer *contentLayer;
Prop_strong()CAShapeLayer *markLayer;
Prop_assign()BOOL wantsAnimating;
Prop_assign()CFTimeInterval pausedTime;
Prop_assign()CGRect lastAnimationBounds;

-(void)jobs_setupTodayNewsRefreshView;
-(void)jobs_syncAnimationState;
-(void)jobs_layoutMark;
-(void)jobs_applyPullProgress:(CGFloat)progress;
-(void)jobs_installAnimations;
-(void)jobs_pauseAnimations;
-(void)jobs_resumeAnimations;
-(void)jobs_removeAnimations;
-(UIBezierPath *)jobs_bowtiePath;
-(UIBezierPath *)jobs_leftPointPath;
-(UIBezierPath *)jobs_rectanglePath;
-(UIBezierPath *)jobs_rightPointPath;
-(UIBezierPath *)jobs_pathWithPoints:(NSArray<NSValue *> *)points;

@end

@implementation JobsTodayNewsRefreshView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _config = JobsTodayNewsRefreshConfig.config;
        [self jobs_setupTodayNewsRefreshView];
    };return self;
}

-(instancetype)initWithConfig:(JobsTodayNewsRefreshConfig *)config {
    JobsTodayNewsRefreshConfig *normalizedConfig = [config copy] ?: JobsTodayNewsRefreshConfig.config;
    if (self = [super initWithFrame:(CGRect){CGPointZero, normalizedConfig.indicatorSize}]) {
        _config = normalizedConfig;
        [self jobs_setupTodayNewsRefreshView];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _config = JobsTodayNewsRefreshConfig.config;
        [self jobs_setupTodayNewsRefreshView];
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
    [self jobs_layoutMark];
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

-(instancetype)byConfig:(JobsTodayNewsRefreshConfig *)config {
    BOOL shouldRestart = self.wantsAnimating;
    [self jobs_removeAnimations];
    self.config = [config copy] ?: JobsTodayNewsRefreshConfig.config;
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
    if (shouldRestart) {
        self.wantsAnimating = YES;
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
    [self jobs_layoutMark];
    [self jobs_applyPullProgress:1];
    return self;
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(UIView *)refreshAnimatorView {
    return self;
}

-(CGSize)refreshAnimatorPreferredSize {
    return self.config.indicatorSize;
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalizedProgress = MIN(1, MAX(0, progress));
    switch (phase) {
        case JobsRefreshAnimatorPhasePulling:
            self.hidden = NO;
            self.wantsAnimating = NO;
            [self jobs_removeAnimations];
            [self jobs_applyPullProgress:normalizedProgress];
            break;
        case JobsRefreshAnimatorPhaseReady:
            self.hidden = NO;
            self.wantsAnimating = NO;
            [self jobs_removeAnimations];
            [self jobs_applyPullProgress:1];
            break;
        case JobsRefreshAnimatorPhaseRefreshing:
            self.hidden = NO;
            self.alpha = 1;
            self.transform = CGAffineTransformIdentity;
            [self byStart];
            break;
        case JobsRefreshAnimatorPhaseEnding:
            self.hidden = NO;
            [self byStop];
            break;
        case JobsRefreshAnimatorPhaseIdle:
        case JobsRefreshAnimatorPhaseInactive:
            [self byStop];
            self.alpha = 0;
            self.hidden = YES;
            break;
    }
}

-(void)jobs_setupTodayNewsRefreshView {
    self.userInteractionEnabled = NO;
    self.isAccessibilityElement = YES;
    self.accessibilityLabel = @"刷新中";
    _contentLayer = CALayer.layer;
    _markLayer = CAShapeLayer.layer;
    [self.layer addSublayer:self.contentLayer];
    [self.contentLayer addSublayer:self.markLayer];
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
    [self jobs_layoutMark];
    [self jobs_applyPullProgress:0];
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
            [self jobs_applyPullProgress:1];
        } else if (self.isAnimating) {
            [self jobs_pauseAnimations];
        };return;
    }
    [self layoutIfNeeded];
    if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
    if (![self.markLayer animationForKey:@"jobs.todaynews.path"]) {
        [self jobs_installAnimations];
    } else {
        [self jobs_resumeAnimations];
    }
}

-(void)jobs_layoutMark {
    CGSize indicatorSize = self.config.indicatorSize;
    CGFloat originX = (CGRectGetWidth(self.bounds) - indicatorSize.width) / 2;
    CGFloat originY = (CGRectGetHeight(self.bounds) - indicatorSize.height) / 2;
    CGFloat inset = self.config.lineWidth;
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.contentLayer.frame = CGRectMake(originX, originY, indicatorSize.width, indicatorSize.height);
    self.markLayer.frame = CGRectMake(inset,
                                      inset,
                                      indicatorSize.width - inset * 2,
                                      indicatorSize.height - inset * 2);
    self.markLayer.fillColor = UIColor.clearColor.CGColor;
    self.markLayer.strokeColor = self.config.strokeColor.CGColor;
    self.markLayer.lineWidth = self.config.lineWidth;
    self.markLayer.lineCap = kCALineCapRound;
    self.markLayer.lineJoin = kCALineJoinRound;
    self.markLayer.path = self.jobs_bowtiePath.CGPath;
    self.markLayer.opacity = 1;
    [CATransaction commit];
}

-(void)jobs_applyPullProgress:(CGFloat)progress {
    CGFloat normalizedProgress = MIN(1, MAX(0, progress));
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.markLayer.path = self.jobs_bowtiePath.CGPath;
    self.markLayer.strokeStart = 0;
    self.markLayer.strokeEnd = normalizedProgress;
    self.contentLayer.transform = CATransform3DIdentity;
    [CATransaction commit];
    self.alpha = 0.25 + normalizedProgress * 0.75;
    CGFloat scale = 0.72 + normalizedProgress * 0.28;
    self.transform = CGAffineTransformMakeScale(scale, scale);
}

-(void)jobs_installAnimations {
    [self jobs_removeAnimations];
    [self jobs_layoutMark];
    [self jobs_applyPullProgress:1];
    UIBezierPath *bowtiePath = self.jobs_bowtiePath;
    UIBezierPath *leftPointPath = self.jobs_leftPointPath;
    UIBezierPath *rectanglePath = self.jobs_rectanglePath;
    UIBezierPath *rightPointPath = self.jobs_rightPointPath;
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    pathAnimation.values = @[(__bridge id)bowtiePath.CGPath,
                             (__bridge id)leftPointPath.CGPath,
                             (__bridge id)rectanglePath.CGPath,
                             (__bridge id)rectanglePath.CGPath,
                             (__bridge id)rightPointPath.CGPath,
                             (__bridge id)bowtiePath.CGPath,
                             (__bridge id)bowtiePath.CGPath];
    pathAnimation.keyTimes = @[@0, @0.15, @0.38, @0.46, @0.69, @0.85, @1];
    CAMediaTimingFunction *linear = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.timingFunctions = @[linear, linear, linear, linear, linear, linear];
    pathAnimation.duration = self.config.cycleDuration;
    pathAnimation.repeatCount = HUGE_VALF;
    pathAnimation.calculationMode = kCAAnimationLinear;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.fillMode = kCAFillModeBoth;
    [self.markLayer addAnimation:pathAnimation forKey:@"jobs.todaynews.path"];
    self.lastAnimationBounds = self.bounds;
    self.pausedTime = 0;
    self.animating = YES;
}

-(UIBezierPath *)jobs_bowtiePath {
    CGFloat width = CGRectGetWidth(self.markLayer.bounds);
    CGFloat height = CGRectGetHeight(self.markLayer.bounds);
    CGPoint center = CGPointMake(width / 2, height / 2);
    return [self jobs_pathWithPoints:@[[NSValue valueWithCGPoint:CGPointZero],
                                      [NSValue valueWithCGPoint:center],
                                      [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                      [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                      [NSValue valueWithCGPoint:center],
                                      [NSValue valueWithCGPoint:CGPointMake(0, height)]]];
}

-(UIBezierPath *)jobs_leftPointPath {
    CGFloat width = CGRectGetWidth(self.markLayer.bounds);
    CGFloat height = CGRectGetHeight(self.markLayer.bounds);
    CGPoint leftPoint = CGPointMake(0, height / 2);
    return [self jobs_pathWithPoints:@[[NSValue valueWithCGPoint:leftPoint],
                                      [NSValue valueWithCGPoint:leftPoint],
                                      [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                      [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                      [NSValue valueWithCGPoint:leftPoint],
                                      [NSValue valueWithCGPoint:leftPoint]]];
}

-(UIBezierPath *)jobs_rectanglePath {
    CGFloat width = CGRectGetWidth(self.markLayer.bounds);
    CGFloat height = CGRectGetHeight(self.markLayer.bounds);
    CGPoint leftTop = CGPointZero;
    CGPoint leftBottom = CGPointMake(0, height);
    return [self jobs_pathWithPoints:@[[NSValue valueWithCGPoint:leftTop],
                                      [NSValue valueWithCGPoint:leftTop],
                                      [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                      [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                      [NSValue valueWithCGPoint:leftBottom],
                                      [NSValue valueWithCGPoint:leftBottom]]];
}

-(UIBezierPath *)jobs_rightPointPath {
    CGFloat width = CGRectGetWidth(self.markLayer.bounds);
    CGFloat height = CGRectGetHeight(self.markLayer.bounds);
    CGPoint leftTop = CGPointZero;
    CGPoint leftBottom = CGPointMake(0, height);
    CGPoint rightPoint = CGPointMake(width, height / 2);
    return [self jobs_pathWithPoints:@[[NSValue valueWithCGPoint:leftTop],
                                      [NSValue valueWithCGPoint:leftTop],
                                      [NSValue valueWithCGPoint:rightPoint],
                                      [NSValue valueWithCGPoint:rightPoint],
                                      [NSValue valueWithCGPoint:leftBottom],
                                      [NSValue valueWithCGPoint:leftBottom]]];
}

-(UIBezierPath *)jobs_pathWithPoints:(NSArray<NSValue *> *)points {
    UIBezierPath *path = UIBezierPath.bezierPath;
    if (!points.count) return path;
    [path moveToPoint:points.firstObject.CGPointValue];
    for (NSUInteger index = 1; index < points.count; index++) {
        [path addLineToPoint:points[index].CGPointValue];
    }
    [path closePath];
    return path;
}

-(void)jobs_pauseAnimations {
    if (!self.isAnimating || self.markLayer.speed == 0) return;
    self.pausedTime = [self.markLayer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.markLayer.speed = 0;
    self.markLayer.timeOffset = self.pausedTime;
}

-(void)jobs_resumeAnimations {
    if (!self.isAnimating || self.markLayer.speed != 0) return;
    CFTimeInterval pausedTime = self.markLayer.timeOffset;
    self.markLayer.speed = 1;
    self.markLayer.timeOffset = 0;
    self.markLayer.beginTime = 0;
    self.markLayer.beginTime = [self.markLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.pausedTime = 0;
}

-(void)jobs_removeAnimations {
    [self.contentLayer removeAllAnimations];
    [self.markLayer removeAllAnimations];
    self.markLayer.speed = 1;
    self.markLayer.timeOffset = 0;
    self.markLayer.beginTime = 0;
    self.pausedTime = 0;
    self.lastAnimationBounds = CGRectNull;
    self.animating = NO;
}

@end
