//
//  UIView+JobsOCSkeletonView.m
//  JobsOCSkeletonView
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "UIView+JobsOCSkeletonView.h"

static NSString *const JobsOCSkeletonAnimationKey = @"jobs.oc.skeleton.animation";

@interface UIView (JobsOCSkeletonViewPrivate)

Prop_strong(nullable)CAGradientLayer *jobs_ocSkeletonLayer;
Prop_strong(nullable)JobsOCSkeletonConfig *jobs_ocSkeletonConfig;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonableValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonOriginalClipsValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonOriginalCornerRadiusValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonCornerRadiusValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonLineCornerRadiusValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonLastLineFillPercentValue;
Prop_strong(nullable)NSNumber *jobs_ocSkeletonLastAnimationWidthValue;

-(instancetype)jobs_applySkeletonable:(BOOL)enabled;
-(instancetype)jobs_applySkeletonCornerRadius:(CGFloat)cornerRadius;
-(CAGradientLayer *)jobs_prepareSkeletonLayerIfNeeded;
-(void)jobs_applySkeletonColors;
-(void)jobs_applySkeletonAnimation;
-(void)jobs_restartSkeletonAnimationIfNeededForWidth:(CGFloat)width;
-(CGFloat)jobs_resolvedSkeletonCornerRadiusWithConfig:(JobsOCSkeletonConfig *)config
                                              height:(CGFloat)height;

@end

static void jobs_ocSkeletonExchangeInstanceMethod(Class cls, SEL originalSel, SEL swizzledSel) {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSel);
    if (!originalMethod || !swizzledMethod) return;
    BOOL added = class_addMethod(cls,
                                 originalSel,
                                 method_getImplementation(swizzledMethod),
                                 method_getTypeEncoding(swizzledMethod));
    if (added) {
        class_replaceMethod(cls,
                            swizzledSel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIView (JobsOCSkeletonView)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jobs_ocSkeletonExchangeInstanceMethod(UIView.class,
                                              @selector(layoutSubviews),
                                              @selector(jobs_ocSkeleton_layoutSubviews));
    });
}

-(void)jobs_ocSkeleton_layoutSubviews{
    [self jobs_ocSkeleton_layoutSubviews];
    [self jobs_updateSkeletonLayout];
}

-(BOOL)jobs_isSkeletonShowing{
    return self.jobs_ocSkeletonLayer.superlayer != nil;
}

-(BOOL)jobs_isSkeletonable{
    NSNumber *value = self.jobs_ocSkeletonableValue;
    return value ? value.boolValue : NO;
}

-(void)jobs_startSkeleton{
    [self jobs_startSkeletonWithConfig:nil];
}

-(void)jobs_startSkeletonWithConfig:(JobsOCSkeletonConfig *)config{
    if (!self.jobs_isSkeletonable) return;
    JobsOCSkeletonConfig *realConfig = (config ?: self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig).copy;
    self.jobs_ocSkeletonConfig = realConfig;
    if (!self.jobs_ocSkeletonOriginalClipsValue) self.jobs_ocSkeletonOriginalClipsValue = @(self.clipsToBounds);
    if (!self.jobs_ocSkeletonOriginalCornerRadiusValue) self.jobs_ocSkeletonOriginalCornerRadiusValue = @(self.layer.cornerRadius);
    self.clipsToBounds = YES;
    CAGradientLayer *layer = [self jobs_prepareSkeletonLayerIfNeeded];
    layer.byHidden(NO);
    layer.opacity = 1;
    [self jobs_updateSkeletonLayout];
    [self jobs_applySkeletonColors];
    [self jobs_applySkeletonAnimation];
}

-(void)jobs_stopSkeleton{
    [self.jobs_ocSkeletonLayer removeAnimationForKey:JobsOCSkeletonAnimationKey];
    [self.jobs_ocSkeletonLayer removeFromSuperlayer];
    self.jobs_ocSkeletonLayer = nil;
    if (self.jobs_ocSkeletonOriginalClipsValue) {
        self.clipsToBounds = self.jobs_ocSkeletonOriginalClipsValue.boolValue;
    }
    if (self.jobs_ocSkeletonOriginalCornerRadiusValue) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.layer.cornerRadius = self.jobs_ocSkeletonOriginalCornerRadiusValue.doubleValue;
        [CATransaction commit];
    }
    self.jobs_ocSkeletonOriginalClipsValue = nil;
    self.jobs_ocSkeletonOriginalCornerRadiusValue = nil;
    self.jobs_ocSkeletonLastAnimationWidthValue = nil;
}

