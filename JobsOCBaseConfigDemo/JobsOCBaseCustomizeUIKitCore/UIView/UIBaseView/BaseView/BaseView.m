//
//  BaseView.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseView.h"
#import "NSObject+Extra.h"
#import "UIView+Extra.h"

@interface BaseView ()

@end

@implementation BaseView
/// BaseProtocol
BaseProtocol_synthesize
/// RACProtocol
RACProtocol_synthesize
/// BaseViewProtocol
BaseViewProtocol_synthesize
/// UIPictureAndBackGroundCorProtocol
UIPictureAndBackGroundCorProtocol_synthesize
/// UITextFieldProtocol_synthesize
UITextFieldProtocol_synthesize_part2
/// AppToolsProtocol
AppToolsProtocol_synthesize
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
-(instancetype)init{
    if (self = [super init]) {

    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
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
#pragma mark —— lazyLoad
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.byBackgroundImage(@"联系我们".img);
    //        data.highlightBackgroundImage = @"联系我们".img
    //        data.jobsResetBtnImage = @"联系我们".img
    //        data.highlightImage = @"联系我们".img
    //        data.imagePadding = JobsWidth(5);
            data.byRoundingCorners(UIRectCornerAllCorners)
                .byBaseBackgroundColor(JobsClearColor);
        });
    };return _closeBtnModel;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.makeBackBtnModel
            .byLongPressGestureEventBlock(^id(__kindof UIButton *x) {
                JobsLog(@"按钮的长按事件触发");
                return nil;
            })
            .byClickEventBlock(^id(id x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.jobsBackBtnClickEvent(x);
                return nil;
            });
    };return _backBtnModel;
}

@end
