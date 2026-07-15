//
//  JobsProgressBar.m
//  JobsProgressBar
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsProgressBar.h"

@interface JobsProgressBar ()

Prop_strong()UIView *trackView;
Prop_strong()UIView *fillView;
Prop_strong()UIImageView *thumbImageView;
Prop_strong()UILabel *progressLabel;
Prop_strong()UIPanGestureRecognizer *panGesture;
Prop_strong()CADisplayLink *autoDisplayLink;
Prop_assign()CGFloat autoStep;
Prop_assign()NSTimeInterval autoInterval;
Prop_assign()NSTimeInterval autoLastTick;
Prop_assign()BOOL autoAnimated;
Prop_assign()BOOL userDragging;

@end

@implementation JobsProgressBar
#pragma mark —— Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self jobs_progressBarSetup];
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self jobs_progressBarSetup];
    };return self;
}

- (void)dealloc {
    [self stopAutoProgress];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self jobs_layoutForCurrentState];
}

#pragma mark —— Public

- (void)setProgress:(CGFloat)progress {
    [self jobs_setProgress:progress animated:NO duration:0 notify:YES external:YES];
}

- (void)setProgress:(CGFloat)progress
          animated:(BOOL)animated
          duration:(NSTimeInterval)duration {
    [self jobs_setProgress:progress animated:animated duration:duration notify:YES external:YES];
}

- (CGFloat)setDisplayPercent:(CGFloat)percent
                   animated:(BOOL)animated
                   duration:(NSTimeInterval)duration {
    CGFloat displayProgress = [self jobs_clamp:percent / 100.0];
    CGFloat rawProgress = self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - displayProgress : displayProgress;
    [self jobs_setProgress:rawProgress animated:animated duration:duration notify:YES external:YES];
    return rawProgress;
}

- (instancetype)startAutoProgressFromZero:(BOOL)fromZero
                                    step:(CGFloat)step
                                interval:(NSTimeInterval)interval
                                animated:(BOOL)animated {
    [self stopAutoProgress];
    self.autoStep = fabs(step) <= 0 ? 0.01 : fabs(step);
    self.autoInterval = MAX(interval, 1.0 / 60.0);
    self.autoAnimated = animated;
    self.autoLastTick = 0;
    if (fromZero) [self jobs_setProgress:0 animated:NO duration:0 notify:YES external:NO];
    self.autoDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(jobs_autoProgressTick:)];
    [self.autoDisplayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
    return self;
}

- (instancetype)stopAutoProgress {
    [self.autoDisplayLink invalidate];
    self.autoDisplayLink = nil;
    self.autoLastTick = 0;
    [self jobs_setThumbDragging:NO animated:YES];
    return self;
}

#pragma mark —— Private

- (void)jobs_progressBarSetup {
    self.backgroundColor = UIColor.clearColor;
    self.clipsToBounds = NO;
    UIColor *defaultGreen = [UIColor colorWithRed:0.0 green:0.78 blue:0.32 alpha:1.0];
    self.direction = JobsProgressBarDirectionLeftToRight;
    self.valueMode = JobsProgressBarValueModeCountUp;
    self.autoStopOnExternalChange = YES;
    self.progress = 0;
    self.trackTintColor = [UIColor colorWithWhite:0.86 alpha:1.0];
    self.progressTintColor = defaultGreen;
    self.trackThickness = 12;
    self.trackHorizontalInset = 0;
    self.trackVerticalInset = 0;
    self.progressLabelPlacement = JobsProgressBarLabelPlacementTop;
    self.progressLabelSpacing = 6;
    self.autoHideLabel = NO;
    self.labelMinVisibleHeight = 18;
    self.thumbSize = CGSizeMake(24, 24);
    self.thumbOffset = UIOffsetZero;
    self.thumbContentMode = UIViewContentModeScaleAspectFit;
    self.thumbCornerRadius = 12;
    self.thumbFollowsFillStyle = NO;
    self.thumbBackgroundColor = UIColor.whiteColor;
    self.thumbBorderColor = defaultGreen;
    self.thumbBorderWidth = 2;
    self.thumbShadowOpacity = 0.18;
    self.thumbShadowRadius = 5;
    self.thumbShadowOffset = CGSizeMake(0, 2);
    self.thumbShadowColor = UIColor.blackColor;
    self.draggable = NO;
    self.dragThumbScales = YES;
    self.dragThumbScale = 1.14;
    [self addSubview:self.trackView];
    [self.trackView addSubview:self.fillView];
    [self addSubview:self.thumbImageView];
    [self addSubview:self.progressLabel];
    [self addGestureRecognizer:self.panGesture];
    [self jobs_applyThumbStyle];
}

