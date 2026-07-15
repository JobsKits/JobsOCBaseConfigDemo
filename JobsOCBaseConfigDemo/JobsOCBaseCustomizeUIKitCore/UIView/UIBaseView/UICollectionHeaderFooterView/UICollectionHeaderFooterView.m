//
//  UICollectionHeaderFooterView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UICollectionHeaderFooterView.h"
#import "UIView+Extra.h"
#import "UIView+Measure.h"

@interface UICollectionHeaderFooterView ()

@end

@implementation UICollectionHeaderFooterView
/// UIViewModelProtocol
@synthesize imageViewFrame = _imageViewFrame;
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    static_collectionHeaderFooterViewOnceToken = 0;
    static_collectionHeaderFooterView = nil;
}

static UICollectionHeaderFooterView *static_collectionHeaderFooterView = nil;
static dispatch_once_t static_collectionHeaderFooterViewOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&static_collectionHeaderFooterViewOnceToken, ^{
        static_collectionHeaderFooterView = UICollectionHeaderFooterView.new;
    });return static_collectionHeaderFooterView;
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
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— UIScrollViewDelegate
-(void)scrollViewDidScrollWithContentOffsetY:(CGFloat)contentOffsetY {
    if (self.isZoom) {
        CGRect frame = self.imageViewFrame;
        frame.size.height -= contentOffsetY;
        frame.origin.y = contentOffsetY;
        self.imageView.byFrame(frame);
    }
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
                self.imageViewFrame = imageView.frame;
            }else{
                imageView.byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self);
                });
            }
        });
    };return _imageView;
}

@end
