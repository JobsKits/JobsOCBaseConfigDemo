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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsProgressBar
@interface JobsProgressBar (JobsPropertyDSLSetterAutogen_8c87c67db3)
-(void)setAutoAnimated:(BOOL)data;
-(void)setAutoDisplayLink:(CADisplayLink * _Nullable)data;
-(void)setAutoInterval:(NSTimeInterval)data;
-(void)setAutoLastTick:(NSTimeInterval)data;
-(void)setAutoStep:(CGFloat)data;
-(void)setUserDragging:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsProgressBar

@implementation JobsProgressBar
#pragma mark —— Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.jobs_progressBarSetup();
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.jobs_progressBarSetup();
    };return self;
}

- (void)dealloc {
    (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressBar.class, @selector(stopAutoProgress)))(self, @selector(stopAutoProgress)))();
}

- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressBar.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.jobs_layoutForCurrentState();
    };
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
    CGFloat displayProgress = self.jobs_clamp(percent / 100.0);
    CGFloat rawProgress = self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - displayProgress : displayProgress;
    [self jobs_setProgress:rawProgress animated:animated duration:duration notify:YES external:YES];
    return rawProgress;
}

- (instancetype)startAutoProgressFromZero:(BOOL)fromZero
                                    step:(CGFloat)step
                                interval:(NSTimeInterval)interval
                                animated:(BOOL)animated {
    self.stopAutoProgress();
    self.byAutoStep(fabs(step) <= 0 ? 0.01 : fabs(step));
    self.byAutoInterval(MAX(interval, 1.0 / 60.0));
    self.byAutoAnimated(animated);
    self.byAutoLastTick(0);
    if (fromZero) [self jobs_setProgress:0 animated:NO duration:0 notify:YES external:NO];
    self.byAutoDisplayLink([CADisplayLink displayLinkWithTarget:self selector:@selector(jobs_autoProgressTick:)]);
    [self.autoDisplayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
    return self;
}

- (JobsRetIDByVoidBlock _Nonnull)stopAutoProgress {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.autoDisplayLink.invalidate;
        self.byAutoDisplayLink(nil);
        self.byAutoLastTick(0);
        [self jobs_setThumbDragging:NO animated:YES];
        return self;
    };
}

#pragma mark —— Private

- (jobsByVoidBlock _Nonnull)jobs_progressBarSetup {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byBgColor(UIColor.clearColor);
        self.byClipsToBounds(NO);
        UIColor *defaultGreen = RGBA_COLOR(0.0 * 255.0, 0.78 * 255.0, 0.32 * 255.0, 1.0);
        self.byDirection(JobsProgressBarDirectionLeftToRight);
        self.byValueMode(JobsProgressBarValueModeCountUp);
        self.byAutoStopOnExternalChange(YES);
        self.byProgress(0);
        self.byTrackTintColor(RGBA_SAMECOLOR(0.86 * 255.0, 1.0));
        self.byProgressTintColor(defaultGreen);
        self.byTrackThickness(12);
        self.byTrackHorizontalInset(0);
        self.byTrackVerticalInset(0);
        self.byProgressLabelPlacement(JobsProgressBarLabelPlacementTop);
        self.byProgressLabelSpacing(6);
        self.byAutoHideLabel(NO);
        self.byLabelMinVisibleHeight(18);
        self.byThumbSize(CGSizeMake(24, 24));
        self.byThumbOffset(UIOffsetZero);
        self.byThumbContentMode(UIViewContentModeScaleAspectFit);
        self.byThumbCornerRadius(12);
        self.byThumbFollowsFillStyle(NO);
        self.byThumbBackgroundColor(UIColor.whiteColor);
        self.byThumbBorderColor(defaultGreen);
        self.byThumbBorderWidth(2);
        self.byThumbShadowOpacity(0.18);
        self.byThumbShadowRadius(5);
        self.byThumbShadowOffset(CGSizeMake(0, 2));
        self.byThumbShadowColor(UIColor.blackColor);
        self.byDraggable(NO);
        self.byDragThumbScales(YES);
        self.byDragThumbScale(1.14);
        self.trackView.addOn(self);
        self.fillView.addOn(self.trackView);
        self.thumbImageView.addOn(self);
        self.progressLabel.addOn(self);
        self.byAddGestureRecognizer(self.panGesture);
        self.jobs_applyThumbStyle();
    };
}

