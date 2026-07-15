//
//  JobsOCRefreshComponent.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshComponent.h"

@interface NSObject (JobsImageAccessor)

@property(nonatomic, strong, readonly, nullable) UIImage *img;

@end

@interface JobsOCRefreshComponent ()

Prop_assign(readwrite) JobsOCRefreshState state;
Prop_strong() UIActivityIndicatorView *indicatorView;
Prop_strong() UIImageView *imageView;
Prop_strong() UILabel *statusLabel;
Prop_strong() UILabel *timePrefixLabel;
Prop_strong() UILabel *timeLabel;
Prop_strong(nullable) NSDate *lastRefreshedAt;
Prop_strong(nullable) NSArray<UIImage *> *frameImages;
Prop_assign() NSUInteger frameImageIndex;
#if defined(Lottie_h)
Prop_strong(nullable) LOTAnimationView *lottieView;
Prop_copy(nullable) NSString *currentLottieName;
#endif
#if defined(JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076)
Prop_strong(nullable) JobsTimer *frameTimer;
#endif

@end

@implementation JobsOCRefreshComponent
- (void)dealloc {
    [self stopFrameTimer];
    [self stopLottie];
}

- (instancetype)initWithPosition:(JobsOCRefreshPosition)position
                            role:(JobsOCRefreshRole)role
                          config:(JobsOCRefreshConfig *)config {
    if (self = [super initWithFrame:CGRectZero]) {
        _position = position;
        _role = role;
        _config = config;
        _state = JobsOCRefreshStateIdle;
        self.byBgColor(UIColor.clearColor)
            .byUserInteractionEnabled(NO);
        self.indicatorView.addOn(self);
        self.imageView.addOn(self);
        self.statusLabel.addOn(self);
        self.timePrefixLabel.addOn(self);
        self.timeLabel.addOn(self);
        [self applyState:JobsOCRefreshStateIdle progress:0];
    };return self;
}

- (CGFloat)refreshLength {
    return self.config.viewLength > 0 ? self.config.viewLength : 60;
}

- (void)markRefreshedAt:(NSDate *)date {
    self.lastRefreshedAt = date;
}

