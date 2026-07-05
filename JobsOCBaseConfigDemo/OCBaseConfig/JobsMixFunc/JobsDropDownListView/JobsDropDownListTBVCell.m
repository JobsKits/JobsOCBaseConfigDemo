//
//  JobsDropDownListTBVCell.m
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsDropDownListTBVCell.h"
#import "UIView+Extra.h"
#import "UITableView+RegisterClass.h"

@interface JobsDropDownListTBVCell ()

@end

@implementation JobsDropDownListTBVCell
/// UITableViewCellProtocol
UITableViewCellProtocol_Synthesize
#pragma mark —— UITableViewCellProtocol
+(JobsRetTableViewCellByTableViewBlock _Nonnull)cellStyleValue1ByTableView{
    return ^(UITableView * _Nonnull tableView) {
        JobsDropDownListTBVCell *cell = (JobsDropDownListTBVCell *)tableView.tableViewCellClass(JobsDropDownListTBVCell.class,@"");
        if (!cell) {
            cell = JobsDropDownListTBVCell.initTableViewCellWithStyle(UITableViewCellStyleValue1);
        };return cell;
    };
}
#pragma mark —— BaseCellProtocol
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.jobsRichElementsTableViewCellBy(nil);
        self
            .bySelectionStyle(UITableViewCellSelectionStyleNone)// 取消点击效果 【不能在cellStyleValue1ByTableView里面写】
            .byContentView(^(__kindof UIView * _Nullable view) {
                view.byBgColor(JobsWhiteColor);
            })
            .bySelectedBackgroundView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                view
                    .byFrame(self.frame)// 这句不可省略
                    .byBgColor(HEXCOLOR(0xFFE8B5));
            }))
            .byBgColor(JobsWhiteColor);
    };return self;
}

-(JobsRetTableViewCellByIDBlock _Nonnull)jobsRichElementsTableViewCellBy{
    @jobs_weakify(self)
    return ^__kindof UITableViewCell *_Nullable(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        if (model) {
            self.viewModel = model;
            self.textLabel
                .byText([NSString stringWithFormat:@"%@",model.textModel.text])
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(HEXCOLOR(0x2F3645));

            self.detailTextLabel
                .byText([NSString stringWithFormat:@"%@",model.subTextModel.text])
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x8A93A1));

        };return self;
    };
}

+(JobsRetCGFloatByIDBlock _Nonnull)cellHeightByModel{
    return ^CGFloat(UIViewModel *_Nullable model){
        UIViewModel *vm = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byFont(UIFontWeightRegularSize(14));
            data.byJobsWidth(JobsMainScreen_WIDTH() - JobsWidth(200));
            data.textModel.byText(data.subTextModel.text)
                          .byTextLineSpacing(0);
        });return jobsMakeView(^(__kindof UIView * _Nullable view) {
            /// 仅用于高度测量
        }).heightByData(model ? : vm) + JobsWidth(20);
    };
}

@end
