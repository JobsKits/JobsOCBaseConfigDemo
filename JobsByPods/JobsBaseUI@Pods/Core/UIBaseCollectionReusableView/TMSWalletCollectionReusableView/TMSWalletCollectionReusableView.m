//
//  TMSWalletCollectionReusableView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TMSWalletCollectionReusableView.h"
#import <JobsBaseUI/UIView+Extra.h>

@interface TMSWalletCollectionReusableView ()

@end

@implementation TMSWalletCollectionReusableView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.byBgColor(JobsBlueColor);
    };return self;
}
#pragma mark —— BaseViewProtocol
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
        self.label.byAlpha(1);
    };
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byFont(UIFontWeightRegularSize(14))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.equalTo(self).offset(JobsWidth(15));
                    make.centerY.equalTo(self);
                });
        });
    };return _label.byText(self.viewModel.textModel.text);
}

@end
