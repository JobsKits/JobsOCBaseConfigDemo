//
//  JobsGIFRefreshView.m
//  JobsFuseAnimation
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsGIFRefreshView.h"

@interface JobsGIFRefreshView ()

Prop_strong()UIImageView *imageView;
Prop_strong(nullable)UIImage *animatedImage;
Prop_strong(nullable)UIImage *firstFrame;
Prop_assign()BOOL wantsAnimating;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsGIFRefreshView
@interface JobsGIFRefreshView (JobsPropertyDSLSetterAutogen_d95cb0a6cd)
-(void)setFirstFrame:(UIImage * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsGIFRefreshView

@implementation JobsGIFRefreshView

-(JobsRetJobsGIFRefreshViewByCGSizeBlock _Nonnull)byIndicatorSize{
    @jobs_weakify(self)
    return ^__kindof JobsGIFRefreshView *_Nullable(CGSize data){
        @jobs_strongify(self)
        self.indicatorSize = data;
        return self;
    };
}

-(instancetype)initWithGIFNamed:(NSString *)name {
    NSString *resourceName = name.stringByDeletingPathExtension;
    NSString *extension = name.pathExtension.length ? name.pathExtension : @"gif";
    NSString *path = [NSBundle.mainBundle pathForResource:resourceName ofType:extension];
    return [self initWithGIFPath:path ?: @""];
}

-(instancetype)initWithGIFPath:(NSString *)path {
    NSData *data = path.length ? [NSData dataWithContentsOfFile:path] : nil;
    return [self initWithGIFData:data ?: NSData.data];
}

-(instancetype)initWithGIFData:(NSData *)data {
    if (self = [super initWithFrame:CGRectZero]) {
        _indicatorSize = CGSizeMake(20, 20);
        self.byUserInteractionEnabled(NO);
        self.imageView.addOn(self);
        self.jobs_decodeGIFData(data);
    };return self;
}

-(CGSize)intrinsicContentSize {
    JobsRetCGSizeByVoidBlock action = ((JobsRetCGSizeByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGIFRefreshView.class, @selector(jobsIntrinsicContentSize)))(self, @selector(jobsIntrinsicContentSize));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGIFRefreshView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
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
        if (self.wantsAnimating && self.window) self.byResume();
        if (!self.window) self.imageView.byImage(self.firstFrame);
    };
}

-(void)didMoveToWindow{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsGIFRefreshView.class, @selector(jobsDidMoveToWindow)))(self, @selector(jobsDidMoveToWindow));
    if (action) action();
}

-(JobsRetIDByVoidBlock _Nonnull)byStart {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = YES;
        self.imageView.byImage(UIAccessibilityIsReduceMotionEnabled() ? self.firstFrame : self.animatedImage);
        self.byHidden(NO);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byPause {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.imageView.byImage(self.firstFrame);
        return self;
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byResume {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.byStart();
    };
}

-(JobsRetIDByVoidBlock _Nonnull)byStop {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.wantsAnimating = NO;
        self.imageView.byImage(self.firstFrame);
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
                .byTransform(CGAffineTransformMakeScale(0.8 + normalized * 0.2,
                                                        0.8 + normalized * 0.2));
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
-(jobsByDataBlock _Nonnull)jobs_decodeGIFData{
    @jobs_weakify(self)
    return ^(NSData * data){
        @jobs_strongify(self)
        if (!self) return;
        if (!data.length) return;
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, nil);
        if (!source) return;
        size_t count = CGImageSourceGetCount(source);
        NSMutableArray<UIImage *> *frames = NSMutableArray.array;
        NSTimeInterval duration = 0;
        for (size_t index = 0; index < count; index++) {
            CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, index, nil);
            if (!imageRef) continue;
            UIImage *image = [UIImage imageWithCGImage:imageRef
                                                scale:UIScreen.mainScreen.scale
                                          orientation:UIImageOrientationUp];
            [frames addObject:image];
            duration += [self jobs_delayAtIndex:index source:source];
            CGImageRelease(imageRef);
        }
        CFRelease(source);
        if (!frames.count) return;
        self.byFirstFrame(frames.firstObject);
        self.animatedImage = [UIImage animatedImageWithImages:frames
                                                     duration:MAX(duration, frames.count * 0.08)];
        self.indicatorSize = CGSizeMake(MAX(1, self.firstFrame.size.width),
                                        MAX(1, self.firstFrame.size.height));
        self.imageView.byImage(self.firstFrame);
        [self invalidateIntrinsicContentSize];
    };
}

-(NSTimeInterval)jobs_delayAtIndex:(size_t)index
                           source:(CGImageSourceRef)source {
    NSDictionary *properties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(source,
                                                                                                     index,
                                                                                                     nil);
    NSDictionary *gif = properties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber *delay = gif[(NSString *)kCGImagePropertyGIFUnclampedDelayTime] ?:
        gif[(NSString *)kCGImagePropertyGIFDelayTime];
    return MAX(0.02, delay ? delay.doubleValue : 0.08);
}

#pragma mark —— LazyLoad
-(UIImageView *)imageView {
    if (!_imageView) {
        _imageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byContentMode(UIViewContentModeScaleAspectFit);
        });
    };return _imageView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsGIFRefreshView
-(JobsRetJobsGIFRefreshViewByUIImageBlock _Nonnull)byFirstFrame{
    @jobs_weakify(self)
    return ^__kindof JobsGIFRefreshView * _Nullable(UIImage * _Nullable data){
        @jobs_strongify(self)
        [self setFirstFrame:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsGIFRefreshView
@end
