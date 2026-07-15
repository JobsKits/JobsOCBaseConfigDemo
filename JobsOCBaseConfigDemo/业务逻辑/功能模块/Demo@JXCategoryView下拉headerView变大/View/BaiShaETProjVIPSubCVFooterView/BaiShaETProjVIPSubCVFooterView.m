//
//  BaiShaETProjVIPSubCVFooterView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaiShaETProjVIPSubCVFooterView.h"

@interface BaiShaETProjVIPSubCVFooterView ()

Prop_strong()BaseLabel *titleLab;

@end

@implementation BaiShaETProjVIPSubCVFooterView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.byBgColor(HEXCOLOR(0xFCFBFB));
        self.titleLab.byAlpha(1);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
/// UICollectionViewDelegateFlowLayout
+(JobsRetCGSizeByIDBlock _Nonnull)collectionReusableViewSizeByModel{
    return ^(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(50));
    };
}
#pragma mark —— lazyLoad
-(BaseLabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(self.viewModel.textModel.text);
            label.byFont(self.viewModel.textModel.font ? : UIFontWeightBoldSize(14));
            label.byTextCor(self.viewModel.textModel.textCor ? : HEXCOLOR(0xAE8330));
            label.byTextAlignment(NSTextAlignmentCenter);
            label.addOn(self).byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
        });
    };return _titleLab;
}

@end
