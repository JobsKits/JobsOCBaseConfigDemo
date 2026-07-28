//
//  MSCommentTBVCell.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MSCommentTBVCell.h"

@interface MSCommentTBVCell ()
/// UI
Prop_strong()UILabel *titleLab;
/// Data
Prop_strong()MSCommentDetailModel *commentDetailModel;

@end

@implementation MSCommentTBVCell
/// UITableViewCellProtocol
UITableViewCellProtocol_Synthesize_part2
/// UIViewModelProtocol
UIViewModelProtocol_synthesize_part1
UIViewModelProtocol_synthesize_part2
/// BaseLayerProtocol
BaseLayerProtocol_synthesize_part3
#pragma mark —— BaseCellProtocol
/// UITableViewCell
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleDefaultByTableView{
    return ^(UITableView * _Nonnull tableView) {
        MSCommentTBVCell *cell = JobsRegisterDequeueTableViewDefaultCell(MSCommentTBVCell);
        cell.offsetXForEach = JobsWidth(7);
        cell.offsetYForEach = JobsWidth(3);
        cell.byBgColor(JobsClearColor);
        cell.contentView.byBgColor(JobsSecondarySystemBackgroundColor);
        cell.cornerCutToCircleWithCornerRadius(JobsWidth(8));
        return cell;
    };
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(MSCommentDetailModel *_Nullable model) {
        @jobs_strongify(self)
        if([model isKindOfClass:MSCommentDetailModel.class]){
            self.commentDetailModel = model;
            self.titleLab
                .byText(model.rowTitle)
                .byAlpha(1);
        };return self;
    };
}
/// 具体由子类进行复写【数据定高】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    @jobs_weakify(self)
    return ^CGFloat(MSCommentDetailModel *_Nullable data){
        @jobs_strongify(self)
        return [self jobsGetLabelHeightByWidth:JobsWidth(305)
                                         title:data.rowTitle
                                          font:UIFontWeightRegularSize(14)] + JobsWidth(34);
    };
}
// 在具体的子类去实现,分类调用异常
-(void)setFrame:(CGRect)frame{
    JobsLog(@"self.offsetXForEach = %f",self.offsetXForEach);
    JobsLog(@"self.offsetYForEach = %f",self.offsetYForEach);
    frame.origin.x += self.offsetXForEach;
    frame.origin.y += self.offsetYForEach;
    frame.size.height -= self.offsetYForEach * 2;
    frame.size.width -= self.offsetXForEach * 2;
    [super setFrame:frame];
}
#pragma mark —— lazyLoad
-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(JobsWidth(5),
                                                                                      JobsWidth(18),
                                                                                      JobsWidth(5),
                                                                                      JobsWidth(18)));
                });
        });
    };return _titleLab;
}

@end