-(JobsRetCGFloatByCGFloatBlock _Nonnull)jobs_clamp{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat value){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MIN(MAX(value, 0), 1);
    };
}

- (JobsRetCGFloatByVoidBlock _Nonnull)jobs_displayProgress {
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGFloat raw = self.jobs_clamp(self.progress);
        return self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - raw : raw;
    };
}

- (JobsRetBOOLByVoidBlock _Nonnull)jobs_isVertical {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.direction == JobsProgressBarDirectionTopToBottom || self.direction == JobsProgressBarDirectionBottomToTop;
    };
}

- (JobsRetFrameByVoidBlock _Nonnull)jobs_trackFrame {
    @jobs_weakify(self)
    return ^CGRect{
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGRect bounds = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(self.trackVerticalInset,
                                                                           self.trackHorizontalInset,
                                                                           self.trackVerticalInset,
                                                                           self.trackHorizontalInset));
        CGFloat labelSpace = self.progressLabelPlacement == JobsProgressBarLabelPlacementHidden ? 0 : self.labelMinVisibleHeight + self.progressLabelSpacing;
        if ([self jobs_isVertical]()) {
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
    };
}

-(JobsRetCGRectByCGRectBlock _Nonnull)jobs_fillFrameInTrackFrame{
    @jobs_weakify(self)
    return ^CGRect(CGRect trackFrame){
        @jobs_strongify(self)
        if (!self) return (CGRect){0};
        CGFloat displayProgress = self.jobs_displayProgress();
        CGRect fillFrame = trackFrame;
        switch (self.direction) {
            /// 处理 JobsProgressBarDirectionLeftToRight 分支
            case JobsProgressBarDirectionLeftToRight:
                fillFrame.size.width = CGRectGetWidth(trackFrame) * displayProgress;
                break;
            /// 处理 JobsProgressBarDirectionRightToLeft 分支
            case JobsProgressBarDirectionRightToLeft:
                fillFrame.size.width = CGRectGetWidth(trackFrame) * displayProgress;
                fillFrame.origin.x = CGRectGetMaxX(trackFrame) - CGRectGetWidth(fillFrame);
                break;
            /// 处理 JobsProgressBarDirectionTopToBottom 分支
            case JobsProgressBarDirectionTopToBottom:
                fillFrame.size.height = CGRectGetHeight(trackFrame) * displayProgress;
                break;
            /// 处理 JobsProgressBarDirectionBottomToTop 分支
            case JobsProgressBarDirectionBottomToTop:
                fillFrame.size.height = CGRectGetHeight(trackFrame) * displayProgress;
                fillFrame.origin.y = CGRectGetMaxY(trackFrame) - CGRectGetHeight(fillFrame);
                break;
        };return CGRectIntegral(fillFrame);
    };
}

- (CGPoint)jobs_thumbCenterWithTrackFrame:(CGRect)trackFrame fillFrame:(CGRect)fillFrame {
    CGPoint center = CGPointZero;
    switch (self.direction) {
        /// 处理 JobsProgressBarDirectionLeftToRight 分支
        case JobsProgressBarDirectionLeftToRight:
            center = CGPointMake(CGRectGetMaxX(fillFrame), CGRectGetMidY(trackFrame));
            break;
        /// 处理 JobsProgressBarDirectionRightToLeft 分支
        case JobsProgressBarDirectionRightToLeft:
            center = CGPointMake(CGRectGetMinX(fillFrame), CGRectGetMidY(trackFrame));
            break;
        /// 处理 JobsProgressBarDirectionTopToBottom 分支
        case JobsProgressBarDirectionTopToBottom:
            center = CGPointMake(CGRectGetMidX(trackFrame), CGRectGetMaxY(fillFrame));
            break;
        /// 处理 JobsProgressBarDirectionBottomToTop 分支
        case JobsProgressBarDirectionBottomToTop:
            center = CGPointMake(CGRectGetMidX(trackFrame), CGRectGetMinY(fillFrame));
            break;
    }
    center.x += self.thumbOffset.horizontal;
    center.y += self.thumbOffset.vertical;
    return center;
}

