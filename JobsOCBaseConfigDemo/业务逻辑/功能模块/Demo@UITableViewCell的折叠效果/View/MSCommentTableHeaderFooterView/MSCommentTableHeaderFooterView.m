//
//  MSCommentTableHeaderFooterView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MSCommentTableHeaderFooterView.h"

@interface MSCommentTableHeaderFooterView ()
/// UI
Prop_strong()UIView *accentView;
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *subTitleLab;
Prop_strong()UILabel *foldStateLab;
Prop_strong()UILabel *foldIconLab;

@end

@implementation MSCommentTableHeaderFooterView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.byBgColor(HEXCOLOR(0xFFF7ED));
        self.textLabel.byHidden(YES);
        self.accentView.byAlpha(1);
        self.titleLab.byAlpha(1);
        self.subTitleLab.byAlpha(1);
        self.foldStateLab.byAlpha(1);
        self.foldIconLab.byAlpha(1);
    };return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.byHidden(YES);
    // 解决当UITableViewHeaderFooterView悬浮的时候背景白色的问题（设置成透明色）
    // 遍历子视图，找到UIVisualEffectView
    for (UIView *subview in self.subviews) {
        if([subview isKindOfClass:NSClassFromString(UISystemBackgroundView)]){
            // subview.backgroundColor = JobsClearColor; 设置成透明色，无效
            subview.jobsVisible = NO;
        }
    }
}
#pragma mark —— BaseViewProtocol
-(void)jobsRichViewByCommentModel:(MSCommentModel *)commentModel
                           folded:(BOOL)folded{
    NSInteger count = commentModel.commentDataMutArr.count;
    self.titleLab.byText(commentModel.sectionTitle);
    self.subTitleLab.byText(commentModel.sectionSubTitle);
    self.foldStateLab
        .byText([NSString stringWithFormat:folded ? @"已收起 · %ld条".tr : @"展开中 · %ld条".tr, (long)count])
        .byTextCor(folded ? HEXCOLOR(0x3730A3) : HEXCOLOR(0x9A3412));
    self.foldIconLab
        .byText(folded ? @"+" : @"-")
        .byBgColor(folded ? HEXCOLOR(0x4F46E5) : HEXCOLOR(0xF97316));
    self.contentView.byBgColor(folded ? HEXCOLOR(0xEEF2FF) : HEXCOLOR(0xFFF7ED));
    self.accentView.byBgColor(folded ? HEXCOLOR(0x4F46E5) : HEXCOLOR(0xF97316));
}
/// 由具体的子类进行覆写
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:UIViewModel.class]){
            self.viewModel = model;
            self.textLabel.byText(self.viewModel.textModel.text);
            self.textLabel.byTextCor(self.viewModel.textModel.textCor);
            self.textLabel.byFont(self.viewModel.textModel.font);
        }
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)heightForHeaderInSection{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(72);
    };
}
#pragma mark —— lazyLoad
-(UIView *)accentView{
    if (!_accentView) {
        @jobs_weakify(self)
        _accentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(HEXCOLOR(0xF97316))
                .byCornerRadius(JobsWidth(2))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(15));
                    make.centerY.equalTo(self.contentView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(4), JobsWidth(42)));
                });
        });
    };return _accentView;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightBoldSize(16))
                .byNumberOfLines(1)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.accentView.mas_right).offset(JobsWidth(10));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(145));
                    make.top.equalTo(self.contentView).offset(JobsWidth(14));
                    make.height.mas_equalTo(JobsWidth(22));
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
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(1)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.titleLab);
                    make.right.equalTo(self.contentView).offset(-JobsWidth(47));
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(2));
                    make.height.mas_equalTo(JobsWidth(18));
                });
        });
    };return _subTitleLab;
}

-(UILabel *)foldStateLab{
    if (!_foldStateLab) {
        @jobs_weakify(self)
        _foldStateLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(HEXCOLOR(0x9A3412))
                .byFont(UIFontWeightMediumSize(12))
                .byTextAlignment(NSTextAlignmentRight)
                .byNumberOfLines(1)
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView).offset(-JobsWidth(47));
                    make.top.equalTo(self.contentView).offset(JobsWidth(15));
                    make.width.mas_equalTo(JobsWidth(92));
                    make.height.mas_equalTo(JobsWidth(20));
                });
        });
    };return _foldStateLab;
}

-(UILabel *)foldIconLab{
    if (!_foldIconLab) {
        @jobs_weakify(self)
        _foldIconLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsWhiteColor)
                .byFont(UIFontWeightBoldSize(18))
                .byTextAlignment(NSTextAlignmentCenter)
                .byBgColor(HEXCOLOR(0xF97316))
                .byCornerRadius(JobsWidth(12))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self.contentView).offset(-JobsWidth(15));
                    make.centerY.equalTo(self.contentView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(24), JobsWidth(24)));
                });
        });
    };return _foldIconLab;
}

@end
