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

-(void)jobsCommonInit;
-(void)applyTintColor;
-(void)layoutIcon;

@end

@implementation JobsClockIconView

-(void)dealloc{
    [_rotator stop];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _direction = JobsImageRotationDirectionClockwise;
        _interval = JobsClockIconViewDefaultInterval;
        [self jobsCommonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        _direction = JobsImageRotationDirectionClockwise;
        _interval = JobsClockIconViewDefaultInterval;
        [self jobsCommonInit];
    };return self;
}

-(instancetype)initWithDirection:(JobsImageRotationDirection)direction
                        interval:(NSTimeInterval)interval{
    if (self = [super initWithFrame:CGRectZero]) {
        _direction = direction;
        _interval = interval;
        [self jobsCommonInit];
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.minuteHandContainerView.bounds = (CGRect){
        .origin = CGPointZero,
        .size = self.bounds.size
    };
    self.minuteHandContainerView.center = CGPointMake(CGRectGetMidX(self.bounds),
                                                       CGRectGetMidY(self.bounds));
    [self layoutIcon];
}

-(void)tintColorDidChange{
    [super tintColorDidChange];
    [self applyTintColor];
}

-(void)setDirection:(JobsImageRotationDirection)direction{
    _direction = direction;
    self.rotator.direction = direction;
}

-(void)setInterval:(NSTimeInterval)interval{
    _interval = interval;
    self.rotator.interval = interval;
    _interval = self.rotator.interval;
}

-(instancetype)start{
    if (self.isRunning) return self;
    [self.rotator start];
    self.hasStarted = YES;
    self.running = YES;
    return self;
}

-(instancetype)pause{
    if (!self.hasStarted || !self.isRunning) return self;
    [self.rotator pause];
    self.running = NO;
    return self;
}

-(instancetype)resume{
    if (!self.hasStarted || self.isRunning) return self;
    [self.rotator resume];
    self.running = YES;
    return self;
}

-(instancetype)stop{
    return [self stopAndReset:YES];
}

-(instancetype)stopAndReset:(BOOL)reset{
    [self.rotator stopAndReset:reset];
    self.hasStarted = NO;
    self.running = NO;
    return self;
}
#pragma mark —— 一些私有方法
-(void)jobsCommonInit{
    self.backgroundColor = UIColor.clearColor;
    self.userInteractionEnabled = NO;
    self.dialLayer = CAShapeLayer.layer;
    self.hourHandLayer = CAShapeLayer.layer;
    self.minuteHandLayer = CAShapeLayer.layer;
    self.centerDotLayer = CAShapeLayer.layer;
    self.minuteHandContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.minuteHandContainerView.backgroundColor = UIColor.clearColor;
    self.minuteHandContainerView.userInteractionEnabled = NO;
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
        shapeLayer.fillColor = UIColor.clearColor.CGColor;
        shapeLayer.lineCap = kCALineCapRound;
        shapeLayer.lineJoin = kCALineJoinRound;
    }
    self.rotator = [[JobsImageRotator alloc] initWithTargetView:self.minuteHandContainerView
                                                      direction:self.direction
                                                       interval:self.interval];
    self.interval = self.rotator.interval;
    [self applyTintColor];
}

-(void)applyTintColor{
    UIColor *color = self.tintColor ?: UIColor.darkGrayColor;
    self.dialLayer.strokeColor = [color colorWithAlphaComponent:0.72].CGColor;
    self.hourHandLayer.strokeColor = color.CGColor;
    self.minuteHandLayer.strokeColor = color.CGColor;
    self.centerDotLayer.fillColor = color.CGColor;
}

-(void)layoutIcon{
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
    self.dialLayer.frame = self.bounds;
    self.dialLayer.lineWidth = lineWidth;
    self.dialLayer.path = dialPath.CGPath;
    self.hourHandLayer.frame = self.bounds;
    self.hourHandLayer.lineWidth = lineWidth;
    self.hourHandLayer.path = hourPath.CGPath;
    self.minuteHandLayer.frame = self.minuteHandContainerView.bounds;
    self.minuteHandLayer.lineWidth = MAX(1.1, lineWidth * 0.72);
    self.minuteHandLayer.path = minutePath.CGPath;
    self.centerDotLayer.frame = self.bounds;
    self.centerDotLayer.path = dotPath.CGPath;
    [CATransaction commit];
}

@end
