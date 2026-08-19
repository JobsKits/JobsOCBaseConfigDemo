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

-(jobsByVoidBlock _Nonnull)jobs_setupTodayNewsRefreshView;
-(jobsByVoidBlock _Nonnull)jobs_syncAnimationState;
-(jobsByVoidBlock _Nonnull)jobs_layoutMark;
-(jobsByCGFloatBlock _Nonnull)jobs_applyPullProgress;
-(jobsByVoidBlock _Nonnull)jobs_installAnimations;
-(jobsByVoidBlock _Nonnull)jobs_pauseAnimations;
-(jobsByVoidBlock _Nonnull)jobs_resumeAnimations;
-(jobsByVoidBlock _Nonnull)jobs_removeAnimations;
-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_bowtiePath;
-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_leftPointPath;
-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_rectanglePath;
-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_rightPointPath;
-(JobsRetUIBezierPathByNSArrayNSValueBlock _Nonnull)jobs_pathWithPoints;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsTodayNewsRefreshView
@interface JobsTodayNewsRefreshView (JobsPropertyDSLSetterAutogen_c6b8304e34)
-(void)setAccessibilityLabel:(NSString * _Nullable)data;
-(void)setAnimating:(BOOL)data;
-(void)setIsAccessibilityElement:(BOOL)data;
-(void)setLastAnimationBounds:(CGRect)data;
-(void)setPausedTime:(CFTimeInterval)data;
-(void)setWantsAnimating:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsTodayNewsRefreshView

@implementation JobsTodayNewsRefreshView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _config = JobsTodayNewsRefreshConfig.config();
        self.jobs_setupTodayNewsRefreshView();
    };return self;
}

-(instancetype)initWithConfig:(JobsTodayNewsRefreshConfig *)config {
    JobsTodayNewsRefreshConfig *normalizedConfig = [config copy] ?: JobsTodayNewsRefreshConfig.config();
    if (self = [super initWithFrame:(CGRect){CGPointZero, normalizedConfig.jobsIndicatorSize()}]) {
        _config = normalizedConfig;
        self.jobs_setupTodayNewsRefreshView();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        _config = JobsTodayNewsRefreshConfig.config();
        self.jobs_setupTodayNewsRefreshView();
    };return self;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

-(CGSize)intrinsicContentSize{
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.jobs_layoutMark();
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshView.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(JobsRetIDByJobsTodayNewsRefreshConfigBlock _Nonnull)byConfig{
    @jobs_weakify(self)
    return ^id(JobsTodayNewsRefreshConfig * config){
        @jobs_strongify(self)
        if (!self) return nil;
        BOOL shouldRestart = self.wantsAnimating;
        self.jobs_removeAnimations();
        self.config = [config copy] ?: JobsTodayNewsRefreshConfig.config();
        [self invalidateIntrinsicContentSize];
        [self setNeedsLayout];
        if (shouldRestart) {
            self.wantsAnimating = YES;
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
        self.jobs_layoutMark();
        self.jobs_applyPullProgress(1);
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
            self.byWantsAnimating(NO);
            self.jobs_removeAnimations();
            self.jobs_applyPullProgress(normalizedProgress);
            break;
        /// 处理 JobsRefreshAnimatorPhaseReady 分支
        case JobsRefreshAnimatorPhaseReady:
            self.byHidden(NO);
            self.byWantsAnimating(NO);
            self.jobs_removeAnimations();
            self.jobs_applyPullProgress(1);
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

-(jobsByVoidBlock _Nonnull)jobs_setupTodayNewsRefreshView {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byUserInteractionEnabled(NO);
        self.byAccessibilityElement(YES);
        self.byAccessibilityLabel(@"刷新中");
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
        self.jobs_layoutMark();
        self.jobs_applyPullProgress(0);
    };
}

-(void)jobs_environmentDidChange {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshView.class, @selector(jobsJobs_environmentDidChange)))(self, @selector(jobsJobs_environmentDidChange));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTodayNewsRefreshView.class, @selector(jobsJobs_applicationDidEnterBackground)))(self, @selector(jobsJobs_applicationDidEnterBackground));
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
                self.jobs_applyPullProgress(1);
            } else if (self.isAnimating) {
                self.jobs_pauseAnimations();
            };return;
        }
        [self layoutIfNeeded];
        if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
        if (![self.markLayer animationForKey:@"jobs.todaynews.path"]) {
            self.jobs_installAnimations();
        } else {
            self.jobs_resumeAnimations();
        }
    };
}