- (void)applyState:(JobsOCRefreshState)state progress:(CGFloat)progress {
    self.state = state;
    self.timePrefixLabel.byHidden(YES);
    self.timeLabel.byHidden(YES);
    switch (state) {
        case JobsOCRefreshStateIdle:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:self.config.idleText]);
            break;
        case JobsOCRefreshStatePulling:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:[NSString stringWithFormat:@"%@ %.0f%%",
                                                       self.config.pullingText,
                                                       MIN(1, MAX(0, progress)) * 100]]);
            break;
        case JobsOCRefreshStateReady:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:[self.config readyTextForRole:self.role]]);
            break;
        case JobsOCRefreshStateRefreshing:
            [self startVisualAnimating];
            self.statusLabel.byText([self displayText:[self.config refreshingTextForRole:self.role]]);
            [self updateTimeIfNeeded];
            break;
        case JobsOCRefreshStateEnding:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:[self.config refreshingTextForRole:self.role]]);
            break;
        case JobsOCRefreshStateFailed:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:self.config.failedText]);
            break;
        case JobsOCRefreshStateDisabled:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:self.config.disabledText]);
            break;
        case JobsOCRefreshStateNoMoreData:
            [self stopVisualAnimating];
            self.statusLabel.byText([self displayText:self.config.noMoreDataText]);
            break;
        case JobsOCRefreshStateRemoved:
            [self stopVisualAnimating];
            self.statusLabel.byText(nil);
            self.timePrefixLabel.byText(nil);
            self.timeLabel.byText(nil);
            break;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat iconSide = 20;
    CGFloat spacing = 8;
    BOOL horizontal = JobsOCRefreshPositionIsHorizontal(self.position);
    CGFloat boundsW = CGRectGetWidth(self.bounds);
    CGFloat boundsH = CGRectGetHeight(self.bounds);
    if (horizontal) {
        BOOL visualVisible = self.indicatorView.isAnimating || !self.imageView.hidden;
#if defined(Lottie_h)
        visualVisible = visualVisible || (self.lottieView && !self.lottieView.hidden);
#endif
        BOOL showsTime = !self.timeLabel.hidden && self.timeLabel.text.length;
        CGSize statusSize = [self.statusLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)];
        CGSize prefixSize = showsTime ? [self.timePrefixLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)] : CGSizeZero;
        CGSize timeSize = showsTime ? [self.timeLabel sizeThatFits:CGSizeMake(boundsW, CGFLOAT_MAX)] : CGSizeZero;
        CGFloat statusColumnW = MIN(boundsW, MAX(iconSide, ceil(statusSize.width)));
        CGFloat prefixColumnW = showsTime ? MAX(0, ceil(prefixSize.width)) : 0;
        CGFloat timeColumnW = showsTime ? MAX(0, ceil(timeSize.width)) : 0;
        CGFloat textGap = 0;
        if (showsTime && statusColumnW + textGap + prefixColumnW + textGap + timeColumnW > boundsW) {
            timeColumnW = MAX(0, boundsW - statusColumnW - textGap - prefixColumnW - textGap);
        }
        CGFloat totalW = statusColumnW + (showsTime ? textGap + prefixColumnW + textGap + timeColumnW : 0);
        CGFloat startX = MAX(0, (boundsW - totalW) * 0.5);
        CGFloat iconH = visualVisible ? iconSide : 0;
        CGFloat statusH = MIN(MAX(0, ceil(statusSize.height)), MAX(0, boundsH - iconH));
        CGFloat prefixH = showsTime ? MIN(MAX(0, ceil(prefixSize.height)), MAX(0, boundsH - iconH)) : 0;
        CGFloat timeH = showsTime ? MIN(MAX(0, ceil(timeSize.height)), MAX(0, boundsH - iconH)) : 0;
        CGFloat textH = MAX(statusH, MAX(prefixH, timeH));
        CGFloat stackH = iconH + textH;
        CGFloat startY = MAX(0, (boundsH - stackH) * 0.5);
        CGFloat statusY = startY + iconH;
        CGRect iconFrame = CGRectMake(startX + (statusColumnW - iconSide) * 0.5,
                                      startY,
                                      iconSide,
                                      iconSide);
        self.imageView.byFrame(iconFrame);
        self.indicatorView.byFrame(iconFrame);
#if defined(Lottie_h)
        if (self.lottieView) self.lottieView.byFrame(iconFrame);
#endif
        self.statusLabel.byFrame(CGRectMake(startX,
                                            statusY,
                                            statusColumnW,
                                            statusH));
        self.timePrefixLabel.byFrame(CGRectMake(CGRectGetMaxX(self.statusLabel.frame) + textGap,
                                                statusY,
                                                prefixColumnW,
                                                prefixH));
        self.timeLabel.byFrame(CGRectMake(CGRectGetMaxX(self.timePrefixLabel.frame) + textGap,
                                          statusY,
                                          timeColumnW,
                                          timeH));
    } else {
        self.timePrefixLabel.byFrame(CGRectZero);
        BOOL showsTime = !self.timeLabel.hidden && self.timeLabel.text.length;
        CGFloat textMaxW = MAX(0, boundsW - iconSide - spacing - 24);
        CGSize statusSize = [self.statusLabel sizeThatFits:CGSizeMake(textMaxW, CGFLOAT_MAX)];
        CGSize timeSize = showsTime ? [self.timeLabel sizeThatFits:CGSizeMake(textMaxW, CGFLOAT_MAX)] : CGSizeZero;
        CGFloat textW = MIN(textMaxW, MAX(ceil(statusSize.width), ceil(timeSize.width)));
        CGFloat statusH = ceil(statusSize.height);
        CGFloat timeH = showsTime ? ceil(timeSize.height) : 0;
        CGFloat textH = statusH + timeH;
        CGFloat totalW = iconSide + spacing + textW;
        CGFloat startX = (boundsW - totalW) * 0.5;
        CGFloat centerY = boundsH * 0.5;
        CGFloat textY = centerY - textH * 0.5;
        self.imageView.byFrame(CGRectMake(startX, centerY - iconSide * 0.5, iconSide, iconSide));
        self.indicatorView.byFrame(self.imageView.frame);
#if defined(Lottie_h)
        if (self.lottieView) self.lottieView.byFrame(self.imageView.frame);
#endif
        self.statusLabel.byFrame(CGRectMake(CGRectGetMaxX(self.imageView.frame) + spacing,
                                            textY,
                                            textW,
                                            statusH));
        self.timeLabel.byFrame(CGRectMake(CGRectGetMinX(self.statusLabel.frame),
                                          CGRectGetMaxY(self.statusLabel.frame),
                                          textW,
                                          timeH));
    }
}

