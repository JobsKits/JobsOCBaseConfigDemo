//
//  JobsAppDoorForgotCodeContentView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorForgotCodeContentView.h"

@class JobsAppDoorDoorInputViewBaseStyle;

@interface JobsAppDoorForgotCodeContentView ()
/// UI
Prop_strong()UILabel *titleLab;                    // 标题
Prop_strong()BaseButton *backToLoginBtn;           // 返回登录
Prop_strong()BaseButton *contactCustomerServiceBtn;// 联系客服按钮
Prop_strong()UILabel *subTitleLab;                 // 副标题
Prop_strong()JobsHotLabelBySingleLine *hl;
/// Data
Prop_strong()NSMutableArray <UIViewModel *>*hotLabelDataMutArr;

@end

@implementation JobsAppDoorForgotCodeContentView
#pragma mark —— Lifecycle
- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(Cor2);

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark —— BaseViewProtocol
/// 外层数据渲染
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable data) {
        @jobs_strongify(self)
        [self customerContact:^(CasinoCustomerContactModel *data) {
            @jobs_strongify(self)
            self.backToLoginBtn.byAlpha(1);

            self.titleLab.byAlpha(1);

            self.contactCustomerServiceBtn.byAlpha(1);

            if (self.hotLabelDataMutArr.count) {
                self.hl.byAlpha(1);

            }
        }];
    };
}
#pragma mark —— 网络请求
/// 获取客服联系方式
-(void)customerContact:(jobsByIDBlock _Nullable)block{

}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(Title10.tr)
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightRegularSize(20))
                .makeLabelByShowingType(UILabelShowingType_03)
                .byCenterX((self.width - self.backToLoginBtn.width) / 2)
                .byTop(JobsWidth(20))
                .addOn(self);
        });
    };return _titleLab;
}

-(BaseButton *)backToLoginBtn{
    if (!_backToLoginBtn) {
        @jobs_weakify(self)
        _backToLoginBtn = BaseButton.jobsInit()
            .bgColorBy(Cor1)
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetImagePadding(JobsWidth(8))
            .jobsResetBtnImage(@"用户名称".img)
            .jobsResetBtnBgImage(@"APPLY NOW".img)
            .jobsResetBtnTitleCor(Cor4)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(13))
            .jobsResetBtnTitle(@"APPLY NOW".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .byAlpha(0.7f)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.right.bottom.equalTo(self);
                make.width.mas_equalTo(btnWidth);
            });
        [self layoutIfNeeded];
        _backToLoginBtn.makeBtnTitleByShowingType(UILabelShowingType_05);
    };return _backToLoginBtn;
}

-(BaseButton *)contactCustomerServiceBtn{
    if (!_contactCustomerServiceBtn) {
        @jobs_weakify(self)
        _contactCustomerServiceBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnImage(@"zaixiankefu_en".img)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self endEditing:YES];
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(230), JobsWidth(50)));
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(15));
                make.centerX.equalTo(self.titleLab);
            });
    };return _contactCustomerServiceBtn;
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
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightMediumSize(12))
                .makeLabelByShowingType(UILabelShowingType_03)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.contactCustomerServiceBtn);
                    make.top.equalTo(self.contactCustomerServiceBtn.mas_bottom).offset(JobsWidth(56));
                    make.width.mas_equalTo(self.width - JobsWidth(80));
                });
        });
    };return _subTitleLab;
}

-(JobsHotLabelBySingleLine *)hl{
    if (!_hl) {
        _hl = JobsHotLabelBySingleLine.new;
        _hl.byBgColor(JobsClearColor);

        _hl.labelShowingType = UILabelShowingType_02;
        _hl.elementDefaultSize = CGSizeMake(JobsWidth(46), JobsWidth(46));
        self.actionForHotLabel(_hl);
        _hl.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.subTitleLab);
            make.top.equalTo(self.subTitleLab.mas_bottom).offset(JobsWidth(29));
            make.size.mas_equalTo(CGSizeMake(JobsWidth(250), JobsWidth(50)));
        });

        [self layoutIfNeeded];
        _hl.jobsRichViewByModel(self.hotLabelDataMutArr);
    };return _hl;
}
/**
    在 @interface NSObject (AppTools)<AppToolsProtocol>里
    对下列属性进行统一管理
    Prop_strong()NSMutableArray <UIViewModel *>*hotLabelDataMutArr;
    Prop_strong()BaiShaETProjCustomerContactModel *customerContactModel;
 */
//-(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
//    if (!_hotLabelDataMutArr) {
//        _hotLabelDataMutArr = NSMutableArray.array;
//
//        for (CasinoCustomerContactElementModel *element in self.customerContactModel.customerList) {
//            UIViewModel *vm = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
//
//            vm.requestParams = element;
//            vm.bgImageURLString = [This.BaseUrl stringByAppendingString:element.appIconUrl];
//            vm.text = @"".tr;
//            vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
//            vm.offsetXForEach = JobsWidth(46);
//            vm.offsetYForEach = JobsWidth(46);
//            [_hotLabelDataMutArr addObject:vm];
//        }
//
//    };return _hotLabelDataMutArr;
//}

@end
