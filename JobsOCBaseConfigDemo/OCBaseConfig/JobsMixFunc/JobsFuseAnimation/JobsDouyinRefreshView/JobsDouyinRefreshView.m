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

-(jobsByVoidBlock _Nonnull)jobs_setupDouyinRefreshView;
-(jobsByVoidBlock _Nonnull)jobs_syncAnimationState;
-(jobsByVoidBlock _Nonnull)jobs_layoutDots;
-(jobsByVoidBlock _Nonnull)jobs_installAnimations;
-(jobsByVoidBlock _Nonnull)jobs_pauseAnimations;
-(jobsByVoidBlock _Nonnull)jobs_resumeAnimations;
-(jobsByVoidBlock _Nonnull)jobs_removeAnimations;
-(CAAnimationGroup *)jobs_animationGroupWithPositions:(NSArray<NSValue *> *)positions
                                              scales:(NSArray<NSNumber *> *)scales
                                           opacities:(NSArray<NSNumber *> *)opacities
                                          zPositions:(NSArray<NSNumber *> *)zPositions;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsDouyinRefreshView
@interface JobsDouyinRefreshView (JobsPropertyDSLSetterAutogen_9775a6b8a0)
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
-(void)setAnimating:(BOOL)data;
-(void)setIsAccessibilityElement:(BOOL)data;
-(void)setLastAnimationBounds:(CGRect)data;
-(void)setPausedTime:(CFTimeInterval)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsDouyinRefreshView

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN CAAnimationGroup
@interface CAAnimationGroup (JobsLocalPropertyDSLAutogen_9775a6b8a0)
-(JobsRetCAAnimationGroupByNSArrayCAAnimationBlock _Nonnull)byAnimations;
-(void)setAnimations:(NSArray<CAAnimation *> * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END CAAnimationGroup

@implementation JobsDouyinRefreshView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _config = JobsDouyinRefreshConfig.config();
        self.jobs_setupDouyinRefreshView();
    };return self;
}

-(instancetype)initWithConfig:(JobsDouyinRefreshConfig *)config {
    JobsDouyinRefreshConfig *normalizedConfig = [config copy] ?: JobsDouyinRefreshConfig.config();
    if (self = [super initWithFrame:CGRectMake(0,
                                              0,
                                              normalizedConfig.jobsIndicatorSize().width,
                                              normalizedConfig.jobsIndicatorSize().height)]) {
        _config = normalizedConfig;
        self.jobs_setupDouyinRefreshView();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _config = JobsDouyinRefreshConfig.config();
        self.jobs_setupDouyinRefreshView();
    };return self;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(CGSize)intrinsicContentSize{
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize {
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.config.jobsIndicatorSize();
    };
}

-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.jobs_layoutDots();
        if (self.wantsAnimating &&
            self.window &&
            !UIAccessibilityIsReduceMotionEnabled() &&
            !CGRectEqualToRect(self.lastAnimationBounds, self.bounds)) {
            self.jobs_installAnimations();
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobsDidMoveToWindow {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didMoveToWindow];
        self.jobs_syncAnimationState();
    };
}

-(void)didMoveToWindow{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        self.jobs_layoutDots();
    };
}