-(jobsByVoidBlock _Nonnull)jobs_layoutMark {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGSize indicatorSize = self.config.jobsIndicatorSize();
        CGFloat originX = (CGRectGetWidth(self.bounds) - indicatorSize.width) / 2;
        CGFloat originY = (CGRectGetHeight(self.bounds) - indicatorSize.height) / 2;
        CGFloat inset = self.config.lineWidth;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.contentLayer.byFrame(CGRectMake(originX, originY, indicatorSize.width, indicatorSize.height));
        self.markLayer.frame = CGRectMake(inset,
                                          inset,
                                          indicatorSize.width - inset * 2,
                                          indicatorSize.height - inset * 2);
        self.markLayer.byFillColor(UIColor.clearColor.CGColor);
        self.markLayer.byStrokeColor(self.config.strokeColor.CGColor);
        self.markLayer.byLineWidth(self.config.lineWidth);
        self.markLayer.byLineCap(kCALineCapRound);
        self.markLayer.byLineJoin(kCALineJoinRound);
        self.markLayer.byPath(self.jobs_bowtiePath().CGPath);
        self.markLayer.byOpacity(1);
        [CATransaction commit];
    };
}

-(jobsByCGFloatBlock _Nonnull)jobs_applyPullProgress{
    @jobs_weakify(self)
    return ^(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return;
        CGFloat normalizedProgress = MIN(1, MAX(0, progress));
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.markLayer.byPath(self.jobs_bowtiePath().CGPath);
        self.markLayer.byStrokeStart(0);
        self.markLayer.byStrokeEnd(normalizedProgress);
        self.contentLayer.byTransform(CATransform3DIdentity);
        [CATransaction commit];
        self.byAlpha(0.25 + normalizedProgress * 0.75);
        CGFloat scale = 0.72 + normalizedProgress * 0.28;
        self.byTransform(CGAffineTransformMakeScale(scale, scale));
    };
}