-(void)jobs_updateSkeletonLayout{
    CAGradientLayer *layer = self.jobs_ocSkeletonLayer;
    if (!layer || !self.jobs_isSkeletonShowing) return;
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (width <= 0 || height <= 0) return;
    JobsOCSkeletonConfig *config = self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig;
    CGFloat radius = [self jobs_resolvedSkeletonCornerRadiusWithConfig:config
                                                                height:height];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    if (config.animationStyle == JobsOCSkeletonAnimationStyleShimmer) {
        layer.frame = CGRectMake(-width, 0, width * 3.0, height);
    } else {
        layer.frame = self.bounds;
    }
    layer.cornerRadius = radius;
    self.layer.cornerRadius = MAX(self.layer.cornerRadius, radius);
    [CATransaction commit];
    [self jobs_restartSkeletonAnimationIfNeededForWidth:width];
}

-(void)jobs_setSkeletonMask:(CALayer *)maskLayer{
    self.jobs_ocSkeletonLayer.mask = maskLayer;
}

-(JobsRetViewByBOOLBlock _Nonnull)bySkeletonable{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(BOOL data) {
        @jobs_strongify(self)
        [self jobs_applySkeletonable:data];
        return self;
    };
}

-(instancetype)jobs_applySkeletonable:(BOOL)enabled{
    self.jobs_ocSkeletonableValue = @(enabled);
    if (!enabled) [self jobs_stopSkeleton];
    return self;
}

-(JobsRetViewByCGFloatBlock _Nonnull)bySkeletonCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        [self jobs_applySkeletonCornerRadius:data];
        return self;
    };
}

-(instancetype)jobs_applySkeletonCornerRadius:(CGFloat)cornerRadius{
    self.jobs_ocSkeletonCornerRadiusValue = @(cornerRadius);
    JobsOCSkeletonConfig *config = (self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig).copy;
    config.cornerRadius = cornerRadius;
    self.jobs_ocSkeletonConfig = config;
    [self jobs_updateSkeletonLayout];
    return self;
}

-(instancetype)bySkeletonWithEnabled:(BOOL)enabled
                        cornerRadius:(NSNumber *)cornerRadius{
    [self jobs_applySkeletonable:enabled];
    if (cornerRadius) [self jobs_applySkeletonCornerRadius:cornerRadius.doubleValue];
    return self;
}

-(JobsRetViewByVoidBlock _Nonnull)byShowGradientSkeleton{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self jobs_startSkeletonWithConfig:JobsOCSkeletonConfig.shimmerConfig];
        return self;
    };
}

-(instancetype)byShowGradientSkeletonWithBaseColor:(UIColor *)baseColor
                                        transition:(NSTimeInterval)transition{
    JobsOCSkeletonConfig *config = [JobsOCSkeletonConfig.shimmerConfig byBaseColor:baseColor];
    config.animationDuration = transition > 0 ? MAX(transition * 7.0, 0.01) : config.animationDuration;
    [self jobs_startSkeletonWithConfig:config];
    return self;
}

-(JobsRetViewByVoidBlock _Nonnull)byShowSolidSkeleton{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self jobs_startSkeletonWithConfig:JobsOCSkeletonConfig.pulseConfig];
        return self;
    };
}

-(instancetype)byShowSolidSkeletonWithBaseColor:(UIColor *)baseColor
                                     transition:(NSTimeInterval)transition{
    JobsOCSkeletonConfig *config = [JobsOCSkeletonConfig.pulseConfig byBaseColor:baseColor];
    config.animationDuration = transition > 0 ? MAX(transition * 4.0, 0.01) : config.animationDuration;
    [self jobs_startSkeletonWithConfig:config];
    return self;
}

-(JobsRetViewByVoidBlock _Nonnull)byHideSkeleton{
    @jobs_weakify(self)
    return ^__kindof UIView *_Nullable() {
        @jobs_strongify(self)
        [self jobs_stopSkeleton];
        return self;
    };
}

-(instancetype)byShimmering:(BOOL)enabled
                     config:(JobsOCSkeletonConfig *)config{
    if (enabled) {
        self.jobs_ocSkeletonableValue = @YES;
        [self jobs_startSkeletonWithConfig:config ?: JobsOCSkeletonConfig.defaultConfig];
    } else {
        [self jobs_stopSkeleton];
    };return self;
}

-(instancetype)byShimmerColorsWithBase:(UIColor *)baseColor
                             highlight:(UIColor *)highlightColor{
    JobsOCSkeletonConfig *config = (self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig).copy;
    config.baseColor = baseColor;
    config.highlightColor = highlightColor;
    self.jobs_ocSkeletonConfig = config;
    [self jobs_applySkeletonColors];
    return self;
}

@end