- (void)startVisualAnimating {
    [self stopFrameTimer];
    self.imageView.byHidden(YES);
    [self.imageView stopAnimating];
    switch (self.config.animationType) {
        case JobsOCRefreshAnimationTypeSystem:
            self.indicatorView.byStartAnimating();
            break;
        case JobsOCRefreshAnimationTypeLottie:
            if ([self applyLottie]) {
                self.indicatorView.byStopAnimating();
            } else {
                self.indicatorView.byStartAnimating();
            }
            break;
        case JobsOCRefreshAnimationTypeGIF:
            if ([self applyGIF]) {
                self.indicatorView.byStopAnimating();
            } else {
                self.indicatorView.byStartAnimating();
            }
            break;
        case JobsOCRefreshAnimationTypeFrameImages:
            if ([self applyFrameImages]) {
                self.indicatorView.byStopAnimating();
            } else {
                self.indicatorView.byStartAnimating();
            }
            break;
        case JobsOCRefreshAnimationTypeNetworkImage:
            if ([self applyNetworkImage]) {
                self.indicatorView.byStopAnimating();
            } else {
                self.indicatorView.byStartAnimating();
            }
            break;
    }
}

- (void)stopVisualAnimating {
    self.indicatorView.byStopAnimating();
    [self.imageView stopAnimating];
    self.imageView.byHidden(YES);
    [self stopFrameTimer];
    [self stopLottie];
}

- (BOOL)applyFrameImages {
#if !defined(JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076)
    return NO;
#else
    NSMutableArray<UIImage *> *images = NSMutableArray.array;
    for (NSString *name in self.config.frameImageNames) {
        UIImage *image = name.img;
        if (image) [images addObject:image];
    }
    if (!images.count) return NO;
    self.frameImages = images.copy;
    self.frameImageIndex = 0;
    self.imageView
        .byImage(images.firstObject)
        .byHidden(NO);
    if (images.count > 1) {
        @jobs_weakify(self)
        NSTimeInterval interval = MAX(0.02, self.config.frameImageInterval);
        self.frameTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeGCD)
            .byTimeInterval(interval)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                if (!self.frameImages.count) return;
                self.frameImageIndex = (self.frameImageIndex + 1) % self.frameImages.count;
                self.imageView.byImage(self.frameImages[self.frameImageIndex]);
            });
        });
        [self.frameTimer start];
    };return YES;
#endif
}

- (BOOL)applyGIF {
    if (!self.config.gifName.length) return NO;
    UIImage *image = [self animatedGIFNamed:self.config.gifName];
    if (!image) return NO;
    self.imageView
        .byImage(image)
        .byHidden(NO);
    [self.imageView startAnimating];
    return YES;
}