-(jobsByVoidBlock _Nonnull)jobs_installAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_removeAnimations();
        self.jobs_layoutMark();
        self.jobs_applyPullProgress(1);
        UIBezierPath *bowtiePath = self.jobs_bowtiePath();
        UIBezierPath *leftPointPath = self.jobs_leftPointPath();
        UIBezierPath *rectanglePath = self.jobs_rectanglePath();
        UIBezierPath *rightPointPath = self.jobs_rightPointPath();
        CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
        pathAnimation.values = @[(__bridge id)bowtiePath.CGPath,
                                 (__bridge id)leftPointPath.CGPath,
                                 (__bridge id)rectanglePath.CGPath,
                                 (__bridge id)rectanglePath.CGPath,
                                 (__bridge id)rightPointPath.CGPath,
                                 (__bridge id)bowtiePath.CGPath,
                                 (__bridge id)bowtiePath.CGPath];
        pathAnimation.byKeyTimes(@[@0, @0.15, @0.38, @0.46, @0.69, @0.85, @1]);
        CAMediaTimingFunction *linear = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        pathAnimation.byTimingFunctions(@[linear, linear, linear, linear, linear, linear]);
        pathAnimation.byDuration(self.config.cycleDuration);
        pathAnimation.byRepeatCount(HUGE_VALF);
        pathAnimation.byCalculationMode(kCAAnimationLinear);
        pathAnimation.byRemovedOnCompletion(NO);
        pathAnimation.byFillMode(kCAFillModeBoth);
        [self.markLayer addAnimation:pathAnimation forKey:@"jobs.todaynews.path"];
        self.byLastAnimationBounds(self.bounds);
        self.byPausedTime(0);
        self.byAnimating(YES);
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_bowtiePath {
    @jobs_weakify(self)
    return ^UIBezierPath *{
        @jobs_strongify(self)
        if (!self) return nil;
        CGFloat width = CGRectGetWidth(self.markLayer.bounds);
        CGFloat height = CGRectGetHeight(self.markLayer.bounds);
        CGPoint center = CGPointMake(width / 2, height / 2);
        return self.jobs_pathWithPoints(@[[NSValue valueWithCGPoint:CGPointZero],
                                          [NSValue valueWithCGPoint:center],
                                          [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                          [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                          [NSValue valueWithCGPoint:center],
                                          [NSValue valueWithCGPoint:CGPointMake(0, height)]]);
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_leftPointPath {
    @jobs_weakify(self)
    return ^UIBezierPath *{
        @jobs_strongify(self)
        if (!self) return nil;
        CGFloat width = CGRectGetWidth(self.markLayer.bounds);
        CGFloat height = CGRectGetHeight(self.markLayer.bounds);
        CGPoint leftPoint = CGPointMake(0, height / 2);
        return self.jobs_pathWithPoints(@[[NSValue valueWithCGPoint:leftPoint],
                                          [NSValue valueWithCGPoint:leftPoint],
                                          [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                          [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                          [NSValue valueWithCGPoint:leftPoint],
                                          [NSValue valueWithCGPoint:leftPoint]]);
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_rectanglePath {
    @jobs_weakify(self)
    return ^UIBezierPath *{
        @jobs_strongify(self)
        if (!self) return nil;
        CGFloat width = CGRectGetWidth(self.markLayer.bounds);
        CGFloat height = CGRectGetHeight(self.markLayer.bounds);
        CGPoint leftTop = CGPointZero;
        CGPoint leftBottom = CGPointMake(0, height);
        return self.jobs_pathWithPoints(@[[NSValue valueWithCGPoint:leftTop],
                                          [NSValue valueWithCGPoint:leftTop],
                                          [NSValue valueWithCGPoint:CGPointMake(width, 0)],
                                          [NSValue valueWithCGPoint:CGPointMake(width, height)],
                                          [NSValue valueWithCGPoint:leftBottom],
                                          [NSValue valueWithCGPoint:leftBottom]]);
    };
}

-(JobsRetBezierPathByVoidBlock _Nonnull)jobs_rightPointPath {
    @jobs_weakify(self)
    return ^UIBezierPath *{
        @jobs_strongify(self)
        if (!self) return nil;
        CGFloat width = CGRectGetWidth(self.markLayer.bounds);
        CGFloat height = CGRectGetHeight(self.markLayer.bounds);
        CGPoint leftTop = CGPointZero;
        CGPoint leftBottom = CGPointMake(0, height);
        CGPoint rightPoint = CGPointMake(width, height / 2);
        return self.jobs_pathWithPoints(@[[NSValue valueWithCGPoint:leftTop],
                                          [NSValue valueWithCGPoint:leftTop],
                                          [NSValue valueWithCGPoint:rightPoint],
                                          [NSValue valueWithCGPoint:rightPoint],
                                          [NSValue valueWithCGPoint:leftBottom],
                                          [NSValue valueWithCGPoint:leftBottom]]);
    };
}

-(JobsRetUIBezierPathByNSArrayNSValueBlock _Nonnull)jobs_pathWithPoints{
    @jobs_weakify(self)
    return ^UIBezierPath *(NSArray<NSValue *> * points){
        @jobs_strongify(self)
        if (!self) return nil;
        UIBezierPath *path = UIBezierPath.bezierPath;
        if (!points.count) return path;
        [path moveToPoint:points.firstObject.CGPointValue];
        for (NSUInteger index = 1; index < points.count; index++) {
            [path addLineToPoint:points[index].CGPointValue];
        }
        [path closePath];
        return path;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_pauseAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isAnimating || self.markLayer.speed == 0) return;
        self.byPausedTime([self.markLayer convertTime:CACurrentMediaTime() fromLayer:nil]);
        self.markLayer.bySpeed(0);
        self.markLayer.byTimeOffset(self.pausedTime);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_resumeAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isAnimating || self.markLayer.speed != 0) return;
        CFTimeInterval pausedTime = self.markLayer.timeOffset;
        self.markLayer.bySpeed(1);
        self.markLayer.byTimeOffset(0);
        self.markLayer.byBeginTime(0);
        self.markLayer.byBeginTime([self.markLayer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime);
        self.byPausedTime(0);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_removeAnimations {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.contentLayer removeAllAnimations];
        [self.markLayer removeAllAnimations];
        self.markLayer.bySpeed(1);
        self.markLayer.byTimeOffset(0);
        self.markLayer.byBeginTime(0);
        self.byPausedTime(0);
        self.byLastAnimationBounds(CGRectNull);
        self.byAnimating(NO);
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsTodayNewsRefreshView
-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byAnimating{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAnimating:data];
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byWantsAnimating{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWantsAnimating:data];
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshViewByCFTimeIntervalBlock _Nonnull)byPausedTime{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(CFTimeInterval data){
        @jobs_strongify(self)
        [self setPausedTime:data];
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshViewByCGRectBlock _Nonnull)byLastAnimationBounds{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(CGRect data){
        @jobs_strongify(self)
        [self setLastAnimationBounds:data];
        return self;
    };
}
-(JobsRetJobsTodayNewsRefreshViewByBOOLBlock _Nonnull)byAccessibilityElement{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsAccessibilityElement:data];
        return self;
    };
}

-(JobsRetJobsTodayNewsRefreshViewByNSStringBlock _Nonnull)byAccessibilityLabel{
    @jobs_weakify(self)
    return ^__kindof JobsTodayNewsRefreshView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setAccessibilityLabel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsTodayNewsRefreshView
@end