@implementation UIView (JobsOCSkeletonViewPrivate)
-(CAGradientLayer *)jobs_prepareSkeletonLayerIfNeeded{
    CAGradientLayer *layer = self.jobs_ocSkeletonLayer;
    if (layer) return layer;
    layer = CAGradientLayer.layer;
    layer.name = @"jobs.oc.skeleton.layer";
    layer.startPoint = CGPointMake(0, 0.5);
    layer.endPoint = CGPointMake(1, 0.5);
    layer.actions = @{
        @"bounds": NSNull.null,
        @"position": NSNull.null,
        @"frame": NSNull.null,
        @"cornerRadius": NSNull.null,
        @"colors": NSNull.null,
        @"locations": NSNull.null
    };
    [self.layer addSublayer:layer];
    self.jobs_ocSkeletonLayer = layer;
    return layer;
}

-(void)jobs_applySkeletonColors{
    CAGradientLayer *layer = self.jobs_ocSkeletonLayer;
    if (!layer) return;
    JobsOCSkeletonConfig *config = self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig;
    UIColor *baseColor = config.baseColor ?: RGBA_SAMECOLOR(0.90 * 255.0, 1);
    UIColor *highlightColor = config.highlightColor ?: RGBA_SAMECOLOR(1 * 255.0, 0.92);
    if (@available(iOS 13.0, *)) {
        baseColor = [baseColor resolvedColorWithTraitCollection:self.traitCollection];
        highlightColor = [highlightColor resolvedColorWithTraitCollection:self.traitCollection];
    }
    if (config.animationStyle == JobsOCSkeletonAnimationStyleShimmer) {
        CGFloat ratio = MIN(MAX(config.highlightWidthRatio, 0), 1);
        CGFloat half = ratio / 2.0;
        CGFloat start = MAX(0, 0.5 - half);
        CGFloat end = MIN(1, 0.5 + half);
        layer.colors = @[
            (__bridge id)baseColor.CGColor,
            (__bridge id)baseColor.CGColor,
            (__bridge id)highlightColor.CGColor,
            (__bridge id)baseColor.CGColor,
            (__bridge id)baseColor.CGColor
        ];
        layer.locations = @[@0, @(start), @0.5, @(end), @1];
    } else {
        layer.colors = @[
            (__bridge id)baseColor.CGColor,
            (__bridge id)baseColor.CGColor
        ];
        layer.locations = @[@0, @1];
    }
}

-(void)jobs_applySkeletonAnimation{
    JobsOCSkeletonConfig *config = self.jobs_ocSkeletonConfig ?: JobsOCSkeletonConfig.defaultConfig;
    CAGradientLayer *layer = self.jobs_ocSkeletonLayer;
    if (!layer) return;
    [layer removeAnimationForKey:JobsOCSkeletonAnimationKey];
    if (config.animationStyle == JobsOCSkeletonAnimationStyleShimmer) {
        CGFloat width = MAX(CGRectGetWidth(self.bounds), 1);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        animation.fromValue = @(-width);
        animation.toValue = @(width);
        animation.duration = MAX(config.animationDuration, 0.01);
        animation.repeatCount = HUGE_VALF;
        animation.removedOnCompletion = NO;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [layer addAnimation:animation forKey:JobsOCSkeletonAnimationKey];
        self.jobs_ocSkeletonLastAnimationWidthValue = @(width);
    } else {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animation.fromValue = @1;
        animation.toValue = @0.55;
        animation.duration = MAX(config.animationDuration, 0.01);
        animation.autoreverses = YES;
        animation.repeatCount = HUGE_VALF;
        animation.removedOnCompletion = NO;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [layer addAnimation:animation forKey:JobsOCSkeletonAnimationKey];
        self.jobs_ocSkeletonLastAnimationWidthValue = @(CGRectGetWidth(self.bounds));
    }
}

-(void)jobs_restartSkeletonAnimationIfNeededForWidth:(CGFloat)width{
    CAGradientLayer *layer = self.jobs_ocSkeletonLayer;
    if (!layer || !self.jobs_isSkeletonShowing) return;
    NSNumber *lastWidthValue = self.jobs_ocSkeletonLastAnimationWidthValue;
    BOOL widthChanged = !lastWidthValue || fabs(lastWidthValue.doubleValue - width) > 0.5;
    if (!widthChanged && [layer animationForKey:JobsOCSkeletonAnimationKey]) return;
    [self jobs_applySkeletonAnimation];
}

-(CGFloat)jobs_resolvedSkeletonCornerRadiusWithConfig:(JobsOCSkeletonConfig *)config
                                              height:(CGFloat)height{
    if (config.cornerRadius >= 0) return config.cornerRadius;
    if (self.jobs_ocSkeletonCornerRadiusValue) return self.jobs_ocSkeletonCornerRadiusValue.doubleValue;
    if (self.jobs_ocSkeletonLineCornerRadiusValue) return self.jobs_ocSkeletonLineCornerRadiusValue.doubleValue;
    CGFloat originalRadius = self.jobs_ocSkeletonOriginalCornerRadiusValue.doubleValue;
    return MAX(originalRadius, height / 2.0);
}

