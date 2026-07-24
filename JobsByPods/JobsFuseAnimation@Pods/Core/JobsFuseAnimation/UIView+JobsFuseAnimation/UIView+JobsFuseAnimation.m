//
//  UIView+JobsFuseAnimation.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "UIView+JobsFuseAnimation.h"

JobsKey(JobsFuseRingLayerKey)
JobsKey(JobsFuseTrackLayerKey)
JobsKey(JobsFuseDisplayLinkKey)
JobsKey(JobsFuseRingStartTSKey)
JobsKey(JobsFuseRingConfigKey)
JobsKey(JobsFuseRetreatStartTSKey)
JobsKey(JobsFuseRetreatInitialStrokeKey)
JobsKey(JobsFuseRetreatRingOpacityKey)
JobsKey(JobsFuseRetreatTrackOpacityKey)
JobsKey(JobsFuseDisplayModeKey)
JobsKey(JobsFuseScaleOriginalTransformKey)
JobsKey(JobsFuseScaleActiveKey)
JobsKey(JobsFuseBubbleRunnerKey)

static NSURL *_Nullable JobsFuseSoundURL(NSString *fileFullName, NSBundle *bundle) {
    if (!fileFullName.length) return nil;
    NSString *resourceName = fileFullName.stringByDeletingPathExtension;
    NSString *resourceExtension = fileFullName.pathExtension;
    NSURL *soundURL = [bundle URLForResource:resourceName
                              withExtension:resourceExtension.length ? resourceExtension : nil];
    if (soundURL) return soundURL;
    for (NSURL *bundleURL in [bundle URLsForResourcesWithExtension:@"bundle" subdirectory:nil]) {
        NSBundle *resourceBundle = [NSBundle bundleWithURL:bundleURL];
        soundURL = [resourceBundle URLForResource:resourceName
                                    withExtension:resourceExtension.length ? resourceExtension : nil];
        if (soundURL) return soundURL;
    };return nil;
}

static SystemSoundID JobsFuseSoundID(NSString *fileFullName, NSBundle *bundle) {
    NSURL *soundURL = JobsFuseSoundURL(fileFullName, bundle);
    if (!soundURL) return 0;
    static NSMutableDictionary<NSString *, NSNumber *> *soundIDs;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        soundIDs = NSMutableDictionary.dictionary;
    });
    @synchronized (soundIDs) {
        NSNumber *cachedSoundID = soundIDs[soundURL.absoluteString];
        if (cachedSoundID) return (SystemSoundID)cachedSoundID.unsignedIntValue;
        SystemSoundID soundID = 0;
        OSStatus status = AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundID);
        if (status != kAudioServicesNoError || !soundID) return 0;
        soundIDs[soundURL.absoluteString] = @(soundID);
        return soundID;
    }
}

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

Prop_weak()UIView *view;
+(instancetype)targetWithView:(UIView *)view;
-(void)tick:(CADisplayLink *)displayLink;

@end

@interface _JobsFuseBubbleRunner : NSObject

Prop_weak()UIView *sourceView;
Prop_weak()UIView *hostView;
Prop_strong()JobsFuseBubbleConfig *config;
Prop_copy()JobsFuseBubbleProvider bubbleProvider;
Prop_copy()JobsFuseBubbleEmitBlock emitBlock;
Prop_strong()NSTimer *timer;
Prop_assign()NSInteger concurrentCount;

+(instancetype)runnerWithSourceView:(UIView *)sourceView
                           hostView:(UIView *)hostView
                             config:(JobsFuseBubbleConfig *)config
                     bubbleProvider:(JobsFuseBubbleProvider)bubbleProvider
                           emitBlock:(JobsFuseBubbleEmitBlock _Nullable)emitBlock;
-(void)start;
-(void)stop;
-(void)emitBubble;

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

@implementation _JobsFuseBubbleRunner
+(instancetype)runnerWithSourceView:(UIView *)sourceView
                           hostView:(UIView *)hostView
                             config:(JobsFuseBubbleConfig *)config
                     bubbleProvider:(JobsFuseBubbleProvider)bubbleProvider
                           emitBlock:(JobsFuseBubbleEmitBlock)emitBlock {
    _JobsFuseBubbleRunner *runner = _JobsFuseBubbleRunner.alloc.init;
    runner.sourceView = sourceView;
    runner.hostView = hostView;
    runner.config = [config copy];
    runner.bubbleProvider = bubbleProvider;
    runner.emitBlock = emitBlock;
    return runner;
}

