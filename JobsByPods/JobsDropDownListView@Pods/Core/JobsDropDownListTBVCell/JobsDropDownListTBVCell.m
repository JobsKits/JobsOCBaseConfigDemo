//
//  JobsDropDownListTBVCell.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDropDownListTBVCell.h"
#import <JobsDropDownListView/UIView+Extra.h>
#import <JobsDropDownListView/UITableView+RegisterClass.h>

@interface JobsDropDownListTBVCell ()

@end

@implementation JobsDropDownListTBVCell
/// UITableViewCellProtocol
UITableViewCellProtocol_Synthesize
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1WithTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsDropDownListTBVCell *cell = (JobsDropDownListTBVCell *)tableView.tableViewCellClass(JobsDropDownListTBVCell.class,@"");
        if (!cell) {
            cell = JobsDropDownListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleValue1);
        }return cell;
    };
}
#pragma mark —— BaseCellProtocol
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.jobsRichElementsTableViewCellBy(nil);
        self.selectionStyle = UITableViewCellSelectionStyleNone;// 取消点击效果 【不能在cellStyleValue1WithTableView里面写】
        self.backgroundColor = self.contentView.backgroundColor = HEXCOLOR(0xFBF7E3);
        self.selectedBackgroundView = [UIView.alloc initWithFrame:self.frame];// 这句不可省略
        self.selectedBackgroundView.backgroundColor = HEXCOLOR(0xE4B94B);
    }return self;
}

-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.viewModel = model;
            self.textLabel.text = [NSString stringWithFormat:@"%@",model.textModel.text];
            self.detailTextLabel.text = [NSString stringWithFormat:@"%@",model.subTextModel.text];
        }return self;
    };
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(UIViewModel *_Nullable model){
        UIViewModel *vm = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byFont(UIFontWeightRegularSize(14));
            data.byJobsWidth(JobsMainScreen_WIDTH() - JobsWidth(200));
            data.textModel.byText(data.subTextModel.text)
                          .byTextLineSpacing(0);
        });return UIView.new.heightByData(model ? : vm) + JobsWidth(20);
    };
}

@end
