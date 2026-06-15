//
//  CasinoCustomerServiceView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CasinoCustomerServiceView.h"

@interface CasinoCustomerServiceView ()
/// UI
Prop_strong()UILabel *titleLab;// 标题
Prop_strong()BaseButton *closeBtn;
Prop_strong()BaseButton *contactCustomerServiceBtn;// 联系客服按钮
Prop_strong()UILabel *subTitleLab;// 副标题
Prop_strong()UIImageView *leftIMGV;
Prop_strong()UIImageView *rightIMGV;
Prop_strong()JobsHotLabelBySingleLine *hl;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
Prop_strong()CasinoCustomerContactModel *customerContactModel;

@end

@implementation CasinoCustomerServiceView

static CasinoCustomerServiceView *static_customerServiceView = nil;
+(instancetype)sharedManager{
    @synchronized(self){
        if (!static_customerServiceView) {
            static_customerServiceView = CasinoCustomerServiceView.new;
        }
    };return static_customerServiceView;
}

-(instancetype)init{
    if (self = [super init]) {
        self.backgroundImageView.image = @"客服_背景图".img;
        [self customerContact];
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self customerContact];
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
// BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(NSMutableArray <UIViewModel *>*_Nullable model) {
        @jobs_strongify(self)
        self.titleLab.byAlpha(1);

        self.contactCustomerServiceBtn.byAlpha(1);

        self.closeBtn.byAlpha(1);

        self.subTitleLab.byAlpha(1);

        self.leftIMGV.byAlpha(1);

        self.rightIMGV.byAlpha(1);

        
        self.hotLabelDataMutArr = model;
        if (self.hotLabelDataMutArr.count) {
            self.hl.byAlpha(1);

        }
    };
}

+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(NSArray <UIViewModel *>*_Nullable data){
        CGFloat h = JobsWidth(162) + JobsHotLabelBySingleLine.viewSizeByModel(data).height + JobsWidth(70);
        return CGSizeMake(JobsWidth(345), h);
    };
}
#pragma mark —— 网络请求
/// 获取客服联系方式
-(void)customerContact{

}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title10.tr)
                .byTextCor(HEXCOLOR(0x502600))
                .byFont([UIFont systemFontOfSize:JobsWidth(20)
                                           weight:UIFontWeightRegular])
            .bySizeToFit()
            .addOn(self.backgroundImageView)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(JobsWidth(20));
            });
        });
    };return _titleLab;
}

-(BaseButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnImage(@"zaixiankefu_en".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsLog(@"返回登录");
                if (isNull(self.customerContactModel.onlineUrl.customerAccount)) {
                    [self customerContact];// 获取客服联系方式
                }else{
                    self.jobsOpenURL(self.customerContactModel.onlineUrl.customerAccount);
                }
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.backgroundImageView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(150), JobsWidth(38)));
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(12));
                    make.centerX.equalTo(self.titleLab);
                });
    };return _contactCustomerServiceBtn;
}

-(BaseButton *)closeBtn{
    if (!_closeBtn) {
        @jobs_weakify(self)
        _closeBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .jobsResetBtnBgImage(@"客服_关闭按钮".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self.backgroundImageView)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(24), JobsWidth(24)));
                make.right.equalTo(self).offset(JobsWidth(-20));
                make.top.equalTo(self).offset(JobsWidth(20));
            });
    };return _closeBtn;
}

-(UILabel *)subTitleLab{
    if (!_subTitleLab) {
        @jobs_weakify(self)
        _subTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title11.tr)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .byTextCor(HEXCOLOR(0x502600))
                .byFont(UIFontWeightMediumSize(12))
            .bySizeToFit()
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.contactCustomerServiceBtn);
                make.top.equalTo(self.contactCustomerServiceBtn.mas_bottom).offset(JobsWidth(23));
                make.left.equalTo(self).offset(JobsWidth(15));
                make.right.equalTo(self).offset(JobsWidth(-15));
            });
        });
    };return _subTitleLab;
}

-(JobsHotLabelBySingleLine *)hl{
    if (!_hl) {
        _hl = JobsHotLabelBySingleLine.new;
        _hl.byBgColor(JobsClearColor);

        _hl.labelShowingType = UILabelShowingType_02;
        _hl.elementDefaultSize = CGSizeMake(JobsWidth(43), JobsWidth(43));
        self.actionForHotLabel(_hl);
        _hl.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(13));
            make.size.mas_equalTo(JobsHotLabelBySingleLine.viewSizeByModel(self.hotLabelDataMutArr));
        });

        [self layoutIfNeeded];
        _hl.jobsRichViewByModel(self.hotLabelDataMutArr);
    };return _hl;
}

-(UIImageView *)leftIMGV{
    if (!_leftIMGV) {
        @jobs_weakify(self)
        _leftIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"客服_左线".img)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(51.6), JobsWidth(1)));
                    make.centerY.equalTo(self.subTitleLab);
                    make.right.equalTo(self.subTitleLab).offset(JobsWidth(-5));
                });
        });
    };return _leftIMGV;
}

-(UIImageView *)rightIMGV{
    if (!_rightIMGV) {
        @jobs_weakify(self)
        _rightIMGV = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(@"客服_右线".img)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(51.6), JobsWidth(1)));
                    make.centerY.equalTo(self.subTitleLab);
                    make.left.equalTo(self.subTitleLab).offset(JobsWidth(5));
                });
        });
    };return _rightIMGV;
}

@end