- (jobsByVoidBlock _Nonnull)jobs_layoutForCurrentState {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGRect trackFrame = self.jobs_trackFrame();
        CGRect fillFrame = self.jobs_fillFrameInTrackFrame(trackFrame);
        self.trackView.byFrame(trackFrame);
        self.trackView.layer.byCornerRadius(MIN(CGRectGetWidth(trackFrame), CGRectGetHeight(trackFrame)) / 2.0);
        self.fillView.frame = CGRectMake(fillFrame.origin.x - trackFrame.origin.x,
                                         fillFrame.origin.y - trackFrame.origin.y,
                                         fillFrame.size.width,
                                         fillFrame.size.height);
        self.fillView.layer.byCornerRadius(self.trackView.layer.cornerRadius);
        self.jobs_layoutLabelWithTrackFrame(trackFrame);
        [self jobs_layoutThumbWithTrackFrame:trackFrame fillFrame:fillFrame];
    };
}

-(jobsByFrameBlock _Nonnull)jobs_layoutLabelWithTrackFrame{
    @jobs_weakify(self)
    return ^(CGRect trackFrame){
        @jobs_strongify(self)
        if (!self) return;
        BOOL hidden = self.progressLabelPlacement == JobsProgressBarLabelPlacementHidden || (self.autoHideLabel && CGRectGetHeight(self.bounds) < self.labelMinVisibleHeight);
        self.progressLabel.byHidden(hidden);
        if (hidden) return;
        self.progressLabel.byText([NSString stringWithFormat:@"%.0f%%", self.jobs_displayProgress() * 100.0]);
        CGFloat height = MAX(self.labelMinVisibleHeight, 1);
        CGFloat width = CGRectGetWidth(self.bounds);
        CGFloat y = 0;
        if (self.progressLabelPlacement == JobsProgressBarLabelPlacementBottom) {
            y = CGRectGetMaxY(trackFrame) + self.progressLabelSpacing;
        }
        self.progressLabel.byFrame(CGRectIntegral(CGRectMake(0, y, width, height)));
    };
}

- (void)jobs_layoutThumbWithTrackFrame:(CGRect)trackFrame fillFrame:(CGRect)fillFrame {
    BOOL showThumb = !CGSizeEqualToSize(self.thumbSize, CGSizeZero) && (self.thumbImage || self.thumbBackgroundColor || self.thumbBorderColor || self.thumbBorderWidth > 0);
    self.thumbImageView.byHidden(!showThumb);
    if (!showThumb) return;
    self.thumbImageView.byBounds(CGRectMake(0, 0, self.thumbSize.width, self.thumbSize.height));
    CGPoint thumbCenter = [self jobs_thumbCenterWithTrackFrame:trackFrame fillFrame:fillFrame];
    self.thumbImageView.byCenter(thumbCenter.x, thumbCenter.y);
    self.jobs_applyThumbStyle();
}

- (jobsByVoidBlock _Nonnull)jobs_applyThumbStyle {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.trackView.byBgColor(self.trackTintColor);
        self.fillView.byBgColor(self.progressTintColor);
        self.thumbImageView.byImage(self.thumbImage);
        self.thumbImageView.byContentMode(self.thumbContentMode);
        self.thumbImageView.byBgColor(self.thumbFollowsFillStyle ? self.progressTintColor : self.thumbBackgroundColor);
        self.thumbImageView.layer.byCornerRadius(self.thumbCornerRadius);
        self.thumbImageView.layer.byBorderColor(self.thumbBorderColor.CGColor);
        self.thumbImageView.layer.byBorderWidth(self.thumbBorderWidth);
        self.thumbImageView.layer.byShadowOpacity(self.thumbShadowOpacity);
        self.thumbImageView.layer.byShadowRadius(self.thumbShadowRadius);
        self.thumbImageView.layer.byShadowOffset(self.thumbShadowOffset);
        self.thumbImageView.layer.byShadowColor(self.thumbShadowColor.CGColor);
        self.thumbImageView.byClipsToBounds(self.thumbShadowOpacity <= 0);
        self.progressLabel.byTextCor(self.progressTintColor);
    };
}

