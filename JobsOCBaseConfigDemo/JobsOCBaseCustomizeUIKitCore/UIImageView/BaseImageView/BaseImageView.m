//
//  BaseImageView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseImageView.h"
#import "UIView+Extra.h"

@interface BaseImageView ()

@end

@implementation BaseImageView
#pragma mark —— BaseProtocol
BaseProtocol_synthesize
#pragma mark —— RACProtocol
RACProtocol_synthesize
#pragma mark —— BaseViewProtocol
BaseViewProtocol_synthesize
-(instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
/**
 
     1. 刷新完成后触发 layoutsubview
     UICollectionView 在 reloaddata 后, 会触发 layoutsubview , 可以继承父类的 superview 方法, 在其中处理需要在刷新完数据后做的操作, 如播放短视频.

     2. 使用layoutIfNeeded方法，强制重绘
     在 UICollectionView 调用 reloaddata 方法后, 强制调用其 layoutIfNeeded 方法, 接着调用刷新完后的操作.
 */
-(void)layoutSubviews{
    [super layoutSubviews];
    /// 在这里设置这个View的size，外界设置的话，在某些情况下会因为内部生命周期的问题，导致异常
    // self.size = MSPayView.viewSizeByModel(nil);
    if(!jobsZeroSizeValue(self.layoutSubviewsRectCornerSize)){
        [self appointCornerCutToCircleByRoundingCorners:self.layoutSubviewsRectCorner
                                            cornerRadii:self.layoutSubviewsRectCornerSize];
    }
}

-(void)layoutIfNeeded{
    [super layoutIfNeeded];
}

@end
