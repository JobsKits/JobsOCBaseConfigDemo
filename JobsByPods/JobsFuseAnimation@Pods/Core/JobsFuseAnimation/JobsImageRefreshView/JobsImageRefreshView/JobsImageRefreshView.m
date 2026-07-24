//
//  JobsImageRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsImageRefreshView.h"

@interface JobsImageRefreshView ()

Prop_copy(readwrite)NSArray<UIImage *> *images;
Prop_assign(readwrite)NSTimeInterval frameInterval;
Prop_strong()UIImageView *imageView;
Prop_strong(nullable)JobsTimer *frameTimer;
Prop_assign()NSUInteger frameIndex;
Prop_assign()BOOL wantsAnimating;

@end

@implementation JobsImageRefreshView
-(instancetype)initWithImage:(UIImage *)image {
    return [self initWithImages:image ? @[image] : @[] frameInterval:0.08];
}

-(instancetype)initWithImages:(NSArray<UIImage *> *)images
                frameInterval:(NSTimeInterval)frameInterval {
    if (self = [super initWithFrame:CGRectZero]) {
        NSMutableArray<UIImage *> *validImages = NSMutableArray.array;
        for (UIImage *image in images) {
            if ([image isKindOfClass:UIImage.class]) [validImages addObject:image];
        }
        _images = validImages.copy;
        _frameInterval = MAX(0.02, frameInterval);
        UIImage *firstImage = _images.firstObject;
        _indicatorSize = firstImage ? CGSizeMake(MAX(1, firstImage.size.width),
                                                 MAX(1, firstImage.size.height)) : CGSizeMake(20, 20);
        self.byUserInteractionEnabled(NO);
        self.imageView.addOn(self);
        [self jobs_showFrameAtIndex:0];
    };return self;
}

-(void)dealloc {
    [self.frameTimer stop];
}

-(CGSize)intrinsicContentSize {
    return self.indicatorSize;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.byFrame(self.bounds);
}

-(void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.wantsAnimating && self.window) [self jobs_startTimerIfNeeded];
    if (!self.window) [self.frameTimer pause];
}

-(instancetype)byStart {
    self.wantsAnimating = YES;
    self.byHidden(NO);
    [self jobs_startTimerIfNeeded];
    return self;
}

-(instancetype)byPause {
    self.wantsAnimating = NO;
    [self.frameTimer pause];
    return self;
}

-(instancetype)byResume {
    self.wantsAnimating = YES;
    self.byHidden(NO);
    self.frameTimer.isPaused ? [self.frameTimer resume] : [self jobs_startTimerIfNeeded];
    return self;
}

-(instancetype)byStop {
    self.wantsAnimating = NO;
    [self.frameTimer stop];
    self.frameTimer = nil;
    self.frameIndex = 0;
    [self jobs_showFrameAtIndex:0];
    return self;
}

#pragma mark —— JobsRefreshAnimatorProtocol
-(UIView *)refreshAnimatorView {
    return self;
}

-(CGSize)refreshAnimatorPreferredSize {
    return self.indicatorSize;
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalized = MIN(1, MAX(0, progress));
    switch (phase) {
        /// 处理 JobsRefreshAnimatorPhasePulling 分支
        case JobsRefreshAnimatorPhasePulling:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(0.35 + normalized * 0.65)
                .byTransform(CGAffineTransformMakeScale(0.78 + normalized * 0.22,
                                                        0.78 + normalized * 0.22));
            break;
        /// 处理 JobsRefreshAnimatorPhaseReady 分支
        case JobsRefreshAnimatorPhaseReady:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        /// 处理 JobsRefreshAnimatorPhaseRefreshing 分支
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            [self byStart];
            break;
        /// 处理 JobsRefreshAnimatorPhaseEnding 分支
        case JobsRefreshAnimatorPhaseEnding:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        /// 处理 JobsRefreshAnimatorPhaseIdle 分支
        case JobsRefreshAnimatorPhaseIdle:
        /// 处理 JobsRefreshAnimatorPhaseInactive 分支
        case JobsRefreshAnimatorPhaseInactive:
            [self byStop];
            self.byHidden(YES)
                .byAlpha(0)
                .byTransform(CGAffineTransformIdentity);
            break;
    }
}

#pragma mark —— Private
-(void)jobs_startTimerIfNeeded {
    if (!self.window || self.images.count < 2 || UIAccessibilityIsReduceMotionEnabled()) {
        [self jobs_showFrameAtIndex:0];
        return;
    }
    if (self.frameTimer) {
        [self.frameTimer resume];
        return;
    }
    @jobs_weakify(self)
    self.frameTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
        timer.byTimerType(JobsTimerTypeGCD)
            .byTimeInterval(self.frameInterval)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                if (!self.images.count) return;
                self.frameIndex = (self.frameIndex + 1) % self.images.count;
                [self jobs_showFrameAtIndex:self.frameIndex];
            });
    });
    [self.frameTimer start];
}

-(void)jobs_showFrameAtIndex:(NSUInteger)frameIndex {
    if (!self.images.count) {
        self.imageView.byImage(nil);
        return;
    }
    NSUInteger safeIndex = MIN(frameIndex, self.images.count - 1);
    self.imageView.byImage(self.images[safeIndex]);
}

#pragma mark —— LazyLoad
-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byContentMode(UIViewContentModeScaleAspectFit);
        });
    };return _imageView;
}

@end