- (void)jobs_setProgress:(CGFloat)progress
                animated:(BOOL)animated
                duration:(NSTimeInterval)duration
                  notify:(BOOL)notify
                external:(BOOL)external {
    if (external && self.autoStopOnExternalChange && self.autoDisplayLink) self.stopAutoProgress();
    CGFloat newProgress = self.jobs_clamp(progress);
    BOOL changed = fabs(self.progress - newProgress) > DBL_EPSILON;
    _progress = newProgress;
    void (^layoutBlock)(void) = ^{
        self.jobs_layoutForCurrentState();
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
        /// 处理 JobsProgressBarDirectionLeftToRight 分支
        case JobsProgressBarDirectionLeftToRight:
            displayProgress = (point.x - CGRectGetMinX(trackFrame)) / CGRectGetWidth(trackFrame);
            break;
        /// 处理 JobsProgressBarDirectionRightToLeft 分支
        case JobsProgressBarDirectionRightToLeft:
            displayProgress = (CGRectGetMaxX(trackFrame) - point.x) / CGRectGetWidth(trackFrame);
            break;
        /// 处理 JobsProgressBarDirectionTopToBottom 分支
        case JobsProgressBarDirectionTopToBottom:
            displayProgress = (point.y - CGRectGetMinY(trackFrame)) / CGRectGetHeight(trackFrame);
            break;
        /// 处理 JobsProgressBarDirectionBottomToTop 分支
        case JobsProgressBarDirectionBottomToTop:
            displayProgress = (CGRectGetMaxY(trackFrame) - point.y) / CGRectGetHeight(trackFrame);
            break;
    }
    displayProgress = self.jobs_clamp(displayProgress);
    return self.valueMode == JobsProgressBarValueModeCountDown ? 1.0 - displayProgress : displayProgress;
}

- (void)jobs_handlePan:(UIPanGestureRecognizer *)gesture {
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressBar.class, @selector(jobsJobs_handlePan)))(self, @selector(jobsJobs_handlePan));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsJobs_handlePan{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isDraggable) return;
        CGPoint point = [gesture locationInView:self];
        CGFloat dragProgress = [self jobs_progressForPoint:point trackFrame:self.jobs_trackFrame()];
        if (gesture.state == UIGestureRecognizerStateBegan) {
            self.byUserDragging(YES);
            self.stopAutoProgress();
            [self jobs_setThumbDragging:YES animated:YES];
            if (self.onDragBegan) self.onDragBegan(self.progress);
        }
        if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
            [self jobs_setProgress:dragProgress animated:NO duration:0 notify:YES external:NO];
            if (self.onDragChanged) self.onDragChanged(self.progress);
        }
        if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateFailed) {
            self.byUserDragging(NO);
            [self jobs_setThumbDragging:NO animated:YES];
            if (self.onDragEnded) self.onDragEnded(self.progress);
        }
    };
}

- (void)jobs_setThumbDragging:(BOOL)dragging animated:(BOOL)animated {
    if (!self.dragThumbScales) return;
    CGAffineTransform transform = dragging ? CGAffineTransformMakeScale(self.dragThumbScale, self.dragThumbScale) : CGAffineTransformIdentity;
    if (animated) {
        [UIView animateWithDuration:0.18 delay:0 usingSpringWithDamping:0.78 initialSpringVelocity:0.2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.thumbImageView.byTransform(transform);
        } completion:nil];
    } else {
        self.thumbImageView.byTransform(transform);
    }
}

- (void)jobs_autoProgressTick:(CADisplayLink *)displayLink {
    jobsByCADisplayLinkBlock action = ((jobsByCADisplayLinkBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsProgressBar.class, @selector(jobsJobs_autoProgressTick)))(self, @selector(jobsJobs_autoProgressTick));
    if (action) action(displayLink);
}

