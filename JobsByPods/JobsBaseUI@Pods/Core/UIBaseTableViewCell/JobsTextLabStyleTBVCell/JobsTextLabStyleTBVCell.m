//
//  JobsTextLabStyleTBVCell.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTextLabStyleTBVCell.h"
#import <JobsBaseUI/UITableView+RegisterClass.h>
#import <JobsBaseUI/UIView+Extra.h>

@interface JobsTextLabStyleTBVCell ()

@end

@implementation JobsTextLabStyleTBVCell
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
-(void)layoutSubviews{
    [super layoutSubviews];
}
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsTextLabStyleTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsTextLabStyleTBVCell);
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel __kindof *_Nullable model) {
        @jobs_strongify(self)
        self.viewModel = model;
        self.label.byAlpha(1);

        return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsWidth(55);
    };
}
#pragma mark —— BaseViewProtocol
/// 获取绑定的数据源
-(UIViewModel *)getViewModel{
    return self.viewModel;
}
#pragma mark —— lazyLoad
@synthesize label = _label;
-(UILabel *)label{
    if (!_label) {
        @jobs_weakify(self)
        _label = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byLabelBlock(^(__kindof UILabel * _Nullable data) {
                    /// 富文本的优先级大于普通文本
                    if (self.viewModel.attributedTitle) {
                        data.byAttributedString(self.viewModel.attributedTitle);
                    } else {
                        data
                            .byText(self.viewModel.text)
                            .byNumberOfLines(0)
                            .byLineBreakMode(NSLineBreakByWordWrapping)
                            .byTextAlignment(self.viewModel.textAlignment)
                            .byTextCor(self.viewModel.textCor)
                            .byFont(self.viewModel.font);
                    }
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.contentView);
                });
        });
    };return _label;
}

@end