- (CGFloat)jobs_clamp:(CGFloat)value {
    return MIN(MAX(value, 0), 1);
}

- (CGFloat)jobs_displayProgress {
    CGFloat raw = [self jobs_clamp:self.progress];
    return self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - raw : raw;
}

- (BOOL)jobs_isVertical {
    return self.direction == JobsProgressBarDirectionTopToBottom || self.direction == JobsProgressBarDirectionBottomToTop;
}

- (CGRect)jobs_trackFrame {
    CGRect bounds = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(self.trackVerticalInset,
                                                                       self.trackHorizontalInset,
                                                                       self.trackVerticalInset,
                                                                       self.trackHorizontalInset));
    CGFloat labelSpace = self.progressLabelPlacement == JobsProgressBarLabelPlacementHidden ? 0 : self.labelMinVisibleHeight + self.progressLabelSpacing;
    if ([self jobs_isVertical]) {
        if (self.progressLabelPlacement == JobsProgressBarLabelPlacementTop) bounds.origin.y += labelSpace;
        bounds.size.height = MAX(0, bounds.size.height - labelSpace);
        CGFloat width = self.trackThickness > 0 ? MIN(self.trackThickness, bounds.size.width) : bounds.size.width;
        CGFloat x = CGRectGetMidX(bounds) - width / 2.0;
        return CGRectIntegral(CGRectMake(x, bounds.origin.y, width, bounds.size.height));
    }
    if (self.progressLabelPlacement == JobsProgressBarLabelPlacementTop) bounds.origin.y += labelSpace;
    bounds.size.height = MAX(0, bounds.size.height - labelSpace);
    CGFloat height = self.trackThickness > 0 ? MIN(self.trackThickness, bounds.size.height) : bounds.size.height;
    CGFloat y = CGRectGetMidY(bounds) - height / 2.0;
    return CGRectIntegral(CGRectMake(bounds.origin.x, y, bounds.size.width, height));
}

- (CGRect)jobs_fillFrameInTrackFrame:(CGRect)trackFrame {
    CGFloat displayProgress = [self jobs_displayProgress];
    CGRect fillFrame = trackFrame;
    switch (self.direction) {
        case JobsProgressBarDirectionLeftToRight:
            fillFrame.size.width = CGRectGetWidth(trackFrame) * displayProgress;
            break;
        case JobsProgressBarDirectionRightToLeft:
            fillFrame.size.width = CGRectGetWidth(trackFrame) * displayProgress;
            fillFrame.origin.x = CGRectGetMaxX(trackFrame) - CGRectGetWidth(fillFrame);
            break;
        case JobsProgressBarDirectionTopToBottom:
            fillFrame.size.height = CGRectGetHeight(trackFrame) * displayProgress;
            break;
        case JobsProgressBarDirectionBottomToTop:
            fillFrame.size.height = CGRectGetHeight(trackFrame) * displayProgress;
            fillFrame.origin.y = CGRectGetMaxY(trackFrame) - CGRectGetHeight(fillFrame);
            break;
    };return CGRectIntegral(fillFrame);
}

- (CGPoint)jobs_thumbCenterWithTrackFrame:(CGRect)trackFrame fillFrame:(CGRect)fillFrame {
    CGPoint center = CGPointZero;
    switch (self.direction) {
        case JobsProgressBarDirectionLeftToRight:
            center = CGPointMake(CGRectGetMaxX(fillFrame), CGRectGetMidY(trackFrame));
            break;
        case JobsProgressBarDirectionRightToLeft:
            center = CGPointMake(CGRectGetMinX(fillFrame), CGRectGetMidY(trackFrame));
            break;
        case JobsProgressBarDirectionTopToBottom:
            center = CGPointMake(CGRectGetMidX(trackFrame), CGRectGetMaxY(fillFrame));
            break;
        case JobsProgressBarDirectionBottomToTop:
            center = CGPointMake(CGRectGetMidX(trackFrame), CGRectGetMinY(fillFrame));
            break;
    }
    center.x += self.thumbOffset.horizontal;
    center.y += self.thumbOffset.vertical;
    return center;
}