-(jobsByCADisplayLinkBlock _Nonnull)jobsJobs_autoProgressTick{
    @jobs_weakify(self)
    return ^(CADisplayLink * displayLink){
        @jobs_strongify(self)
        if (!self) return;
        if (self.userDragging) return;
        if (self.autoLastTick <= 0) {
            self.byAutoLastTick(displayLink.timestamp);
            return;
        }
        NSTimeInterval delta = displayLink.timestamp - self.autoLastTick;
        if (delta < self.autoInterval) return;
        self.byAutoLastTick(displayLink.timestamp);
        CGFloat nextProgress = self.progress + self.autoStep;
        BOOL finished = nextProgress >= 1.0;
        [self jobs_setProgress:MIN(nextProgress, 1.0) animated:self.autoAnimated duration:self.autoInterval * 0.85 notify:YES external:NO];
        if (finished) self.stopAutoProgress();
    };
}

#pragma mark —— Lazy

- (UIView *)trackView {
    if (!_trackView) {
        _trackView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byClipsToBounds(YES);
        });
    };return _trackView;
}

- (UIView *)fillView {
    if (!_fillView) {
        _fillView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byClipsToBounds(YES);
        });
    };return _fillView;
}

- (UIImageView *)thumbImageView {
    if (!_thumbImageView) {
        _thumbImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byUserInteractionEnabled(NO);
        });
    };return _thumbImageView;
}

- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byFont(UIFontWeightSemiboldSize(13))
                .byTextAlignment(NSTextAlignmentCenter);
        });
    };return _progressLabel;
}

- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [UIPanGestureRecognizer.alloc initWithTarget:self action:@selector(jobs_handlePan:)];
    };return _panGesture;
}

#pragma mark —— DSL

