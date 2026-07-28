//
//  JobsLoadMoreTBVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLoadMoreTBVCell.h"

@interface JobsLoadMoreTBVCell ()

Prop_strong()UILabel *titleLab;

@end

@implementation JobsLoadMoreTBVCell
#pragma mark —— BaseCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1ByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsLoadMoreTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(JobsLoadMoreTBVCell);
        cell
            .bySelectionStyle(UITableViewCellSelectionStyleNone)
            .byContentView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(JobsSecondarySystemBackgroundColor);
            });
        cell.byBgColor(JobsClearColor);
        return cell;
    };
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return JobsCommentConfig.sharedManager.cellHeight;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(id _Nullable model) {
        @jobs_strongify(self)
        self.titleLab.byAlpha(1);
        return self;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"点击加载更多".tr.add(@"..."))
                .byTextAlignment(NSTextAlignmentCenter)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(13))
                .byBgColor(JobsSecondarySystemBackgroundColor)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.contentView);
            });
        });
    };return _titleLab;
}

@end
