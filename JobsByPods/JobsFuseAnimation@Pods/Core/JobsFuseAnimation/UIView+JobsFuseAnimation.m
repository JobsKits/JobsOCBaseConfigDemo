//
//  UIView+JobsFuseAnimation.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "UIView+JobsFuseAnimation.h"
#import <objc/runtime.h>

static void *JobsFuseRingLayerKey = &JobsFuseRingLayerKey;
static void *JobsFuseTrackLayerKey = &JobsFuseTrackLayerKey;
static void *JobsFuseDisplayLinkKey = &JobsFuseDisplayLinkKey;
static void *JobsFuseRingStartTSKey = &JobsFuseRingStartTSKey;
static void *JobsFuseRingConfigKey = &JobsFuseRingConfigKey;
static void *JobsFuseRetreatStartTSKey = &JobsFuseRetreatStartTSKey;
static void *JobsFuseRetreatInitialStrokeKey = &JobsFuseRetreatInitialStrokeKey;
static void *JobsFuseRetreatRingOpacityKey = &JobsFuseRetreatRingOpacityKey;
static void *JobsFuseRetreatTrackOpacityKey = &JobsFuseRetreatTrackOpacityKey;
static void *JobsFuseDisplayModeKey = &JobsFuseDisplayModeKey;
static void *JobsFuseScaleOriginalTransformKey = &JobsFuseScaleOriginalTransformKey;
static void *JobsFuseScaleActiveKey = &JobsFuseScaleActiveKey;

typedef NS_ENUM(NSUInteger, JobsFuseDisplayMode) {
    JobsFuseDisplayModeGrow,
    JobsFuseDisplayModeRetreat
};

@interface UIView (JobsFuseAnimationPrivate)

-(void)jobs_fuseDisplayLinkTick:(CADisplayLink *)displayLink;
-(void)jobs_layoutFuseOuterRingLayers;
-(void)jobs_updateFuseOuterRingProgress:(CGFloat)progress;
-(void)jobs_removeFuseOuterRingLayers;

@end

@interface _JobsFuseDisplayLinkTarget : NSObject

@property(nonatomic, weak) UIView *view;
+(instancetype)targetWithView:(UIView *)view;
-(void)tick:(CADisplayLink *)displayLink;

@end

@implementation _JobsFuseDisplayLinkTarget

+(instancetype)targetWithView:(UIView *)view {
    _JobsFuseDisplayLinkTarget *target = _JobsFuseDisplayLinkTarget.alloc.init;
    target.view = view;
    return target;
}

-(void)tick:(CADisplayLink *)displayLink {
    [self.view jobs_fuseDisplayLinkTick:displayLink];
}

@end

@implementation UIView (JobsFuseAnimation)

