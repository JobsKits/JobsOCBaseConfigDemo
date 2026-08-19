//
//  UICollectionHeaderFooterView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionHeaderFooterView.h"

#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/UIView+Measure.h>

@interface UICollectionHeaderFooterView ()

@end

@implementation UICollectionHeaderFooterView
-(JobsRetUICollectionHeaderFooterViewByFrameBlock _Nonnull)byImageViewFrame{
    @jobs_weakify(self)
    return ^__kindof UICollectionHeaderFooterView *_Nullable(CGRect imageViewFrame){
        @jobs_strongify(self)
        [self setImageViewFrame:imageViewFrame];
        return self;
    };
}

/// UIViewModelProtocol
@synthesize imageViewFrame = _imageViewFrame;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(UICollectionHeaderFooterView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_collectionHeaderFooterViewOnceToken = 0;
        static_collectionHeaderFooterView = nil;
    };
}

static UICollectionHeaderFooterView *static_collectionHeaderFooterView = nil;
static dispatch_once_t static_collectionHeaderFooterViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(UICollectionHeaderFooterView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_collectionHeaderFooterViewOnceToken, ^{
            static_collectionHeaderFooterView = UICollectionHeaderFooterView.new;
        });return static_collectionHeaderFooterView;
    };
}
#pragma mark —— SysMethod
- (instancetype)init{
    if (self = [super init]) {
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UICollectionHeaderFooterView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UICollectionHeaderFooterView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY {
    jobsByCGFloatBlock action = ((jobsByCGFloatBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UICollectionHeaderFooterView.class, @selector(jobsScrollViewDidScrollWithContentOffsetY)))(self, @selector(jobsScrollViewDidScrollWithContentOffsetY));
    if (action) action(contentOffsetY);
}

-(jobsByCGFloatBlock _Nonnull)jobsScrollViewDidScrollWithContentOffsetY{
    @jobs_weakify(self)
    return ^(CGFloat contentOffsetY){
        @jobs_strongify(self)
        if (!self) return;
        if (self.isZoom) {
            CGRect frame = self.imageViewFrame;
            frame.size.height -= contentOffsetY;
            frame.origin.y = contentOffsetY;
            self.imageView.byFrame(frame);
        }
    };
}
#pragma mark —— lazyLoad
@synthesize imageView = _imageView;
-(UIImageView *)imageView{
    if (!_imageView) {
        @jobs_weakify(self)
        _imageView = jobsMakeImageView(^(__kindof UIImageView *_Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(JobsLoadBundleImage(@"bundle",
                                             @"Others",
                                             nil,
                                             @"个人中心背景图"))
                .byClipsToBounds(YES)
                .byContentMode(UIViewContentModeScaleAspectFill)
                .addOn(self);
            if (self.isZoom) {
                imageView.byFrame(CGRectMake(0,
                                             0,
                                             self.width,
                                             self.height));
                self.byImageViewFrame(imageView.frame);
            }else{
                imageView.byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
            }
        });
    };return _imageView;
}

@end