- (void)jobs_layoutForCurrentState {
    CGRect trackFrame = [self jobs_trackFrame];
    CGRect fillFrame = [self jobs_fillFrameInTrackFrame:trackFrame];
    self.trackView.frame = trackFrame;
    self.trackView.layer.cornerRadius = MIN(CGRectGetWidth(trackFrame), CGRectGetHeight(trackFrame)) / 2.0;
    self.fillView.frame = CGRectMake(fillFrame.origin.x - trackFrame.origin.x,
                                     fillFrame.origin.y - trackFrame.origin.y,
                                     fillFrame.size.width,
                                     fillFrame.size.height);
    self.fillView.layer.cornerRadius = self.trackView.layer.cornerRadius;
    [self jobs_layoutLabelWithTrackFrame:trackFrame];
    [self jobs_layoutThumbWithTrackFrame:trackFrame fillFrame:fillFrame];
}

- (void)jobs_layoutLabelWithTrackFrame:(CGRect)trackFrame {
    BOOL hidden = self.progressLabelPlacement == JobsProgressBarLabelPlacementHidden || (self.autoHideLabel && CGRectGetHeight(self.bounds) < self.labelMinVisibleHeight);
    self.progressLabel.hidden = hidden;
    if (hidden) return;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",[self jobs_displayProgress] * 100.0];
    CGFloat height = MAX(self.labelMinVisibleHeight, 1);
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat y = 0;
    if (self.progressLabelPlacement == JobsProgressBarLabelPlacementBottom) {
        y = CGRectGetMaxY(trackFrame) + self.progressLabelSpacing;
    }
    self.progressLabel.frame = CGRectIntegral(CGRectMake(0, y, width, height));
}

- (void)jobs_layoutThumbWithTrackFrame:(CGRect)trackFrame fillFrame:(CGRect)fillFrame {
    BOOL showThumb = !CGSizeEqualToSize(self.thumbSize, CGSizeZero) && (self.thumbImage || self.thumbBackgroundColor || self.thumbBorderColor || self.thumbBorderWidth > 0);
    self.thumbImageView.hidden = !showThumb;
    if (!showThumb) return;
    self.thumbImageView.bounds = CGRectMake(0, 0, self.thumbSize.width, self.thumbSize.height);
    self.thumbImageView.center = [self jobs_thumbCenterWithTrackFrame:trackFrame fillFrame:fillFrame];
    [self jobs_applyThumbStyle];
}

- (void)jobs_applyThumbStyle {
    self.trackView.backgroundColor = self.trackTintColor;
    self.fillView.backgroundColor = self.progressTintColor;
    self.thumbImageView.image = self.thumbImage;
    self.thumbImageView.contentMode = self.thumbContentMode;
    self.thumbImageView.backgroundColor = self.thumbFollowsFillStyle ? self.progressTintColor : self.thumbBackgroundColor;
    self.thumbImageView.layer.cornerRadius = self.thumbCornerRadius;
    self.thumbImageView.layer.borderColor = self.thumbBorderColor.CGColor;
    self.thumbImageView.layer.borderWidth = self.thumbBorderWidth;
    self.thumbImageView.layer.shadowOpacity = self.thumbShadowOpacity;
    self.thumbImageView.layer.shadowRadius = self.thumbShadowRadius;
    self.thumbImageView.layer.shadowOffset = self.thumbShadowOffset;
    self.thumbImageView.layer.shadowColor = self.thumbShadowColor.CGColor;
    self.thumbImageView.clipsToBounds = self.thumbShadowOpacity <= 0;
    self.progressLabel.textColor = self.progressTintColor;
}

- (void)jobs_setProgress:(CGFloat)progress
                animated:(BOOL)animated
                duration:(NSTimeInterval)duration
                  notify:(BOOL)notify
                external:(BOOL)external {
    if (external && self.autoStopOnExternalChange && self.autoDisplayLink) [self stopAutoProgress];
    CGFloat newProgress = [self jobs_clamp:progress];
    BOOL changed = fabs(self.progress - newProgress) > DBL_EPSILON;
    _progress = newProgress;
    void (^layoutBlock)(void) = ^{
        [self jobs_layoutForCurrentState];
    };
    if (animated && duration > 0) {
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:layoutBlock completion:nil];
    } else {
        layoutBlock();
    }
    if (notify && changed && self.onProgressChanged) self.onProgressChanged(self.progress);
}

