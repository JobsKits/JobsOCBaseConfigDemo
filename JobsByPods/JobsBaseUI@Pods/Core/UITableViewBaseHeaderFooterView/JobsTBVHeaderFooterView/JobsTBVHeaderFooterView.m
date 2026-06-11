//
//  JobsTBVHeaderFooterView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTBVHeaderFooterView.h"
#import <JobsBaseUI/BaseButton.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#import <JobsBaseUI/UIButton+Extra.h>
#import <JobsBaseUI/UIButton+UI.h>
#import <JobsBaseUI/UIView+Extra.h>

#import <Masonry/Masonry.h>

@interface JobsTBVHeaderFooterView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()BaseButton *subTitleBtn;

@end

@implementation JobsTBVHeaderFooterView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    };return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : UIViewModel.new;
        self.titleLab.byAlpha(1);

        self.subTitleBtn.byAlpha(1);

        self.contentView.byBgColor(self.viewModel.bgCor);

    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(46);
    };
}
#pragma mark —— 一些公共方法
-(UILabel *)getTitleLab{
    return self.titleLab;
}

-(BaseButton *)getSubTitleBtn{
    return self.subTitleBtn;
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(self.viewModel.textModel.offsetXForEach);
                    make.top.bottom.equalTo(self);
                });
        });
    }

    if (self.viewModel.textModel.attributedTitle) {
        _titleLab.byAttributedString(self.viewModel.textModel.attributedTitle);
    } else {
        _titleLab
            .byText(self.viewModel.textModel.text)
            .byFont(self.viewModel.textModel.font)
            .byTextCor(self.viewModel.textModel.textCor)
            .byTextAlignment(self.viewModel.textModel.textAlignment)
            .makeLabelByShowingType(self.viewModel.textModel.labelShowingType);/// 一行显示。不定宽、定高、定字体。宽度自适应 【单行：ByFont】
    };return _titleLab;
}

-(BaseButton *)subTitleBtn{
    if (!_subTitleBtn) {
        @jobs_weakify(self)
        _subTitleBtn = BaseButton.jobsInit()
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.right.equalTo(self).offset(self.viewModel.subTextModel.offsetXForEach);
                make.top.bottom.equalTo(self);
            });
    }

    _subTitleBtn
        .jobsResetBtnImage(self.viewModel.image)
        .jobsResetBtnBgImage(self.viewModel.bgImage)
        .jobsResetBtnTitle(self.viewModel.subTextModel.text)
        .jobsResetBtnTitleCor(self.viewModel.subTextModel.textCor)
        .jobsResetBtnNormalAttributedTitle(self.viewModel.subTextModel.attributedTitle)
        .selectedStateImageBy(self.viewModel.selectedImage_)
        .selectedStateBackgroundImageBy(self.viewModel.bgSelectedImage)
        .selectedStateTitleBy(self.viewModel.subTextModel.text)
        .selectedStateTitleColorBy(self.viewModel.subTextModel.textCor)
        .selectedAttributedTitleBy(self.viewModel.subTextModel.attributedTitle)
        .jobsResetBtnTitleFont(self.viewModel.subTextModel.font)
        .makeBtnTitleByShowingType(self.viewModel.labelShowingType)
        .jobsResetImagePlacement_Padding(self.viewModel.buttonEdgeInsetsStyle,
                                         self.viewModel.imageTitleSpace);

    _subTitleBtn.titleAlignment = self.viewModel.subTextModel.textAlignment;
    _subTitleBtn.lineBreakMode = self.viewModel.subTextModel.lineBreakMode;return _subTitleBtn;
}

@end