-(void)start {
    [self stop];
    [self emitBubble];
    @jobs_weakify(self)
    self.timer = [NSTimer timerWithTimeInterval:self.config.emissionInterval
                                        repeats:YES
                                          block:^(NSTimer *timer) {
        @jobs_strongify(self)
        [self emitBubble];
    }];
    [NSRunLoop.mainRunLoop addTimer:self.timer
                            forMode:NSRunLoopCommonModes];
}

-(void)stop {
    [self.timer invalidate];
    self.timer = nil;
}

-(void)emitBubble {
    if (self.concurrentCount >= self.config.maximumConcurrentCount ||
        !self.sourceView.window ||
        !self.hostView ||
        !self.bubbleProvider) return;
    UIView *bubble = self.bubbleProvider();
    if (!bubble) return;
    if (CGRectGetWidth(bubble.bounds) <= 0 || CGRectGetHeight(bubble.bounds) <= 0) {
        bubble.frame = CGRectMake(0, 0, 32, 32);
    }
    CGPoint sourcePoint = CGPointMake(CGRectGetMidX(self.sourceView.bounds), CGRectGetMinY(self.sourceView.bounds));
    bubble.center = [self.sourceView convertPoint:sourcePoint
                                          toView:self.hostView];
    bubble.alpha = 0;
    bubble.transform = CGAffineTransformMakeScale(self.config.initialScale, self.config.initialScale);
    [self.hostView addSubview:bubble];
    self.concurrentCount += 1;
    if (self.emitBlock) self.emitBlock();
    BOOL reduceMotion = UIAccessibilityIsReduceMotionEnabled();
    CGFloat randomUnit = (CGFloat)arc4random_uniform(10001) / 5000.0 - 1.0;
    CGFloat rotationUnit = (CGFloat)arc4random_uniform(10001) / 5000.0 - 1.0;
    CGFloat riseDistance = reduceMotion ? MIN(28, self.config.riseDistance) : self.config.riseDistance;
    CGFloat drift = reduceMotion ? 0 : randomUnit * self.config.horizontalDrift;
    CGFloat rotation = reduceMotion ? 0 : rotationUnit * self.config.maximumRotation;
    NSTimeInterval duration = reduceMotion ? MIN(0.28, self.config.duration) : self.config.duration;
    CGPoint startCenter = bubble.center;
    [UIView animateKeyframesWithDuration:duration
                                   delay:0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0
                                relativeDuration:0.22
                                      animations:^{
            bubble.alpha = 1;
            bubble.center = CGPointMake(startCenter.x + drift * 0.18,
                                        startCenter.y - riseDistance * 0.2);
            bubble.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(rotation * 0.35),
                                                      self.config.peakScale,
                                                      self.config.peakScale);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.22
                                relativeDuration:0.78
                                      animations:^{
            bubble.alpha = 0;
            bubble.center = CGPointMake(startCenter.x + drift,
                                        startCenter.y - riseDistance);
            bubble.transform = CGAffineTransformScale(CGAffineTransformMakeRotation(rotation),
                                                      self.config.endScale,
                                                      self.config.endScale);
        }];
    } completion:^(BOOL finished) {
        [bubble removeFromSuperview];
        self.concurrentCount = MAX(0, self.concurrentCount - 1);
    }];
}

@end

