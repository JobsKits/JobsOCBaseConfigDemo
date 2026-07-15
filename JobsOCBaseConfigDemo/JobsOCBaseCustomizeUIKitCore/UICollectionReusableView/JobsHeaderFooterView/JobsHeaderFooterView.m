//
//  JobsHeaderFooterView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsHeaderFooterView.h"
#import "UIButton+Extra.h"
#import "UIButton+SimplyMake.h"

@interface JobsHeaderFooterView ()
/// UI
Prop_strong()BaseButton *titleBtn;
Prop_strong()BaseButton *subTitleBtn;
/// Data
Prop_strong()UIViewModel *subTitleModel;

@end

@implementation JobsHeaderFooterView
@synthesize titleModel = _titleModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeZero;
    };
}
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.titleModel = nil;
        self.subTitleModel = nil;
        if ([model isKindOfClass:NSArray.class]) {
            NSArray<UIViewModel *> *viewModels = (NSArray<UIViewModel *> *)model;
            if (viewModels.count) {
                self.titleModel = viewModels[0];
            }
            if (viewModels.count >= 2) {
                self.subTitleModel = viewModels[1];
            }
        } else if ([model isKindOfClass:UIViewModel.class]) {
            self.titleModel = model;
        }
        self.viewModel = self.titleModel;
        if (self.titleModel || _titleBtn) self.titleBtn.alpha = self.titleModel ? 1 : 0;
        if (self.subTitleModel || _subTitleBtn) self.subTitleBtn.alpha = self.subTitleModel ? 1 : 0;
    };
}
#pragma mark —— 一些公共方法
-(BaseButton *)getTitleBtn{
    return self.titleBtn;
}

-(BaseButton *)getSubTitleBtn{
    return self.subTitleBtn;
}
#pragma mark —— lazyLoad
-(BaseButton *)titleBtn{
    if (!_titleBtn) {
        @jobs_weakify(self)
        _titleBtn = BaseButton.jobsInit()
//            .bgColorBy(JobsWhiteColor)
//            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
//            .jobsResetImagePadding(1)
//            .jobsResetBtnImage(@"APPLY NOW".img)
//            .jobsResetBtnBgImage(@"APPLY NOW".img)
//            .jobsResetBtnTitleCor(JobsWhiteColor)
//            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
//            .jobsResetBtnTitle(@"APPLY NOW".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(self.viewModel.textModel.offsetXForEach);
                make.top.bottom.equalTo(self);
            });
    }
    _titleBtn
        .jobsResetBtnTitle(self.titleModel.textModel.text)
        .jobsResetImagePadding(self.titleModel.imageTitleSpace)
        .jobsResetTitlePadding(self.titleModel.titleSpace)
        .jobsResetBtnImage(self.titleModel.image)
        .jobsResetBtnBgCor(self.titleModel.bgCor)
        .jobsUpdateButtonConfigurationBy(^(UIButtonConfiguration *config) {
            config
                .byBaseForegroundColor(self.titleModel.textModel.textCor)
                .bySubtitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode)
                .byImagePlacement(self.titleModel.buttonEdgeInsetsStyle)
                .byTitleLineBreakMode(self.titleModel.subTextModel.lineBreakMode)
                .bySubtitle(self.titleModel.subTextModel.text);
        });
    [_titleBtn jobsSetBtnTitleFont:self.titleModel.textModel.font btnTitleCor:self.titleModel.textModel.textCor];
    _titleBtn.makeBtnTitleByShowingType(self.titleModel.textModel.labelShowingType);
    /// 富文本的优先级最高，不括起来上述的设置无效
    if(self.titleModel.textModel.attributedTitle){
        _titleBtn.jobsResetAttributedTitle(self.titleModel.textModel.attributedTitle);
    }
    if(self.titleModel.subTextModel.attributedTitle){
        _titleBtn.jobsResetAttributedSubtitle(self.titleModel.subTextModel.attributedTitle);
    };return _titleBtn;
}

-(BaseButton *)subTitleBtn{
    if (!_subTitleBtn) {
        @jobs_weakify(self)
        _subTitleBtn = BaseButton.jobsInit()
//            .bgColorBy(JobsWhiteColor)
//            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
//            .jobsResetImagePadding(1)
//            .jobsResetBtnImage(@"APPLY NOW".img)
//            .jobsResetBtnBgImage(@"APPLY NOW".img)
//            .jobsResetBtnTitleCor(JobsWhiteColor)
//            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
//            .jobsResetBtnTitle(@"APPLY NOW".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(self.viewModel.subTextModel.offsetXForEach);
                make.top.bottom.equalTo(self);
        });
    }
    _subTitleBtn
        .jobsResetBtnTitle(self.subTitleModel.textModel.text)
        .jobsResetImagePadding(self.subTitleModel.imageTitleSpace)
        .jobsResetTitlePadding(self.subTitleModel.titleSpace)
        .jobsResetBtnImage(self.subTitleModel.image)
        .jobsResetBtnBgCor(self.subTitleModel.bgCor)
        .jobsUpdateButtonConfigurationBy(^(UIButtonConfiguration *config) {
            config
                .bySubtitle(self.subTitleModel.subTextModel.text)
                .byTitleLineBreakMode(self.subTitleModel.subTextModel.lineBreakMode)
                .bySubtitleLineBreakMode(self.subTitleModel.subTextModel.lineBreakMode)
                .byImagePlacement(self.subTitleModel.buttonEdgeInsetsStyle)
                .byBaseForegroundColor(self.subTitleModel.textModel.textCor);
        });
    [_subTitleBtn jobsSetBtnTitleFont:self.subTitleModel.textModel.font btnTitleCor:self.subTitleModel.textModel.textCor];
    _subTitleBtn.makeBtnTitleByShowingType(self.subTitleModel.textModel.labelShowingType);
    /// 富文本的优先级最高，不括起来上述的设置无效
    if(self.subTitleModel.textModel.attributedTitle){
        _subTitleBtn.jobsResetAttributedTitle(self.subTitleModel.textModel.attributedTitle);
    }
    if(self.subTitleModel.subTextModel.attributedTitle){
        _subTitleBtn.jobsResetAttributedSubtitle(self.subTitleModel.subTextModel.attributedTitle);
    };return _subTitleBtn;
}

@end
