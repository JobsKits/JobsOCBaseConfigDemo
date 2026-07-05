//
//  JobsSearchTableViewHeaderView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSearchTableViewHeaderView.h"

@interface JobsSearchTableViewHeaderView()

Prop_strong()UILabel *titleLab;
Prop_strong()UIButton *delBtn;

@end

@implementation JobsSearchTableViewHeaderView

-(instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.byBgColor(JobsWhiteColor);
    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if ([model isKindOfClass:UIViewModel.class]) {
            self.viewModel = model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {});
            self.titleLab.byText(self.viewModel.textModel.text);
            self.delBtn.byAlpha(0);
        }
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)viewHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 50.f;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(self.viewModel.textModel.textCor)
                .byFont(self.viewModel.textModel.font)
                .byTextAlignment(NSTextAlignmentLeft)
                .byBgColor(self.viewModel.bgCor)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.right.bottom.equalTo(self.contentView);
                    make.left.equalTo(self.contentView).offset(JobsWidth(10));
                });
        });
    };return _titleLab;
}

-(UIButton *)delBtn{
    if (!_delBtn) {
        @jobs_weakify(self)
        _delBtn = UIButton.jobsInit()
            .jobsResetBtnImage(@"垃圾箱".img)
            .onClickBy(^(UIButton *x) {
                @jobs_strongify(self)
                if(self.objBlock)self.objBlock(x);
            })
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(JobsWidth(25), JobsWidth(25)));
                make.right.equalTo(self.contentView).offset(-JobsWidth(10));
                make.centerY.equalTo(self.contentView);
            });
    };return _delBtn;
}

@end