@implementation UIView (JobsFuseAnimation)
-(instancetype)byFuseBubbleStartInView:(UIView *)hostView
                                config:(JobsFuseBubbleConfig *)config
                        bubbleProvider:(JobsFuseBubbleProvider)bubbleProvider
                                onEmit:(JobsFuseBubbleEmitBlock)onEmit {
    void (^work)(void) = ^{
        UIView *targetView = hostView ?: self.window ?: self.superview;
        if (!targetView || !bubbleProvider) return;
        [self byFuseBubbleStop];
        _JobsFuseBubbleRunner *runner = [_JobsFuseBubbleRunner runnerWithSourceView:self
                                                                          hostView:targetView
                                                                            config:config ?: JobsFuseBubbleConfig.config
                                                                    bubbleProvider:bubbleProvider
                                                                          emitBlock:onEmit];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseBubbleRunnerKey, runner)
        [runner start];
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFuseBubbleStop {
    void (^work)(void) = ^{
        _JobsFuseBubbleRunner *runner = Jobs_getAssociatedObject(JobsFuseBubbleRunnerKey);
        [runner stop];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseBubbleRunnerKey, nil)
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFuseOuterRingStart:(JobsFuseOuterRingConfig *)config {
    void (^work)(void) = ^{
        [self layoutIfNeeded];
        [self byFuseOuterRingStop:NO];
        if (CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
        JobsFuseOuterRingConfig *currentConfig = [config ?: JobsFuseOuterRingConfig.config copy];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRingConfigKey, currentConfig)
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRingStartTSKey, @(CACurrentMediaTime()))
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayModeKey, @(JobsFuseDisplayModeGrow))
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
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseTrackLayerKey, trackLayer)
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRingLayerKey, ringLayer)
        [self jobs_layoutFuseOuterRingLayers];
        [self jobs_updateFuseOuterRingProgress:0.001];
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:[_JobsFuseDisplayLinkTarget targetWithView:self] selector:@selector(tick:)];
        if (@available(iOS 10.0, *)) {
            displayLink.preferredFramesPerSecond = MAX(1, MIN(120, (NSInteger)lrint(1.0 / currentConfig.timerInterval)));
        }
        [displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayLinkKey, displayLink)
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFuseOuterRingStop:(BOOL)animated {
    void (^work)(void) = ^{
        CADisplayLink *displayLink = Jobs_getAssociatedObject(JobsFuseDisplayLinkKey);
        [displayLink invalidate];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayLinkKey, nil)
        CAShapeLayer *ringLayer = Jobs_getAssociatedObject(JobsFuseRingLayerKey);
        CAShapeLayer *trackLayer = Jobs_getAssociatedObject(JobsFuseTrackLayerKey);
        JobsFuseOuterRingConfig *config = Jobs_getAssociatedObject(JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
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
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRetreatStartTSKey, @(CACurrentMediaTime()))
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRetreatInitialStrokeKey, @(currentStrokeEnd))
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRetreatRingOpacityKey, @(currentRingOpacity))
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRetreatTrackOpacityKey, @(currentTrackOpacity))
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayModeKey, @(JobsFuseDisplayModeRetreat))
        CADisplayLink *retreatDisplayLink = [CADisplayLink displayLinkWithTarget:[_JobsFuseDisplayLinkTarget targetWithView:self] selector:@selector(tick:)];
        if (@available(iOS 10.0, *)) {
            retreatDisplayLink.preferredFramesPerSecond = MAX(1, MIN(120, (NSInteger)lrint(1.0 / config.timerInterval)));
        }
        [retreatDisplayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayLinkKey, retreatDisplayLink)
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
        BOOL active = [Jobs_getAssociatedObject(JobsFuseScaleActiveKey) boolValue];
        if (!active) {
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleOriginalTransformKey, [NSValue valueWithCGAffineTransform:self.transform])
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleActiveKey, @YES)
        CGAffineTransform baseTransform = [Jobs_getAssociatedObject(JobsFuseScaleOriginalTransformKey) CGAffineTransformValue];
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformScale(baseTransform, MAX(0.01, scale), MAX(0.01, scale));
        } completion:nil];
    };
    NSThread.isMainThread ? work() : dispatch_async(dispatch_get_main_queue(), work);
    return self;
}

-(instancetype)byFusePressScaleStop:(BOOL)animated duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity {
    void (^work)(void) = ^{
        NSValue *transformValue = Jobs_getAssociatedObject(JobsFuseScaleOriginalTransformKey);
        CGAffineTransform originalTransform = transformValue ? transformValue.CGAffineTransformValue : CGAffineTransformIdentity;
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleActiveKey, @NO)
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleOriginalTransformKey, nil)
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

-(instancetype)byFuseTapScale {
    [self byFuseTapScaleWithScale:1.08f
                         duration:0.18f
                          damping:0.62f
                         velocity:0.8f];
    return self;
}

-(instancetype)byFuseTapScaleWithScale:(CGFloat)scale duration:(NSTimeInterval)duration damping:(CGFloat)damping velocity:(CGFloat)velocity {
    void (^work)(void) = ^{
        BOOL active = [Jobs_getAssociatedObject(JobsFuseScaleActiveKey) boolValue];
        if (!active) {
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleOriginalTransformKey, [NSValue valueWithCGAffineTransform:self.transform])
        }
        Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleActiveKey, @YES)
        CGAffineTransform baseTransform = [Jobs_getAssociatedObject(JobsFuseScaleOriginalTransformKey) CGAffineTransformValue];
        CGFloat safeScale = MAX(0.01f, scale);
        NSTimeInterval growDuration = MAX(0.01f, duration * 0.45f);
        NSTimeInterval bounceDuration = MAX(0.01f, duration);
        [UIView animateWithDuration:growDuration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformScale(baseTransform, safeScale, safeScale);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:bounceDuration delay:0 usingSpringWithDamping:MAX(0.05, MIN(1, damping)) initialSpringVelocity:MAX(0, velocity) options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
                self.transform = baseTransform;
            } completion:^(BOOL finished) {
                Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleActiveKey, @NO)
                Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseScaleOriginalTransformKey, nil)
            }];
        }];
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

