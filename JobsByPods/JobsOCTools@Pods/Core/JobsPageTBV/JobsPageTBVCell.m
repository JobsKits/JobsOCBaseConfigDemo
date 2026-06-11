//
//  JobsPageTBVCell.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPageTBVCell.h"

@interface JobsPageTBVCell ()

Prop_strong()UILabel *textLab;

@end

@implementation JobsPageTBVCell
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleSubtitleWithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsPageTBVCell *cell = (JobsPageTBVCell *)tableView.tableViewCellClass(JobsPageTBVCell.class,@"");
        if (!cell) {
            cell = JobsPageTBVCell.initTableViewCellWithStyle(UITableViewCellStyleSubtitle);
    //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.byBgColor(cell.contentView.backgroundColor = JobsClearColor);

        };return cell;
    };
}
#pragma mark —— BaseCellProtocol
-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.textLab.byTextCor(model.textModel.textCor);
            self.textLab.byText(model.textModel.text);
            self.textLab.byFont(model.textModel.font);
            self.textLab.byBgColor(model.bgCor);
        //    self.imageView.image = (UIImage *)model[@"image"];
        };return self;
    };
}

-(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(id _Nullable data){
        return 0.f;
    };
}
#pragma mark —— lazyLoad
-(UILabel *)textLab{
    if (!_textLab) {
        @jobs_weakify(self)
        _textLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.contentView);
                });
        });
    };return _textLab;
}

@end