-(JobsRetIDByJobsDouyinRefreshConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^id(JobsDouyinRefreshConfig * config){
        @jobs_strongify(self)
        if (!self) return nil;
        BOOL shouldRestart = self.wantsAnimating;
        self.jobs_removeAnimations();
        self.config = [config copy] ?: JobsDouyinRefreshConfig.config();
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        if (shouldRestart) {
            [self layoutIfNeeded];
            self.jobs_syncAnimationState();
        };return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStart {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.jobs_syncAnimationState();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byPause {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.jobs_pauseAnimations();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byResume {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.jobs_syncAnimationState();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStop {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.jobs_removeAnimations();
        self.jobs_layoutDots();
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
        return self.config.jobsIndicatorSize();
    };
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalizedProgress = MIN(1, MAX(0, progress));
    switch (phase) {
        /// 处理 JobsRefreshAnimatorPhasePulling 分支
        case JobsRefreshAnimatorPhasePulling:
            self.byHidden(NO);
            self.byStop();
            self.byAlpha(0.35 + normalizedProgress * 0.65);
            self.transform = CGAffineTransformMakeScale(0.72 + normalizedProgress * 0.28,
                                                        0.72 + normalizedProgress * 0.28);
            break;
        /// 处理 JobsRefreshAnimatorPhaseReady 分支
        case JobsRefreshAnimatorPhaseReady:
            self.byHidden(NO);
            self.byStop();
            self.byAlpha(1);
            self.byTransform(CGAffineTransformIdentity);
            break;
        /// 处理 JobsRefreshAnimatorPhaseRefreshing 分支
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byHidden(NO);
            self.byAlpha(1);
            self.byTransform(CGAffineTransformIdentity);
            self.byStart();
            break;
        /// 处理 JobsRefreshAnimatorPhaseEnding 分支
        case JobsRefreshAnimatorPhaseEnding:
            self.byHidden(NO);
            self.byStop();
            break;
        /// 处理 JobsRefreshAnimatorPhaseIdle 分支
        case JobsRefreshAnimatorPhaseIdle:
        /// 处理 JobsRefreshAnimatorPhaseInactive 分支
        case JobsRefreshAnimatorPhaseInactive:
            self.byStop();
            self.byAlpha(0);
            self.byHidden(YES);
            break;
    }
}

-(jobsByVoidBlock _Nonnull)jobs_setupDouyinRefreshView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byUserInteractionEnabled(NO);
        self.byAccessibilityElement(YES);
        self.byAccessibilityLabel(@"刷新中");
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
        self.jobs_layoutDots();
    };
}

-(void)jobs_environmentDidChange {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsJobs_environmentDidChange)))(self, @selector(jobsJobs_environmentDidChange));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsJobs_environmentDidChange{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_syncAnimationState();
    };
}

-(void)jobs_applicationDidEnterBackground {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsDouyinRefreshView.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsJobs_applicationDidEnterBackground{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.wantsAnimating) self.jobs_pauseAnimations();
    };
}

-(jobsByVoidBlock _Nonnull)jobs_syncAnimationState {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.wantsAnimating ||
            !self.window ||
            UIApplication.sharedApplication.applicationState != UIApplicationStateActive ||
            UIAccessibilityIsReduceMotionEnabled()) {
            if (UIAccessibilityIsReduceMotionEnabled()) {
                self.jobs_removeAnimations();
                self.jobs_layoutDots();
            } else if (self.isAnimating) {
                self.jobs_pauseAnimations();
            };return;
        }
        [self layoutIfNeeded];
        if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
        if (![self.redDotLayer animationForKey:@"jobs.douyin.refresh"] ||
            ![self.greenDotLayer animationForKey:@"jobs.douyin.refresh"]) {
            self.jobs_installAnimations();
        } else {
            self.jobs_resumeAnimations();
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutDots {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat diameter = self.config.dotDiameter;
        CGFloat middleY = CGRectGetMidY(self.bounds);
        CGPoint redCenter = CGPointMake(CGRectGetMidX(self.bounds) - self.config.horizontalTravel / 2, middleY);
        CGPoint greenCenter = CGPointMake(CGRectGetMidX(self.bounds) + self.config.horizontalTravel / 2, middleY);
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.redDotLayer.byBounds(CGRectMake(0, 0, diameter, diameter));
        self.redDotLayer.byPosition(redCenter);
        self.redDotLayer.byPath([UIBezierPath bezierPathWithOvalInRect:self.redDotLayer.bounds].CGPath);
        self.redDotLayer.byFillColor(self.config.redColor.CGColor);
        self.redDotLayer.byTransform(CATransform3DIdentity);
        self.redDotLayer.byOpacity(1);
        self.redDotLayer.byZPosition(1);
        self.greenDotLayer.byBounds(CGRectMake(0, 0, diameter, diameter));
        self.greenDotLayer.byPosition(greenCenter);
        self.greenDotLayer.byPath([UIBezierPath bezierPathWithOvalInRect:self.greenDotLayer.bounds].CGPath);
        self.greenDotLayer.byFillColor(self.config.greenColor.CGColor);
        self.greenDotLayer.byTransform(CATransform3DIdentity);
        self.greenDotLayer.byOpacity(1);
        self.greenDotLayer.byZPosition(0);
        [CATransaction commit];
    };
}

-(jobsByVoidBlock _Nonnull)jobs_installAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_removeAnimations();
        self.jobs_layoutDots();
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
        self.byLastAnimationBounds(self.bounds);
        self.byPausedTime(0);
        self.byAnimating(YES);
    };
}