-(instancetype)byFusePlaySound:(NSString *)fileFullName {
    SystemSoundID soundID = JobsFuseSoundID(fileFullName, NSBundle.mainBundle);
    if (soundID) AudioServicesPlaySystemSound(soundID);
    return self;
}

-(instancetype)byFusePlaySystemSound:(SystemSoundID)soundID {
    if (soundID) AudioServicesPlaySystemSound(soundID);
    return self;
}

@end

@implementation UIView (JobsFuseAnimationPrivate)
-(void)jobs_fuseDisplayLinkTick:(CADisplayLink *)displayLink {
    JobsFuseDisplayMode mode = [Jobs_getAssociatedObject(JobsFuseDisplayModeKey) unsignedIntegerValue];
    JobsFuseOuterRingConfig *config = Jobs_getAssociatedObject(JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
    if (mode == JobsFuseDisplayModeRetreat) {
        CAShapeLayer *ringLayer = Jobs_getAssociatedObject(JobsFuseRingLayerKey);
        CAShapeLayer *trackLayer = Jobs_getAssociatedObject(JobsFuseTrackLayerKey);
        if (!ringLayer) return;
        NSTimeInterval startTS = [Jobs_getAssociatedObject(JobsFuseRetreatStartTSKey) doubleValue];
        CGFloat initialStroke = [Jobs_getAssociatedObject(JobsFuseRetreatInitialStrokeKey) doubleValue];
        CGFloat ringOpacity = [Jobs_getAssociatedObject(JobsFuseRetreatRingOpacityKey) doubleValue];
        CGFloat trackOpacity = [Jobs_getAssociatedObject(JobsFuseRetreatTrackOpacityKey) doubleValue];
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
            Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseDisplayLinkKey, nil)
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
        };return;
    }
    NSTimeInterval startTS = [Jobs_getAssociatedObject(JobsFuseRingStartTSKey) doubleValue];
    CGFloat raw = MAX(0, (CACurrentMediaTime() - startTS) / config.growDuration);
    CGFloat progress = config.repeatsWhileHolding ? fmod(raw, 1.0) : MIN(1.0, raw);
    [self jobs_updateFuseOuterRingProgress:MAX(0.001, MIN(1.0, progress))];
}

-(void)jobs_layoutFuseOuterRingLayers {
    CAShapeLayer *ringLayer = Jobs_getAssociatedObject(JobsFuseRingLayerKey);
    if (!ringLayer) return;
    JobsFuseOuterRingConfig *config = Jobs_getAssociatedObject(JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
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
    for (CAShapeLayer *layer in @[Jobs_getAssociatedObject(JobsFuseTrackLayerKey) ?: NSNull.null, ringLayer]) {
        if (![layer isKindOfClass:CAShapeLayer.class]) continue;
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        layer.lineWidth = config.lineWidth;
    }
    [CATransaction commit];
}

-(void)jobs_updateFuseOuterRingProgress:(CGFloat)progress {
    CAShapeLayer *ringLayer = Jobs_getAssociatedObject(JobsFuseRingLayerKey);
    if (!ringLayer) return;
    JobsFuseOuterRingConfig *config = Jobs_getAssociatedObject(JobsFuseRingConfigKey) ?: JobsFuseOuterRingConfig.config;
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
    CAShapeLayer *ringLayer = Jobs_getAssociatedObject(JobsFuseRingLayerKey);
    CAShapeLayer *trackLayer = Jobs_getAssociatedObject(JobsFuseTrackLayerKey);
    [ringLayer removeAllAnimations];
    [trackLayer removeAllAnimations];
    [ringLayer removeFromSuperlayer];
    [trackLayer removeFromSuperlayer];
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseRingLayerKey, nil)
    Jobs_setAssociatedRETAIN_NONATOMIC(JobsFuseTrackLayerKey, nil)
}

@end
