//
//  JobsClockIconView.m
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import "JobsClockIconView.h"

NSTimeInterval const JobsClockIconViewDefaultInterval = 0.1;

@interface JobsClockIconView ()

Prop_strong()CAShapeLayer *dialLayer;
Prop_strong()CAShapeLayer *hourHandLayer;
Prop_strong()CAShapeLayer *minuteHandLayer;
Prop_strong()CAShapeLayer *centerDotLayer;
Prop_strong()UIView *minuteHandContainerView;
Prop_strong()JobsImageRotator *rotator;
Prop_assign(readwrite,getter=isRunning)BOOL running;
Prop_assign()BOOL hasStarted;

-(jobsByVoidBlock _Nonnull)jobsCommonInit;
-(jobsByVoidBlock _Nonnull)applyTintColor;
-(jobsByVoidBlock _Nonnull)layoutIcon;
-(JobsRetIDByIDBlock _Nonnull)byBackgroundColor;
-(JobsRetIDByBOOLBlock _Nonnull)byUserInteractionEnabled;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsClockIconView
@interface JobsClockIconView (JobsPropertyDSLSetterAutogen_7e78f10802)
-(void)setCenterDotLayer:(CAShapeLayer * _Nullable)data;
-(void)setDialLayer:(CAShapeLayer * _Nullable)data;
-(void)setHasStarted:(BOOL)data;
-(void)setHourHandLayer:(CAShapeLayer * _Nullable)data;
-(void)setInterval:(NSTimeInterval)data;
-(void)setMinuteHandContainerView:(UIView * _Nullable)data;
-(void)setMinuteHandLayer:(CAShapeLayer * _Nullable)data;
-(void)setRunning:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsClockIconView

@implementation JobsClockIconView

-(JobsRetIDByIDBlock _Nonnull)byBackgroundColor{
    @jobs_weakify(self)
    return ^id(UIColor *color){
        @jobs_strongify(self)
        self.backgroundColor = color;
        return self;
    };
}

-(JobsRetIDByBOOLBlock _Nonnull)byUserInteractionEnabled{
    @jobs_weakify(self)
    return ^id(BOOL enabled){
        @jobs_strongify(self)
        self.userInteractionEnabled = enabled;
        return self;
    };
}

-(void)dealloc{
    if (_rotator) _rotator.jobsStop();
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _direction = JobsImageRotationDirectionClockwise;
        _interval = JobsClockIconViewDefaultInterval;
        self.jobsCommonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        _direction = JobsImageRotationDirectionClockwise;
        _interval = JobsClockIconViewDefaultInterval;
        self.jobsCommonInit();
    };return self;
}

-(instancetype)initWithDirection:(JobsImageRotationDirection)direction
                        interval:(NSTimeInterval)interval{
    if (self = [super initWithFrame:CGRectZero]) {
        _direction = direction;
        _interval = interval;
        self.jobsCommonInit();
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockIconView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.minuteHandContainerView.bounds = (CGRect){
            .origin = CGPointZero,
            .size = self.bounds.size
        };
        self.minuteHandContainerView.center = CGPointMake(CGRectGetMidX(self.bounds),
                                                           CGRectGetMidY(self.bounds));
        self.layoutIcon();
    };
}

-(void)tintColorDidChange{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockIconView.class, @selector(jobsTintColorDidChange)))(self, @selector(jobsTintColorDidChange));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsTintColorDidChange{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super tintColorDidChange];
        self.applyTintColor();
    };
}

-(void)setDirection:(JobsImageRotationDirection)direction{
    _direction = direction;
    self.rotator.byDirection(direction);
}

-(void)setInterval:(NSTimeInterval)interval{
    _interval = interval;
    self.rotator.interval = interval;
    _interval = self.rotator.interval;
}

-(JobsRetIDByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.isRunning) return self;
        self.rotator.start();
        self.byHasStarted(YES);
        self.byRunning(YES);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.hasStarted || !self.isRunning) return self;
        if (self.rotator) self.rotator.pause();
        self.byRunning(NO);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!self.hasStarted || self.isRunning) return self;
        if (self.rotator) self.rotator.resume();
        self.byRunning(YES);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.stopAndReset(YES);
    };
}

