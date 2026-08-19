//
//  CasinoUpgradeContentView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CasinoUpgradeContentView.h"

@interface CasinoUpgradeContentView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *cancelBtn;
Prop_strong()UIButton *sureBtn;
/// Data
Prop_strong()JobsGetiOSNewestVersionModel *iOSNewestVersionModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN CasinoUpgradeContentView
@interface CasinoUpgradeContentView (JobsPropertyDSLSetterAutogen_4c3df64e87)
-(void)setIOSNewestVersionModel:(JobsGetiOSNewestVersionModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END CasinoUpgradeContentView

@implementation CasinoUpgradeContentView
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(CasinoUpgradeContentView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
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
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsGetiOSNewestVersionModel *_Nullable model) {
        @jobs_strongify(self)
        self.byIOSNewestVersionModel(model);
        self.titleLab.byAlpha(1);
        if (self.iOSNewestVersionModel.isForced == JobsUpdateByUser) {
            self.cancelBtn.byAlpha(1);
        }else if (self.iOSNewestVersionModel.isForced == JobsUpdateBySys){
            self.cancelBtn.byAlpha(0);
        }
        self.sureBtn.byAlpha(1);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsWidth(290), JobsWidth(133));
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(HEXCOLOR(0x524740))
                .byText(@"The existing new version needs to be updated. Are you sure to download it?".jobsTr())
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .makeLabelByShowingType(UILabelShowingType_03)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self).offset(JobsWidth(5));
                    make.left.equalTo(self).offset(JobsWidth(10));
                    make.right.equalTo(self).offset(JobsWidth(-10));
                });
        });
    };return _titleLab;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(@"Cancel".jobsTr())
            .jobsResetBtnTitleCor(HEXCOLOR(0x502600))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
            .jobsResetBtnBgImage(@"弹窗取消按钮背景图".img)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if(self.objBlock) self.objBlock(x);
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
                make.left.equalTo(self).offset(JobsWidth(20));
                make.bottom.equalTo(self).offset(-JobsWidth(20));
            });
    };return _cancelBtn;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        @jobs_weakify(self)
        _sureBtn = UIButton.jobsInit()
            .jobsResetBtnTitle(@"Sure".jobsTr())
            .jobsResetBtnTitleCor(HEXCOLOR(0x502600))
            .jobsResetBtnBgImage(@"弹窗确定按钮背景图".img)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(14))
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if(self.objBlock) self.objBlock(x);
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(110), JobsWidth(44)));
                make.bottom.equalTo(self).offset(-JobsWidth(20));
                if (self.iOSNewestVersionModel &&
                    self.iOSNewestVersionModel.isForced == JobsUpdateBySys) {
                    make.centerX.equalTo(self);
                }else{
                    make.right.equalTo(self).offset(JobsWidth(-20));
                }
            });
    };return _sureBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN CasinoUpgradeContentView
-(JobsRetCasinoUpgradeContentViewByJobsGetiOSNewestVersionModelBlock _Nonnull)byIOSNewestVersionModel{
    @jobs_weakify(self)
    return ^__kindof CasinoUpgradeContentView * _Nullable(JobsGetiOSNewestVersionModel * _Nullable data){
        @jobs_strongify(self)
        [self setIOSNewestVersionModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END CasinoUpgradeContentView
@end