-(CAAnimationGroup *)jobs_animationGroupWithPositions:(NSArray<NSValue *> *)positions
                                              scales:(NSArray<NSNumber *> *)scales
                                           opacities:(NSArray<NSNumber *> *)opacities
                                          zPositions:(NSArray<NSNumber *> *)zPositions {
    NSArray<NSNumber *> *keyTimes = @[@0, @0.25, @0.5, @0.75, @1];
    CAMediaTimingFunction *timing = [CAMediaTimingFunction functionWithControlPoints:0.45 :0 :0.2 :1];
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.byValues(positions);
    positionAnimation.byKeyTimes(keyTimes);
    positionAnimation.byTimingFunctions(@[timing, timing, timing, timing]);
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.byValues(scales);
    scaleAnimation.byKeyTimes(keyTimes);
    scaleAnimation.byTimingFunctions(@[timing, timing, timing, timing]);
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.byValues(opacities);
    opacityAnimation.byKeyTimes(keyTimes);
    opacityAnimation.byTimingFunctions(@[timing, timing, timing, timing]);
    CAKeyframeAnimation *zPositionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
    zPositionAnimation.byValues(zPositions);
    zPositionAnimation.byKeyTimes(keyTimes);
    zPositionAnimation.byCalculationMode(kCAAnimationDiscrete);
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.byAnimations(@[positionAnimation, scaleAnimation, opacityAnimation, zPositionAnimation]);
    group.byDuration(self.config.cycleDuration);
    group.byRepeatCount(HUGE_VALF);
    group.byRemovedOnCompletion(NO);
    return group;
}

-(jobsByVoidBlock _Nonnull)jobs_pauseAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isAnimating || self.redDotLayer.speed == 0) return;
        self.byPausedTime([self.redDotLayer convertTime:CACurrentMediaTime() fromLayer:nil]);
        for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
            dotLayer.bySpeed(0);
            dotLayer.byTimeOffset(self.pausedTime);
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_resumeAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isAnimating || self.redDotLayer.speed != 0) return;
        CFTimeInterval pausedTime = self.redDotLayer.timeOffset;
        for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
            dotLayer.bySpeed(1);
            dotLayer.byTimeOffset(0);
            dotLayer.byBeginTime(0);
            dotLayer.byBeginTime([dotLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime);
        }
        self.byPausedTime(0);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_removeAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (CALayer *dotLayer in @[self.redDotLayer, self.greenDotLayer]) {
            [dotLayer removeAllAnimations];
            dotLayer.bySpeed(1);
            dotLayer.byTimeOffset(0);
            dotLayer.byBeginTime(0);
        }
        self.byPausedTime(0);
        self.byLastAnimationBounds(CGRectNull);
        self.byAnimating(NO);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsDouyinRefreshView
-(JobsRetJobsDouyinRefreshViewByBOOLBlock _Nonnull)byAnimating{
    @jobs_weakify(self)
    return ^__kindof JobsDouyinRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAnimating:data];
        return self;
    };
}

-(JobsRetJobsDouyinRefreshViewByCFTimeIntervalBlock _Nonnull)byPausedTime{
    @jobs_weakify(self)
    return ^__kindof JobsDouyinRefreshView * _Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setPausedTime:data];
        return self;
    };
}

-(JobsRetJobsDouyinRefreshViewByCGRectBlock _Nonnull)byLastAnimationBounds{
    @jobs_weakify(self)
    return ^__kindof JobsDouyinRefreshView * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setLastAnimationBounds:data];
        return self;
    };
}
-(JobsRetJobsDouyinRefreshViewByBOOLBlock _Nonnull)byAccessibilityElement{
    @jobs_weakify(self)
    return ^__kindof JobsDouyinRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsAccessibilityElement:data];
        return self;
    };
}

-(JobsRetJobsDouyinRefreshViewByNSStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof JobsDouyinRefreshView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsDouyinRefreshView
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN CAAnimationGroup
@implementation CAAnimationGroup (JobsLocalPropertyDSLAutogen_9775a6b8a0)
-(JobsRetCAAnimationGroupByNSArrayCAAnimationBlock _Nonnull)byAnimations{
    @jobs_weakify(self)
    return ^__kindof CAAnimationGroup * _Nullable(NSArray<CAAnimation *> * _Nullable data){
        @jobs_strongify(self)
        [self setAnimations:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END CAAnimationGroup