- (CGFloat)jobs_progressForPoint:(CGPoint)point trackFrame:(CGRect)trackFrame {
    if (CGRectGetWidth(trackFrame) <= 0 || CGRectGetHeight(trackFrame) <= 0) return self.progress;
    CGFloat displayProgress = 0;
    switch (self.direction) {
        case JobsProgressBarDirectionLeftToRight:
            displayProgress = (point.x - CGRectGetMinX(trackFrame)) / CGRectGetWidth(trackFrame);
            break;
        case JobsProgressBarDirectionRightToLeft:
            displayProgress = (CGRectGetMaxX(trackFrame) - point.x) / CGRectGetWidth(trackFrame);
            break;
        case JobsProgressBarDirectionTopToBottom:
            displayProgress = (point.y - CGRectGetMinY(trackFrame)) / CGRectGetHeight(trackFrame);
            break;
        case JobsProgressBarDirectionBottomToTop:
            displayProgress = (CGRectGetMaxY(trackFrame) - point.y) / CGRectGetHeight(trackFrame);
            break;
    }
    displayProgress = [self jobs_clamp:displayProgress];
    return self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - displayProgress : displayProgress;
}

- (void)jobs_handlePan:(UIPanGestureRecognizer *)gesture {
    if (!self.isDraggable) return;
    CGPoint point = [gesture locationInView:self];
    CGFloat dragProgress = [self jobs_progressForPoint:point trackFrame:[self jobs_trackFrame]];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.userDragging = YES;
        [self stopAutoProgress];
        [self jobs_setThumbDragging:YES animated:YES];
        if (self.onDragBegan) self.onDragBegan(self.progress);
    }
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        [self jobs_setProgress:dragProgress animated:NO duration:0 notify:YES external:NO];
        if (self.onDragChanged) self.onDragChanged(self.progress);
    }
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateFailed) {
        self.userDragging = NO;
        [self jobs_setThumbDragging:NO animated:YES];
        if (self.onDragEnded) self.onDragEnded(self.progress);
    }
}

- (void)jobs_setThumbDragging:(BOOL)dragging animated:(BOOL)animated {
    if (!self.dragThumbScales) return;
    CGAffineTransform transform = dragging ? CGAffineTransformMakeScale(self.dragThumbScale, self.dragThumbScale) : CGAffineTransformIdentity;
    if (animated) {
        [UIView animateWithDuration:0.18 delay:0 usingSpringWithDamping:0.78 initialSpringVelocity:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.thumbImageView.transform = transform;
        } completion:nil];
    } else {
        self.thumbImageView.transform = transform;
    }
}

- (void)jobs_autoProgressTick:(CADisplayLink *)displayLink {
    if (self.userDragging) return;
    if (self.autoLastTick <= 0) {
        self.autoLastTick = displayLink.timestamp;
        return;
    }
    NSTimeInterval delta = displayLink.timestamp - self.autoLastTick;
    if (delta < self.autoInterval) return;
    self.autoLastTick = displayLink.timestamp;
    CGFloat nextProgress = self.progress + self.autoStep;
    BOOL finished = nextProgress >= 1.0;
    [self jobs_setProgress:MIN(nextProgress, 1.0) animated:self.autoAnimated duration:self.autoInterval * 0.85 notify:YES external:NO];
    if (finished) [self stopAutoProgress];
}

#pragma mark —— Lazy

- (UIView *)trackView {
    if (!_trackView) {
        _trackView = UIView.new;
        _trackView.clipsToBounds = YES;
    };return _trackView;
}

- (UIView *)fillView {
    if (!_fillView) {
        _fillView = UIView.new;
        _fillView.clipsToBounds = YES;
    };return _fillView;
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = UIImageView.new;
        _thumbImageView.userInteractionEnabled = NO;
    };return _thumbImageView;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = UILabel.new;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightSemibold];
    };return _progressLabel;
}

- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(jobs_handlePan:)];
    };return _panGesture;
}

#pragma mark —— DSL

