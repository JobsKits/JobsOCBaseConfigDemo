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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsImageRefreshView
@interface JobsImageRefreshView (JobsPropertyDSLSetterAutogen_5608e644d3)
-(void)setFrameIndex:(NSUInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsImageRefreshView

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
        self.jobs_showFrameAtIndex(0);
    };return self;
}

-(void)dealloc {
    if (self.frameTimer) self.frameTimer.jobsStop();
}

-(CGSize)intrinsicContentSize {
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsImageRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
    return action ? action() : (CGSize){0};
}

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsIntrinsicContentSize{
    @jobs_weakify(self)
    return ^CGSize{
        @jobs_strongify(self)
        if (!self) return (CGSize){0};
        return self.indicatorSize;
    };
}

-(void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsImageRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.imageView.byFrame(self.bounds);
    };
}

-(jobsByVoidBlock _Nonnull)jobsDidMoveToWindow {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didMoveToWindow];
        if (self.wantsAnimating && self.window) self.jobs_startTimerIfNeeded();
        if (!self.window) if (self.frameTimer) self.frameTimer.pause();
    };
}

-(void)didMoveToWindow{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsImageRefreshView.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(JobsRetIDByVoidBlock _Nonnull)byStart {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.byHidden(NO);
        self.jobs_startTimerIfNeeded();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byPause {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        if (self.frameTimer) self.frameTimer.pause();
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byResume {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.byHidden(NO);
        JobsTimer *frameTimer = self.frameTimer;
        if (frameTimer && frameTimer.isPaused) {
            frameTimer.resume();
        } else {
            self.jobs_startTimerIfNeeded();
        }
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStop {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        if (self.frameTimer) self.frameTimer.jobsStop();
        self.frameTimer = nil;
        self.frameIndex = 0;
        self.jobs_showFrameAtIndex(0);
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
        return self.indicatorSize;
    };
}

-(void)refreshAnimatorApplyPhase:(JobsRefreshAnimatorPhase)phase
                        progress:(CGFloat)progress {
    CGFloat normalized = MIN(1, MAX(0, progress));
    switch (phase) {
        /// 处理 JobsRefreshAnimatorPhasePulling 分支
        case JobsRefreshAnimatorPhasePulling:
            self.byStop();
            self.byHidden(NO)
                .byAlpha(0.35 + normalized * 0.65)
                .byTransform(CGAffineTransformMakeScale(0.78 + normalized * 0.22,
                                                        0.78 + normalized * 0.22));
            break;
        /// 处理 JobsRefreshAnimatorPhaseReady 分支
        case JobsRefreshAnimatorPhaseReady:
            self.byStop();
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        /// 处理 JobsRefreshAnimatorPhaseRefreshing 分支
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            self.byStart();
            break;
        /// 处理 JobsRefreshAnimatorPhaseEnding 分支
        case JobsRefreshAnimatorPhaseEnding:
            self.byStop();
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        /// 处理 JobsRefreshAnimatorPhaseIdle 分支
        case JobsRefreshAnimatorPhaseIdle:
        /// 处理 JobsRefreshAnimatorPhaseInactive 分支
        case JobsRefreshAnimatorPhaseInactive:
            self.byStop();
            self.byHidden(YES)
                .byAlpha(0)
                .byTransform(CGAffineTransformIdentity);
            break;
    }
}

#pragma mark —— Private
-(jobsByVoidBlock _Nonnull)jobs_startTimerIfNeeded {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.window || self.images.count < 2 || UIAccessibilityIsReduceMotionEnabled()) {
            self.jobs_showFrameAtIndex(0);
            return;
        }
        if (self.frameTimer) {
            self.frameTimer.resume();
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
                    self.byFrameIndex((self.frameIndex + 1) % self.images.count);
                    self.jobs_showFrameAtIndex(self.frameIndex);
                });
        });
        self.frameTimer.start();
    };
}

-(jobsByNSUIntegerBlock _Nonnull)jobs_showFrameAtIndex{
    @jobs_weakify(self)
    return ^(NSUInteger frameIndex){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.images.count) {
            self.imageView.byImage(nil);
            return;
        }
        NSUInteger safeIndex = MIN(frameIndex, self.images.count - 1);
        self.imageView.byImage(self.images[safeIndex]);
    };
}

#pragma mark —— LazyLoad
-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byContentMode(UIViewContentModeScaleAspectFit);
        });
    };return _imageView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsImageRefreshView
-(JobsRetJobsImageRefreshViewByNSUIntegerBlock _Nonnull)byFrameIndex{
    @jobs_weakify(self)
    return ^__kindof JobsImageRefreshView * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setFrameIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsImageRefreshView
@end