- (BOOL)applyLottie {
#if !defined(Lottie_h)
    return NO;
#else
    if (!self.config.lottieName.length) return NO;
    if (!self.lottieView || ![self.currentLottieName isEqualToString:self.config.lottieName]) {
        if (self.lottieView) self.lottieView.byRemove();
        self.lottieView = [self buildLottieViewWithName:self.config.lottieName];
        self.currentLottieName = self.config.lottieName;
        if (!self.lottieView) return NO;
        [self insertSubview:self.lottieView aboveSubview:self.imageView];
        [self setNeedsLayout];
    }
    self.lottieView.byHidden(NO);
    self.lottieView.animationProgress = 0;
    [self.lottieView play];
    return YES;
#endif
}

- (BOOL)applyNetworkImage {
    if (!self.config.networkImageURLString.length) return NO;
    NSURL *url = [NSURL URLWithString:self.config.networkImageURLString];
    if (!url) return NO;
    self.imageView.byHidden(NO);
    SEL selector = NSSelectorFromString(@"sd_setImageWithURL:");
    if (![self.imageView respondsToSelector:selector]) return NO;
    ((void (*)(id, SEL, NSURL *))objc_msgSend)(self.imageView, selector, url);
    return YES;
}

- (UIImage *)animatedGIFNamed:(NSString *)name {
    NSString *resourceName = [name stringByReplacingOccurrencesOfString:@".gif" withString:@""];
    NSURL *url = [NSBundle.mainBundle URLForResource:resourceName withExtension:@"gif"];
    NSData *data = url ? [NSData dataWithContentsOfURL:url] : nil;
    if (!data) return nil;
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, nil);
    if (!source) return nil;
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray<UIImage *> *images = NSMutableArray.array;
    NSTimeInterval duration = 0;
    for (size_t index = 0; index < count; index++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, index, nil);
        if (!imageRef) continue;
        duration += [self gifDelayAtIndex:index source:source];
        [images addObject:[UIImage imageWithCGImage:imageRef scale:UIScreen.mainScreen.scale orientation:UIImageOrientationUp]];
        CGImageRelease(imageRef);
    }
    CFRelease(source);
    if (!images.count) return nil;
    return [UIImage animatedImageWithImages:images duration:MAX(duration, images.count * 0.08)];
}

- (NSTimeInterval)gifDelayAtIndex:(size_t)index source:(CGImageSourceRef)source {
    NSDictionary *properties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *gif = properties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *delay = gif[(NSString *)kCGImagePropertyGIFUnclampedDelayTime] ?: gif[(NSString *)kCGImagePropertyGIFDelayTime];
    NSTimeInterval value = delay ? delay.doubleValue : 0.08;
    return MAX(0.02, value);
}

- (void)stopFrameTimer {
#if defined(JOBS_HEADER_GUARD_JOBSTIMER_BCB1BF4076)
    [self.frameTimer stop];
    self.frameTimer = nil;
#endif
    self.frameImages = nil;
    self.frameImageIndex = 0;
}

#if defined(Lottie_h)
- (LOTAnimationView *)buildLottieViewWithName:(NSString *)name {
    NSString *filePath = [NSFileManager.defaultManager fileExistsAtPath:name] ? name : nil;
    if (!filePath.length) {
        NSString *resourceName = [name stringByDeletingPathExtension];
        filePath = [NSBundle.mainBundle pathForResource:resourceName ofType:@"json"];
    }
    LOTAnimationView *view = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:[name stringByDeletingPathExtension]];
    view.loopAnimation = YES;
    view.byContentMode(UIViewContentModeScaleAspectFit)
        .byUserInteractionEnabled(NO)
        .byHidden(YES);
    return view;
}
#endif

- (void)stopLottie {
#if defined(Lottie_h)
    [self.lottieView stop];
    if (self.lottieView) self.lottieView.byHidden(YES);
#endif
}

