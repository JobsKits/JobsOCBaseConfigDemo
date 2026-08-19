//
//  LeftCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LeftCell.h"

@interface LeftCell()
/// UI
Prop_strong()UIView *flagView;
Prop_strong()UILabel *titleLabel;

@end

@implementation LeftCell
/// UITableViewCellProtoco
UITableViewCellProtocol_Synthesize_part1
UITableViewCellProtocol_Synthesize_part2
/// UITextFieldProtocol
UITextFieldProtocol_synthesize_part2
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultByTableView{
    return ^(UITableView * _Nonnull tableView) {
        LeftCell *cell = JobsRegisterDequeueTableViewDefaultCell(LeftCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        self.titleLabel.byAlpha(1);
        self.flagView.byAlpha(1);
        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return LeftCell_Height;
    };
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]){
        self.bySelectionStyle(UITableViewCellSelectionStyleNone);
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LeftCell.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.printValue();
        /// 取内部类UITableViewCellEditControl,对编辑状态的Cell的点击按钮进行替换成自定义的
        self.customCellEditStateImage();
        self.modifySysChildViewFrame1();
        // 或者
        self.modifySysChildViewFrame2();
        if(self.accessoryView){
            self.accessoryView.resetOriginXByOffset(20);
        }
    };
}

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated{
    [super setSelected:selected
              animated:animated];
    if (selected){
        self.contentView.byBgColor(JobsTertiarySystemBackgroundColor);
        self.flagView.byBgColor(HEXCOLOR(0xAE8330));
        self.titleLabel.byTextCor(JobsLabelColor).byFont(UIFontWeightBoldSize(14));
    }else{
        self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.flagView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.titleLabel.byTextCor(JobsSecondaryLabelColor).byFont(UIFontWeightRegularSize(14));
    }
}

- (void)setHighlighted:(BOOL)highlighted
              animated:(BOOL)animated{
    if (highlighted){
        self.contentView.byBgColor(JobsTertiarySystemBackgroundColor);
        self.flagView.byBgColor(HEXCOLOR(0xAE8330));
        self.titleLabel.byTextCor(JobsLabelColor).byFont(UIFontWeightBoldSize(14));
    }else if (self.selected){
        self.contentView.byBgColor(JobsTertiarySystemBackgroundColor);
        self.flagView.byBgColor(HEXCOLOR(0xAE8330));
        self.titleLabel.byTextCor(JobsLabelColor).byFont(UIFontWeightBoldSize(14));
    }else{
        self.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.flagView.byBgColor(JobsSecondarySystemBackgroundColor);
        self.titleLabel.byTextCor(JobsSecondaryLabelColor).byFont(UIFontWeightRegularSize(14));
    }
}
#pragma mark —— lazyLoad
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        @jobs_weakify(self)
        _titleLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(bayonRegular(JobsWidth(14)))
                .byTextAlignment(NSTextAlignmentCenter)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(JobsWidth(5));
                make.right.equalTo(self.contentView).offset(JobsWidth(-5));
                make.centerY.equalTo(self.contentView);
            })
            .makeLabelByShowingType(UILabelShowingType_03);
        });
    }_titleLabel.byText(self.viewModel.textModel.text);
    return _titleLabel;
}

-(UIView *)flagView{
    if (!_flagView) {
        @jobs_weakify(self)
        _flagView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byFrame(CGRectMake(0,
                                    0,
                                    3,
                                    LeftCell_Height))
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.contentView);
        });
    };return _flagView;
}

@end
