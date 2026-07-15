//
//  JobsBasePopupView.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBasePopupView.h"
#import "BaseButton.h"
#import "UIButton+SimplyMake.h"
#import "UIView+BackgroundImage.h"

@interface JobsBasePopupView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()BaseButton *btn1;
Prop_strong()BaseButton *btn2;
/// Data

@end

@implementation JobsBasePopupView
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        if (model) {
            if (self.viewModel.bgImage) {
                self.backgroundImageView.image = self.viewModel.bgImage;
            }else{
                self.byBgColor(self.viewModel.bgCor);
            }
            self.titleLab.byText(self.viewModel.textModel.text);
            self.subTitleLab.byText(self.viewModel.subTextModel.text);
            self.btn1.byAlpha(1);
            self.btn2.byAlpha(1);
            self.titleLab.bySizeToFit();
            self.subTitleLab.bySizeToFit();
        }
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH() - JobsWidth(30), JobsWidth(210));
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(self.viewModel.textModel.font)
                .byTextCor(self.viewModel.textModel.textCor)
                .byTextAlignment(self.viewModel.textModel.textAlignment)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self).offset(JobsWidth(50));
                });
        });
    };return _titleLab;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(self.viewModel.subTextModel.font)
                .byTextCor(self.viewModel.subTextModel.textCor)
                .byTextAlignment(self.viewModel.subTextModel.textAlignment)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(5));
                });
        });
    };return _subTitleLab;
}

-(BaseButton *)btn1{
    if (!_btn1) {
        _btn1 = BaseButton
            .initByStyle4(@"Cancel".tr,
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x502600),
                          self.viewModel.image,
                          @"弹窗取消按钮背景图".img,
                          NSDirectionalRectEdgeNone)
            .onClickBy(^(UIButton *x){
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byTag(666)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
                make.left.equalTo(self).offset(JobsWidth(20));
                make.bottom.equalTo(self).offset(-JobsWidth(25));
            });
    };return _btn1;
}

-(BaseButton *)btn2{
    if (!_btn2) {
        @jobs_weakify(self)
        _btn2 = BaseButton
            .initByStyle4(@"Sure".tr,
                          UIFontWeightRegularSize(14),
                          HEXCOLOR(0x502600),
                          self.viewModel.image,
                          @"弹窗确定按钮背景图".img,
                          NSDirectionalRectEdgeNone)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byTag(999)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
                make.right.equalTo(self).offset(JobsWidth(-20));
                make.bottom.equalTo(self).offset(-JobsWidth(25));
            });
    };return _btn2;
}

@end
