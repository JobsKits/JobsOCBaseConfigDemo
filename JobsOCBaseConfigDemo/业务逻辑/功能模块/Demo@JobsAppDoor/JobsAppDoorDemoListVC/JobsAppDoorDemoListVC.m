//
//  JobsAppDoorDemoListVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月25日，星期六.
//

#import "JobsAppDoorDemoListVC.h"

@interface JobsAppDoorDemoListVC ()

Prop_strong()UITableView *demoTableView;
Prop_strong()NSArray <UIViewModel *>*demoArr;

-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls
                         requestParams:(nullable id)requestParams;
-(void)pushDemoViewModel:(UIViewModel *)viewModel;

@end

@implementation JobsAppDoorDemoListVC
-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr)
                .byTextCor(JobsLabelColor);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsAppDoor".tr)
                .byFont(UIFontWeightRegularSize(17))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemGroupedBackgroundColor);
    self.makeNavByAlpha(1);
    self.demoTableView.byVisible(YES);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.demoArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(78);
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = JobsRegisterDequeueTableViewSubtitleCell(UITableViewCell);
    UIViewModel *viewModel = self.demoArr[indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text)
                .byFont(UIFontWeightMediumSize(16))
                .byTextCor(JobsLabelColor);
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text)
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(JobsSecondaryLabelColor);
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [self pushDemoViewModel:self.demoArr[indexPath.row]];
}
#pragma mark —— 一些私有方法
-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls
                         requestParams:(nullable id)requestParams{
    return self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(title.tr)
            .bySubTitle(subTitle.tr)
            .byCls(cls)
            .byRequestParams(requestParams);
    }));
}

-(void)pushDemoViewModel:(UIViewModel *)viewModel{
    if (viewModel.cls) {
        self.comingToPushVCByRequestParams(viewModel.cls.new,
                                           viewModel);
    }else @"尚未接入此功能".tr.toast();
}
#pragma mark —— LazyLoad
-(UITableView *)demoTableView{
    if (!_demoTableView) {
        @jobs_weakify(self)
        _demoTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(JobsSeparatorColor)
                .byRowHeight(JobsWidth(78))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(16), 0, JobsWidth(16), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.bottom.equalTo(self.view);
                });
        });
    };return _demoTableView;
}

-(NSArray<UIViewModel *> *)demoArr{
    if (!_demoArr) {
        JobsAppDoorConfig *style1Config = JobsAppDoorConfig.fullConfig;
        style1Config.registerConfig.graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.numberAndEnglishConfig;
        JobsAppDoorConfig *style2Config = JobsAppDoorConfig.fullConfig;
        style2Config.registerConfig.graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.allCharactersConfig;
        _demoArr = @[
            [self demoViewModelWithTitle:@"JobsAppDoor-1"
                                subTitle:@"登录注册的第一种表现形式"
                                     cls:JobsAppDoorVC.class
                           requestParams:style1Config],
            [self demoViewModelWithTitle:@"JobsAppDoor-2"
                                subTitle:@"登录注册的第二种表现形式"
                                     cls:JobsAppDoorVC_Style2.class
                           requestParams:style2Config]
        ];
    };return _demoArr;
}

@end