- (void)updateTimeIfNeeded {
    if (self.role != JobsOCRefreshRoleRefresh || !self.lastRefreshedAt) return;
    BOOL horizontal = JobsOCRefreshPositionIsHorizontal(self.position);
    NSDateFormatter *formatter = NSDateFormatter.byDateFormatterWithDateFormat(horizontal ? @"HH:mm:ss" : @"HH:mm");
    NSString *timeText = [formatter stringFromDate:self.lastRefreshedAt];
    NSString *displayText = [NSString stringWithFormat:@"%@%@",
                             self.config.lastRefreshPrefix,
                             timeText];
    self.timePrefixLabel
        .byText(horizontal ? [self displayText:[self textByRemovingTrailingColon:self.config.lastRefreshPrefix]] : nil)
        .byHidden(!horizontal);
    self.timeLabel
        .byText(horizontal ? [self horizontalTimeText:timeText] : [self displayText:displayText])
        .byHidden(NO);
}

- (NSString *)horizontalTimeText:(NSString *)timeText {
    NSMutableArray<NSString *> *rows = NSMutableArray.array;
    NSArray<NSString *> *timeParts = [timeText componentsSeparatedByString:@":"];
    for (NSUInteger index = 0; index < timeParts.count; index++) {
        NSString *part = timeParts[index];
        if (part.length) [rows addObject:part];
        if (index + 1 < timeParts.count) [rows addObject:@".."];
    };return [rows componentsJoinedByString:@"\n"];
}

- (NSString *)textByRemovingTrailingColon:(NSString *)text {
    NSString *value = text ?: @"";
    NSCharacterSet *blankSet = NSCharacterSet.whitespaceAndNewlineCharacterSet;
    while (value.length) {
        unichar character = [value characterAtIndex:value.length - 1];
        if (character == ':' || character == 0xFF1A || [blankSet characterIsMember:character]) {
            value = [value substringToIndex:value.length - 1];
        } else {
            break;
        }
    };return value;
}

- (NSArray<NSString *> *)horizontalRowsFromText:(NSString *)text {
    NSMutableArray<NSString *> *rows = NSMutableArray.array;
    for (NSUInteger index = 0; index < text.length; index++) {
        [rows addObject:[text substringWithRange:NSMakeRange(index, 1)]];
    };return rows.copy;
}

- (NSString *)displayText:(NSString *)text {
    if (!JobsOCRefreshPositionIsHorizontal(self.position)) return text;
    if (!text.length) return text;
    return [[self horizontalRowsFromText:text] componentsJoinedByString:@"\n"];
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        UIActivityIndicatorViewStyle style = UIActivityIndicatorViewStyleGray;
        if (@available(iOS 13.0, *)) {
            style = UIActivityIndicatorViewStyleMedium;
        }
        _indicatorView = UIActivityIndicatorView.byActivityIndicatorViewWithStyle(style)
            .byHidesWhenStopped(YES);
    };return _indicatorView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byHidden(YES);
        });
    };return _imageView;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        UIColor *textColor = UIColor.grayColor;
        if (@available(iOS 13.0, *)) {
            textColor = UIColor.secondaryLabelColor;
        }
        _statusLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(textColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0);
        });
    };return _statusLabel;
}

- (UILabel *)timePrefixLabel {
    if (!_timePrefixLabel) {
        _timePrefixLabel = [self buildTimeInfoLabel];
    };return _timePrefixLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [self buildTimeInfoLabel];
    };return _timeLabel;
}

- (UILabel *)buildTimeInfoLabel {
    UIColor *textColor = UIColor.lightGrayColor;
    if (@available(iOS 13.0, *)) {
        textColor = UIColor.secondaryLabelColor;
    };return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byFont(UIFontSystemFontOfSize(12))
            .byTextCor(textColor)
            .byTextAlignment(NSTextAlignmentCenter)
            .byNumberOfLines(0)
            .byHidden(YES);
    });
}

@end