- (JobsProgressBar * _Nonnull (^)(JobsProgressBarDirection))byDirection {
    return ^JobsProgressBar *(JobsProgressBarDirection data) {
        self.direction = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(JobsProgressBarValueMode))byValueMode {
    return ^JobsProgressBar *(JobsProgressBarValueMode data) {
        self.valueMode = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(BOOL))byAutoStopOnExternalChange {
    return ^JobsProgressBar *(BOOL data) {
        self.autoStopOnExternalChange = data;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byProgress {
    return ^JobsProgressBar *(CGFloat data) {
        [self setProgress:data animated:NO duration:0];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIColor *))byTrackTintColor {
    return ^JobsProgressBar *(UIColor *data) {
        self.trackTintColor = data ?: [UIColor colorWithWhite:0.86 alpha:1.0];
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIColor *))byProgressTintColor {
    return ^JobsProgressBar *(UIColor *data) {
        self.progressTintColor = data ?: [UIColor colorWithRed:0.0 green:0.78 blue:0.32 alpha:1.0];
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byTrackThickness {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackThickness = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byTrackHorizontalInset {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackHorizontalInset = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byTrackVerticalInset {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackVerticalInset = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(JobsProgressBarLabelPlacement))byProgressLabelPlacement {
    return ^JobsProgressBar *(JobsProgressBarLabelPlacement data) {
        self.progressLabelPlacement = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byProgressLabelSpacing {
    return ^JobsProgressBar *(CGFloat data) {
        self.progressLabelSpacing = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(BOOL))byAutoHideLabel {
    return ^JobsProgressBar *(BOOL data) {
        self.autoHideLabel = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byLabelMinVisibleHeight {
    return ^JobsProgressBar *(CGFloat data) {
        self.labelMinVisibleHeight = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIImage * _Nullable))byThumbImage {
    return ^JobsProgressBar *(UIImage * _Nullable data) {
        self.thumbImage = data;
        [self jobs_applyThumbStyle];
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGSize))byThumbSize {
    return ^JobsProgressBar *(CGSize data) {
        self.thumbSize = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIOffset))byThumbOffset {
    return ^JobsProgressBar *(UIOffset data) {
        self.thumbOffset = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIViewContentMode))byThumbContentMode {
    return ^JobsProgressBar *(UIViewContentMode data) {
        self.thumbContentMode = data;
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byThumbCornerRadius {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbCornerRadius = MAX(data, 0);
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(BOOL))byThumbFollowsFillStyle {
    return ^JobsProgressBar *(BOOL data) {
        self.thumbFollowsFillStyle = data;
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIColor * _Nullable))byThumbBackgroundColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbBackgroundColor = data;
        [self jobs_applyThumbStyle];
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIColor * _Nullable))byThumbBorderColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbBorderColor = data;
        [self jobs_applyThumbStyle];
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byThumbBorderWidth {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbBorderWidth = MAX(data, 0);
        [self jobs_applyThumbStyle];
        [self setNeedsLayout];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(float))byThumbShadowOpacity {
    return ^JobsProgressBar *(float data) {
        self.thumbShadowOpacity = MIN(MAX(data, 0), 1);
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byThumbShadowRadius {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbShadowRadius = MAX(data, 0);
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGSize))byThumbShadowOffset {
    return ^JobsProgressBar *(CGSize data) {
        self.thumbShadowOffset = data;
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(UIColor * _Nullable))byThumbShadowColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbShadowColor = data;
        [self jobs_applyThumbStyle];
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(BOOL))byDraggable {
    return ^JobsProgressBar *(BOOL data) {
        self.draggable = data;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(BOOL))byDragThumbScales {
    return ^JobsProgressBar *(BOOL data) {
        self.dragThumbScales = data;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(CGFloat))byDragThumbScale {
    return ^JobsProgressBar *(CGFloat data) {
        self.dragThumbScale = MAX(data, 1);
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(jobsByCGFloatBlock _Nullable))byOnProgressChanged {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onProgressChanged = block;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(jobsByCGFloatBlock _Nullable))byOnDragBegan {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragBegan = block;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(jobsByCGFloatBlock _Nullable))byOnDragChanged {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragChanged = block;
        return self;
    };
}

- (JobsProgressBar * _Nonnull (^)(jobsByCGFloatBlock _Nullable))byOnDragEnded {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragEnded = block;
        return self;
    };
}

@end