- (JobsRetJobsProgressBarByJobsProgressBarDirectionBlock _Nonnull)byDirection {
    return ^JobsProgressBar *(JobsProgressBarDirection data) {
        self.direction = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByJobsProgressBarValueModeBlock _Nonnull)byValueMode {
    return ^JobsProgressBar *(JobsProgressBarValueMode data) {
        self.valueMode = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoStopOnExternalChange {
    return ^JobsProgressBar *(BOOL data) {
        self.autoStopOnExternalChange = data;
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byProgress {
    return ^JobsProgressBar *(CGFloat data) {
        [self setProgress:data animated:NO duration:0];
        return self;
    };
}

- (JobsRetJobsProgressBarByUIColorBlock _Nonnull)byTrackTintColor {
    return ^JobsProgressBar *(UIColor *data) {
        self.trackTintColor = data ?: RGBA_SAMECOLOR(0.86 * 255.0, 1.0);
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByUIColorBlock _Nonnull)byProgressTintColor {
    return ^JobsProgressBar *(UIColor *data) {
        self.progressTintColor = data ?: RGBA_COLOR(0.0 * 255.0, 0.78 * 255.0, 0.32 * 255.0, 1.0);
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackThickness {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackThickness = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackHorizontalInset {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackHorizontalInset = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byTrackVerticalInset {
    return ^JobsProgressBar *(CGFloat data) {
        self.trackVerticalInset = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByJobsProgressBarLabelPlacementBlock _Nonnull)byProgressLabelPlacement {
    return ^JobsProgressBar *(JobsProgressBarLabelPlacement data) {
        self.progressLabelPlacement = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byProgressLabelSpacing {
    return ^JobsProgressBar *(CGFloat data) {
        self.progressLabelSpacing = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoHideLabel {
    return ^JobsProgressBar *(BOOL data) {
        self.autoHideLabel = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byLabelMinVisibleHeight {
    return ^JobsProgressBar *(CGFloat data) {
        self.labelMinVisibleHeight = MAX(data, 0);
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByUIImageBlock _Nonnull)byThumbImage {
    return ^JobsProgressBar *(UIImage * _Nullable data) {
        self.thumbImage = data;
        self.jobs_applyThumbStyle();
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGSizeBlock _Nonnull)byThumbSize {
    return ^JobsProgressBar *(CGSize data) {
        self.thumbSize = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByUIOffsetBlock _Nonnull)byThumbOffset {
    return ^JobsProgressBar *(UIOffset data) {
        self.thumbOffset = data;
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByUIViewContentModeBlock _Nonnull)byThumbContentMode {
    return ^JobsProgressBar *(UIViewContentMode data) {
        self.thumbContentMode = data;
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbCornerRadius {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbCornerRadius = MAX(data, 0);
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByBOOLBlock _Nonnull)byThumbFollowsFillStyle {
    return ^JobsProgressBar *(BOOL data) {
        self.thumbFollowsFillStyle = data;
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbBackgroundColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbBackgroundColor = data;
        self.jobs_applyThumbStyle();
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbBorderColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbBorderColor = data;
        self.jobs_applyThumbStyle();
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbBorderWidth {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbBorderWidth = MAX(data, 0);
        self.jobs_applyThumbStyle();
        [self setNeedsLayout];
        return self;
    };
}

- (JobsRetJobsProgressBarByfloatBlock _Nonnull)byThumbShadowOpacity {
    return ^JobsProgressBar *(float data) {
        self.thumbShadowOpacity = MIN(MAX(data, 0), 1);
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byThumbShadowRadius {
    return ^JobsProgressBar *(CGFloat data) {
        self.thumbShadowRadius = MAX(data, 0);
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByCGSizeBlock _Nonnull)byThumbShadowOffset {
    return ^JobsProgressBar *(CGSize data) {
        self.thumbShadowOffset = data;
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByUIColorBlock _Nonnull)byThumbShadowColor {
    return ^JobsProgressBar *(UIColor * _Nullable data) {
        self.thumbShadowColor = data;
        self.jobs_applyThumbStyle();
        return self;
    };
}

- (JobsRetJobsProgressBarByBOOLBlock _Nonnull)byDraggable {
    return ^JobsProgressBar *(BOOL data) {
        self.draggable = data;
        return self;
    };
}

- (JobsRetJobsProgressBarByBOOLBlock _Nonnull)byDragThumbScales {
    return ^JobsProgressBar *(BOOL data) {
        self.dragThumbScales = data;
        return self;
    };
}

- (JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byDragThumbScale {
    return ^JobsProgressBar *(CGFloat data) {
        self.dragThumbScale = MAX(data, 1);
        return self;
    };
}

- (JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnProgressChanged {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onProgressChanged = block;
        return self;
    };
}

- (JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragBegan {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragBegan = block;
        return self;
    };
}

- (JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragChanged {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragChanged = block;
        return self;
    };
}

- (JobsRetJobsProgressBarByjobsByCGFloatBlockBlock _Nonnull)byOnDragEnded {
    return ^JobsProgressBar *(jobsByCGFloatBlock _Nullable block) {
        self.onDragEnded = block;
        return self;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsProgressBar
-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byAutoAnimated{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setAutoAnimated:data];
        return self;
    };
}

-(JobsRetJobsProgressBarByBOOLBlock _Nonnull)byUserDragging{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setUserDragging:data];
        return self;
    };
}

-(JobsRetJobsProgressBarByCADisplayLinkBlock _Nonnull)byAutoDisplayLink{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(CADisplayLink * _Nullable data){
        @jobs_strongify(self)
        [self setAutoDisplayLink:data];
        return self;
    };
}

-(JobsRetJobsProgressBarByCGFloatBlock _Nonnull)byAutoStep{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setAutoStep:data];
        return self;
    };
}

-(JobsRetJobsProgressBarByNSTimeIntervalBlock _Nonnull)byAutoInterval{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setAutoInterval:data];
        return self;
    };
}

-(JobsRetJobsProgressBarByNSTimeIntervalBlock _Nonnull)byAutoLastTick{
    @jobs_weakify(self)
    return ^__kindof JobsProgressBar * _Nullable(NSTimeInterval data){
        @jobs_strongify(self)
        [self setAutoLastTick:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsProgressBar
@end