static char JobsOCSkeletonLayerKey;
static char JobsOCSkeletonConfigKey;
static char JobsOCSkeletonableKey;
static char JobsOCSkeletonOriginalClipsKey;
static char JobsOCSkeletonOriginalCornerRadiusKey;
static char JobsOCSkeletonCornerRadiusKey;
static char JobsOCSkeletonLineCornerRadiusKey;
static char JobsOCSkeletonLastLineFillPercentKey;
static char JobsOCSkeletonLastAnimationWidthKey;

-(CAGradientLayer *)jobs_ocSkeletonLayer{
    return objc_getAssociatedObject(self, &JobsOCSkeletonLayerKey);
}

-(void)setJobs_ocSkeletonLayer:(CAGradientLayer *)jobs_ocSkeletonLayer{
    objc_setAssociatedObject(self, &JobsOCSkeletonLayerKey, jobs_ocSkeletonLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(JobsOCSkeletonConfig *)jobs_ocSkeletonConfig{
    return objc_getAssociatedObject(self, &JobsOCSkeletonConfigKey);
}

-(void)setJobs_ocSkeletonConfig:(JobsOCSkeletonConfig *)jobs_ocSkeletonConfig{
    objc_setAssociatedObject(self, &JobsOCSkeletonConfigKey, jobs_ocSkeletonConfig, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonableValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonableKey);
}

-(void)setJobs_ocSkeletonableValue:(NSNumber *)jobs_ocSkeletonableValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonableKey, jobs_ocSkeletonableValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonOriginalClipsValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonOriginalClipsKey);
}

-(void)setJobs_ocSkeletonOriginalClipsValue:(NSNumber *)jobs_ocSkeletonOriginalClipsValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonOriginalClipsKey, jobs_ocSkeletonOriginalClipsValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonOriginalCornerRadiusValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonOriginalCornerRadiusKey);
}

-(void)setJobs_ocSkeletonOriginalCornerRadiusValue:(NSNumber *)jobs_ocSkeletonOriginalCornerRadiusValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonOriginalCornerRadiusKey, jobs_ocSkeletonOriginalCornerRadiusValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonCornerRadiusValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonCornerRadiusKey);
}

-(void)setJobs_ocSkeletonCornerRadiusValue:(NSNumber *)jobs_ocSkeletonCornerRadiusValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonCornerRadiusKey, jobs_ocSkeletonCornerRadiusValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonLineCornerRadiusValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonLineCornerRadiusKey);
}

-(void)setJobs_ocSkeletonLineCornerRadiusValue:(NSNumber *)jobs_ocSkeletonLineCornerRadiusValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonLineCornerRadiusKey, jobs_ocSkeletonLineCornerRadiusValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonLastLineFillPercentValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonLastLineFillPercentKey);
}

-(void)setJobs_ocSkeletonLastLineFillPercentValue:(NSNumber *)jobs_ocSkeletonLastLineFillPercentValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonLastLineFillPercentKey, jobs_ocSkeletonLastLineFillPercentValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)jobs_ocSkeletonLastAnimationWidthValue{
    return objc_getAssociatedObject(self, &JobsOCSkeletonLastAnimationWidthKey);
}

-(void)setJobs_ocSkeletonLastAnimationWidthValue:(NSNumber *)jobs_ocSkeletonLastAnimationWidthValue{
    objc_setAssociatedObject(self, &JobsOCSkeletonLastAnimationWidthKey, jobs_ocSkeletonLastAnimationWidthValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UITableView (JobsOCSkeletonView)
-(JobsRetTableViewByVoidBlock _Nonnull)byHideSkeletonAndReload{
    @jobs_weakify(self)
    return ^__kindof UITableView *_Nullable() {
        @jobs_strongify(self)
        [self jobs_stopSkeleton];
        [self reloadData];
        return self;
    };
}

@end

@implementation UICollectionView (JobsOCSkeletonView)
-(JobsRetCollectionViewByVoidBlock _Nonnull)byHideSkeletonAndReload{
    @jobs_weakify(self)
    return ^__kindof UICollectionView *_Nullable() {
        @jobs_strongify(self)
        [self jobs_stopSkeleton];
        [self reloadData];
        return self;
    };
}

@end

@implementation UILabel (JobsOCSkeletonView)
-(JobsRetLabelByNSIntegerBlock _Nonnull)bySkeletonLinesCornerRadius{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.jobs_ocSkeletonLineCornerRadiusValue = @(MAX(data, 0));
        [self jobs_updateSkeletonLayout];
        return self;
    };
}

-(JobsRetLabelByNSIntegerBlock _Nonnull)bySkeletonLastLineFillPercent{
    @jobs_weakify(self)
    return ^__kindof UILabel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.jobs_ocSkeletonLastLineFillPercentValue = @(MIN(MAX(data, 0), 100));
        return self;
    };
}

@end
