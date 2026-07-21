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

@implementation JobsGIFRefreshView
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
        [self jobs_decodeGIFData:data];
    };return self;
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
    if (self.wantsAnimating && self.window) [self byResume];
    if (!self.window) self.imageView.byImage(self.firstFrame);
}

-(instancetype)byStart {
    self.wantsAnimating = YES;
    self.imageView.byImage(UIAccessibilityIsReduceMotionEnabled() ? self.firstFrame : self.animatedImage);
    self.byHidden(NO);
    return self;
}

-(instancetype)byPause {
    self.wantsAnimating = NO;
    self.imageView.byImage(self.firstFrame);
    return self;
}

-(instancetype)byResume {
    return [self byStart];
}

-(instancetype)byStop {
    self.wantsAnimating = NO;
    self.imageView.byImage(self.firstFrame);
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
        case JobsRefreshAnimatorPhasePulling:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(0.35 + normalized * 0.65)
                .byTransform(CGAffineTransformMakeScale(0.8 + normalized * 0.2,
                                                        0.8 + normalized * 0.2));
            break;
        case JobsRefreshAnimatorPhaseReady:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        case JobsRefreshAnimatorPhaseRefreshing:
            self.byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            [self byStart];
            break;
        case JobsRefreshAnimatorPhaseEnding:
            [self byStop];
            self.byHidden(NO)
                .byAlpha(1)
                .byTransform(CGAffineTransformIdentity);
            break;
        case JobsRefreshAnimatorPhaseIdle:
        case JobsRefreshAnimatorPhaseInactive:
            [self byStop];
            self.byHidden(YES)
                .byAlpha(0)
                .byTransform(CGAffineTransformIdentity);
            break;
    }
}

#pragma mark —— Private
-(void)jobs_decodeGIFData:(NSData *)data {
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
    self.firstFrame = frames.firstObject;
    self.animatedImage = [UIImage animatedImageWithImages:frames
                                                 duration:MAX(duration, frames.count * 0.08)];
    self.indicatorSize = CGSizeMake(MAX(1, self.firstFrame.size.width),
                                    MAX(1, self.firstFrame.size.height));
    self.imageView.byImage(self.firstFrame);
    [self invalidateIntrinsicContentSize];
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

@end