-(instancetype)byFuseOuterRingStart:(JobsFuseOuterRingConfig *)config {
    void (^work)(void) = ^{
        [self layoutIfNeeded];
        [self byFuseOuterRingStop:NO];
        if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;

        JobsFuseOuterRingConfig *currentConfig = [config ?: JobsFuseOuterRingConfig.config copy];
        objc_setAssociatedObject(self, JobsFuseRingConfigKey, currentConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseRingStartTSKey, @(CACurrentMediaTime()), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseDisplayModeKey, @(JobsFuseDisplayModeGrow), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        CAShapeLayer *trackLayer = nil;
        if (currentConfig.trackColor) {
            trackLayer = CAShapeLayer.layer;
            trackLayer.name = @"jobs.fuse.outerRing.track";
            trackLayer.contentsScale = UIScreen.mainScreen.scale;
            trackLayer.fillColor = currentConfig.fillColor.CGColor;
            trackLayer.strokeColor = currentConfig.trackColor.CGColor;
            trackLayer.lineWidth = currentConfig.lineWidth;
            trackLayer.lineCap = kCALineCapRound;
            trackLayer.lineJoin = kCALineJoinRound;
            trackLayer.strokeStart = 0;
            trackLayer.strokeEnd = 1;
            trackLayer.opacity = 1;
            [self.layer addSublayer:trackLayer];
        }

        CAShapeLayer *ringLayer = CAShapeLayer.layer;
        ringLayer.name = @"jobs.fuse.outerRing.progress";
        ringLayer.contentsScale = UIScreen.mainScreen.scale;
        ringLayer.fillColor = currentConfig.fillColor.CGColor;
        ringLayer.strokeColor = currentConfig.strokeColor.CGColor;
        ringLayer.lineWidth = currentConfig.lineWidth;
        ringLayer.lineCap = kCALineCapRound;
        ringLayer.lineJoin = kCALineJoinRound;
        ringLayer.strokeStart = 0;
        ringLayer.strokeEnd = 0.001;
        ringLayer.opacity = currentConfig.fromOpacity;
        [self.layer addSublayer:ringLayer];

        objc_setAssociatedObject(self, JobsFuseTrackLayerKey, trackLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseRingLayerKey, ringLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self jobs_layoutFuseOuterRingLayers];
        [self jobs_updateFuseOuterRingProgress:0.001];

        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:[_JobsFuseDisplayLinkTarget targetWithView:self] selector:@selector(tick:)];
        if (@available(iOS 10.0, *)) {
            displayLink.preferredFramesPerSecond = MAX(1, MIN(120, (NSInteger)lrint(1.0 / currentConfig.timerInterval)));
        }
        [displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        objc_setAssociatedObject(self, JobsFuseDisplayLinkKey, displayLink, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFuseOuterRingStop:(BOOL)animated {
    void (^work)(void) = ^{
        CADisplayLink *displayLink = objc_getAssociatedObject(self, JobsFuseDisplayLinkKey);
        [displayLink invalidate];
        objc_setAssociatedObject(self, JobsFuseDisplayLinkKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        CAShapeLayer *ringLayer = objc_getAssociatedObject(self, JobsFuseRingLayerKey);
        CAShapeLayer *trackLayer = objc_getAssociatedObject(self, JobsFuseTrackLayerKey);
        JobsFuseOuterRingConfig *config = objc_getAssociatedObject(self, JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
        if (!ringLayer) return;

        CGFloat currentStrokeEnd = MAX(0, MIN(1, ringLayer.presentationLayer ? ringLayer.presentationLayer.strokeEnd : ringLayer.strokeEnd));
        if (!animated || config.retreatDuration <= 0 || currentStrokeEnd <= 0.001) {
            [self jobs_removeFuseOuterRingLayers];
            return;
        }

        CGFloat currentRingOpacity = ringLayer.presentationLayer ? ringLayer.presentationLayer.opacity : ringLayer.opacity;
        CGFloat currentTrackOpacity = trackLayer.presentationLayer ? trackLayer.presentationLayer.opacity : trackLayer.opacity;
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        ringLayer.strokeStart = 0;
        ringLayer.strokeEnd = currentStrokeEnd;
        ringLayer.opacity = currentRingOpacity;
        trackLayer.opacity = currentTrackOpacity;
        [CATransaction commit];

        objc_setAssociatedObject(self, JobsFuseRetreatStartTSKey, @(CACurrentMediaTime()), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseRetreatInitialStrokeKey, @(currentStrokeEnd), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseRetreatRingOpacityKey, @(currentRingOpacity), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseRetreatTrackOpacityKey, @(currentTrackOpacity), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseDisplayModeKey, @(JobsFuseDisplayModeRetreat), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        CADisplayLink *retreatDisplayLink = [CADisplayLink displayLinkWithTarget:[_JobsFuseDisplayLinkTarget targetWithView:self] selector:@selector(tick:)];
        if (@available(iOS 10.0, *)) {
            retreatDisplayLink.preferredFramesPerSecond = MAX(1, MIN(120, (NSInteger)lrint(1.0 / config.timerInterval)));
        }
        [retreatDisplayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        objc_setAssociatedObject(self, JobsFuseDisplayLinkKey, retreatDisplayLink, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFuseOuterRingLayoutIfNeeded {
    void (^work)(void) = ^{
        [self jobs_layoutFuseOuterRingLayers];
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFusePressScaleStart:(CGFloat)scale duration:(NSTimeInterval)duration {
    void (^work)(void) = ^{
        BOOL active = [objc_getAssociatedObject(self, JobsFuseScaleActiveKey) boolValue];
        if (!active) {
            objc_setAssociatedObject(self, JobsFuseScaleOriginalTransformKey, [NSValue valueWithCGAffineTransform:self.transform], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        objc_setAssociatedObject(self, JobsFuseScaleActiveKey, @YES, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        CGAffineTransform baseTransform = [objc_getAssociatedObject(self, JobsFuseScaleOriginalTransformKey) CGAffineTransformValue];
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformScale(baseTransform, MAX(0.01, scale), MAX(0.01, scale));
        } completion:nil];
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFusePressScaleStop:(BOOL)animated duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity {
    void (^work)(void) = ^{
        NSValue *transformValue = objc_getAssociatedObject(self, JobsFuseScaleOriginalTransformKey);
        CGAffineTransform originalTransform = transformValue ? transformValue.CGAffineTransformValue : CGAffineTransformIdentity;
        objc_setAssociatedObject(self, JobsFuseScaleActiveKey, @NO, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        objc_setAssociatedObject(self, JobsFuseScaleOriginalTransformKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        if (!animated) {
            self.transform = originalTransform;
            return;
        }

        [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:MAX(0.05, MIN(1, damping)) initialSpringVelocity:MAX(0, velocity) options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
            self.transform = originalTransform;
        } completion:nil];
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFusePressStart:(JobsFuseOuterRingConfig *)ringConfig scale:(CGFloat)scale {
    [self byFuseOuterRingStart:ringConfig];
    [self byFusePressScaleStart:scale duration:0.16];
    return self;
}

-(instancetype)byFusePressStop:(BOOL)animated {
    [self byFuseOuterRingStop:animated];
    [self byFusePressScaleStop:animated duration:0.22 damping:0.72 velocity:0.8];
    return self;
}

-(instancetype)byFusePlaySystemSound:(SystemSoundID)soundID {
    AudioServicesPlaySystemSound(soundID ?: 1104);
    return self;
}

@end

@implementation UIView (JobsFuseAnimationPrivate)

-(void)jobs_fuseDisplayLinkTick:(CADisplayLink *)displayLink {
    JobsFuseDisplayMode mode = [objc_getAssociatedObject(self, JobsFuseDisplayModeKey) unsignedIntegerValue];
    JobsFuseOuterRingConfig *config = objc_getAssociatedObject(self, JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;

    if (mode == JobsFuseDisplayModeRetreat) {
        CAShapeLayer *ringLayer = objc_getAssociatedObject(self, JobsFuseRingLayerKey);
        CAShapeLayer *trackLayer = objc_getAssociatedObject(self, JobsFuseTrackLayerKey);
        if (!ringLayer) return;

        NSTimeInterval startTS = [objc_getAssociatedObject(self, JobsFuseRetreatStartTSKey) doubleValue];
        CGFloat initialStroke = [objc_getAssociatedObject(self, JobsFuseRetreatInitialStrokeKey) doubleValue];
        CGFloat ringOpacity = [objc_getAssociatedObject(self, JobsFuseRetreatRingOpacityKey) doubleValue];
        CGFloat trackOpacity = [objc_getAssociatedObject(self, JobsFuseRetreatTrackOpacityKey) doubleValue];
        CGFloat raw = MIN(1.0, MAX(0, (CACurrentMediaTime() - startTS) / MAX(0.001, config.retreatDuration)));
        CGFloat eased = 1.0 - pow(1.0 - raw, 2.0);
        CGFloat strokeEnd = MAX(0.0001, initialStroke * (1.0 - eased));

        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        ringLayer.strokeStart = 0;
        ringLayer.strokeEnd = strokeEnd;
        ringLayer.opacity = ringOpacity;
        trackLayer.opacity = trackOpacity * (1.0 - raw);
        [CATransaction commit];

        if (raw >= 1.0) {
            [displayLink invalidate];
            objc_setAssociatedObject(self, JobsFuseDisplayLinkKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            if (config.fadeOutDuration <= 0) {
                [self jobs_removeFuseOuterRingLayers];
                return;
            }
            CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            fadeAnimation.fromValue = @((ringLayer.presentationLayer ?: ringLayer).opacity);
            fadeAnimation.toValue = @0;
            fadeAnimation.duration = config.fadeOutDuration;
            fadeAnimation.fillMode = kCAFillModeForwards;
            fadeAnimation.removedOnCompletion = NO;
            [CATransaction begin];
            [CATransaction setCompletionBlock:^{
                [self jobs_removeFuseOuterRingLayers];
            }];
            [ringLayer addAnimation:fadeAnimation forKey:@"jobs.fuse.outerRing.retreatFadeOut"];
            [CATransaction commit];
        }
        return;
    }

    NSTimeInterval startTS = [objc_getAssociatedObject(self, JobsFuseRingStartTSKey) doubleValue];
    CGFloat raw = MAX(0, (CACurrentMediaTime() - startTS) / config.growDuration);
    CGFloat progress = config.repeatsWhileHolding ? fmod(raw, 1.0) : MIN(1.0, raw);
    [self jobs_updateFuseOuterRingProgress:MAX(0.001, MIN(1.0, progress))];
}

-(void)jobs_layoutFuseOuterRingLayers {
    CAShapeLayer *ringLayer = objc_getAssociatedObject(self, JobsFuseRingLayerKey);
    if (!ringLayer) return;

    JobsFuseOuterRingConfig *config = objc_getAssociatedObject(self, JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
    CGFloat inset = config.inset + config.lineWidth / 2.0;
    CGRect rect = CGRectInset(self.bounds, inset, inset);
    if (CGRectGetWidth(rect) <= 0 || CGRectGetHeight(rect) <= 0) return;

    UIBezierPath *path = nil;
    if (config.startsFromTop) {
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat radius = MAX(0.1, MIN(CGRectGetWidth(rect), CGRectGetHeight(rect)) / 2.0);
        path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:-M_PI_2 endAngle:1.5 * M_PI clockwise:YES];
    } else {
        CGFloat radius = MAX(0, MIN(self.layer.cornerRadius, MIN(CGRectGetWidth(rect), CGRectGetHeight(rect)) / 2.0));
        path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    }

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    for (CAShapeLayer *layer in @[objc_getAssociatedObject(self, JobsFuseTrackLayerKey) ?: NSNull.null, ringLayer]) {
        if (![layer isKindOfClass:CAShapeLayer.class]) continue;
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        layer.lineWidth = config.lineWidth;
    }
    [CATransaction commit];
}

-(void)jobs_updateFuseOuterRingProgress:(CGFloat)progress {
    CAShapeLayer *ringLayer = objc_getAssociatedObject(self, JobsFuseRingLayerKey);
    if (!ringLayer) return;

    JobsFuseOuterRingConfig *config = objc_getAssociatedObject(self, JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
    CGFloat p = MAX(0.001, MIN(1.0, progress));
    CGFloat opacity = config.fromOpacity + (config.toOpacity - config.fromOpacity) * p;

    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    ringLayer.strokeStart = 0;
    ringLayer.strokeEnd = p;
    ringLayer.opacity = opacity;
    [CATransaction commit];
}

-(void)jobs_removeFuseOuterRingLayers {
    CAShapeLayer *ringLayer = objc_getAssociatedObject(self, JobsFuseRingLayerKey);
    CAShapeLayer *trackLayer = objc_getAssociatedObject(self, JobsFuseTrackLayerKey);
    [ringLayer removeAllAnimations];
    [trackLayer removeAllAnimations];
    [ringLayer removeFromSuperlayer];
    [trackLayer removeFromSuperlayer];
    objc_setAssociatedObject(self, JobsFuseRingLayerKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, JobsFuseTrackLayerKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