-(JobsRetIDByBOOLBlock _Nonnull)stopAndReset{
    @jobs_weakify(self)
    return ^id(BOOL reset){
        @jobs_strongify(self)
        if (!self) return nil;
        if (self.rotator) self.rotator.stopAndReset(reset);
        self.byHasStarted(NO);
        self.byRunning(NO);
        return self;
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)jobsCommonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byBackgroundColor(UIColor.clearColor);
        self.byUserInteractionEnabled(NO);
        self.byDialLayer(CAShapeLayer.layer);
        self.byHourHandLayer(CAShapeLayer.layer);
        self.byMinuteHandLayer(CAShapeLayer.layer);
        self.byCenterDotLayer(CAShapeLayer.layer);
        self.byMinuteHandContainerView([[UIView alloc] initWithFrame:CGRectZero]);
        self.minuteHandContainerView.byBgColor(UIColor.clearColor);
        self.minuteHandContainerView.byUserInteractionEnabled(NO);
        [self.layer addSublayer:self.dialLayer];
        [self.layer addSublayer:self.hourHandLayer];
        [self addSubview:self.minuteHandContainerView];
        [self.minuteHandContainerView.layer addSublayer:self.minuteHandLayer];
        [self.layer addSublayer:self.centerDotLayer];
        for (CAShapeLayer *shapeLayer in @[
            self.dialLayer,
            self.hourHandLayer,
            self.minuteHandLayer
        ]) {
            shapeLayer.byFillColor(UIColor.clearColor.CGColor);
            shapeLayer.byLineCap(kCALineCapRound);
            shapeLayer.byLineJoin(kCALineJoinRound);
        }
        self.rotator = [[JobsImageRotator alloc] initWithTargetView:self.minuteHandContainerView
                                                          direction:self.direction
                                                           interval:self.interval];
        self.byInterval(self.rotator.interval);
        self.applyTintColor();
    };
}

-(jobsByVoidBlock _Nonnull)applyTintColor{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *color = self.tintColor ?: UIColor.darkGrayColor;
        self.dialLayer.byStrokeColor([color colorWithAlphaComponent:0.72].CGColor);
        self.hourHandLayer.byStrokeColor(color.CGColor);
        self.minuteHandLayer.byStrokeColor(color.CGColor);
        self.centerDotLayer.byFillColor(color.CGColor);
    };
}

-(jobsByVoidBlock _Nonnull)layoutIcon{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat side = MIN(CGRectGetWidth(self.bounds),
                           CGRectGetHeight(self.bounds));
        if (side <= 0) return;
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),
                                     CGRectGetMidY(self.bounds));
        CGFloat lineWidth = MAX(1.35, side * 0.075);
        CGFloat radius = MAX(0, side / 2.0 - lineWidth / 2.0);
        UIBezierPath *dialPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(
            center.x - radius,
            center.y - radius,
            radius * 2.0,
            radius * 2.0
        )];
        CGFloat hourLength = side * 0.22;
        CGFloat hourAngle = -M_PI / 3.0;
        UIBezierPath *hourPath = UIBezierPath.bezierPath;
        [hourPath moveToPoint:center];
        [hourPath addLineToPoint:CGPointMake(
            center.x + sin(hourAngle) * hourLength,
            center.y - cos(hourAngle) * hourLength
        )];
        UIBezierPath *minutePath = UIBezierPath.bezierPath;
        [minutePath moveToPoint:center];
        [minutePath addLineToPoint:CGPointMake(
            center.x,
            center.y - side * 0.34
        )];
        CGFloat dotRadius = MAX(1.2, lineWidth * 0.72);
        UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(
            center.x - dotRadius,
            center.y - dotRadius,
            dotRadius * 2.0,
            dotRadius * 2.0
        )];
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.dialLayer.byFrame(self.bounds);
        self.dialLayer.byLineWidth(lineWidth);
        self.dialLayer.byPath(dialPath.CGPath);
        self.hourHandLayer.byFrame(self.bounds);
        self.hourHandLayer.byLineWidth(lineWidth);
        self.hourHandLayer.byPath(hourPath.CGPath);
        self.minuteHandLayer.byFrame(self.minuteHandContainerView.bounds);
        self.minuteHandLayer.byLineWidth(MAX(1.1, lineWidth * 0.72));
        self.minuteHandLayer.byPath(minutePath.CGPath);
        self.centerDotLayer.byFrame(self.bounds);
        self.centerDotLayer.byPath(dotPath.CGPath);
        [CATransaction commit];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsClockIconView
-(JobsRetJobsClockIconViewByBOOLBlock _Nonnull)byHasStarted{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setHasStarted:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRunning:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byCenterDotLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setCenterDotLayer:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byDialLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setDialLayer:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byHourHandLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setHourHandLayer:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byMinuteHandLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setMinuteHandLayer:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByNSTimeIntervalBlock _Nonnull)byInterval{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setInterval:data];
        return self;
    };
}

-(JobsRetJobsClockIconViewByUIViewBlock _Nonnull)byMinuteHandContainerView{
    @jobs_weakify(self)
    return ^__kindof JobsClockIconView * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setMinuteHandContainerView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsClockIconView
@end
