//
//  JobsTimerDemoListVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsTimerDemoListVC.h"

static NSString *const JobsTimerDemoListCellReuseIdentifier = @"JobsTimerDemoListCell";

typedef NS_ENUM(NSInteger, JobsTimerDemoListSection) {
    JobsTimerDemoListSectionJobsOCTimer = 0,
    JobsTimerDemoListSectionJobsOCTimerMgr
};

@interface JobsTimerDemoListVC (){
    UITableView *_jobsTimerTableView;
}

Prop_strong()UITextView *relationTextView;
Prop_strong()NSArray <NSArray <UIViewModel *>*>*demoGroupArr;
Prop_strong()NSArray <NSString *>*sectionTitleArr;

-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls;
-(void)pushDemoViewModel:(UIViewModel *)viewModel;
-(NSString *)relationText;

@end

@implementation JobsTimerDemoListVC

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"JobsOCTimer".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.tableView.byVisible(YES);
    self.relationTextView.byVisible(YES);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.demoGroupArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.demoGroupArr[section].count;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{
    return JobsWidth(38);
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(64);
}

-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    return self.sectionTitleArr[section];
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsTimerDemoListCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsTimerDemoListCellReuseIdentifier];
    }
    UIViewModel *viewModel = self.demoGroupArr[indexPath.section][indexPath.row];
    return cell
        .byTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.textModel.attributedTitle.string ?: viewModel.textModel.text)
                .byFont(UIFontWeightMediumSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byDetailTextLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(viewModel.subTextModel.attributedTitle.string ?: viewModel.subTextModel.text)
                .byFont(UIFontWeightRegularSize(12))
                .byTextCor(HEXCOLOR(0x8A93A1));
        })
        .byAccessoryType(UITableViewCellAccessoryDisclosureIndicator)
        .bySelectionStyle(UITableViewCellSelectionStyleDefault);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
    [self pushDemoViewModel:self.demoGroupArr[indexPath.section][indexPath.row]];
}
#pragma mark —— 一些私有方法
-(UIViewModel *)demoViewModelWithTitle:(NSString *)title
                              subTitle:(NSString *)subTitle
                                   cls:(Class)cls{
    return self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
        model.byTitle(title.tr)
            .bySubTitle(subTitle.tr)
            .byCls(cls);
    }));
}

-(void)pushDemoViewModel:(UIViewModel *)viewModel{
    if (viewModel.cls) {
        self.comingToPushVCByRequestParams(viewModel.cls.new,
                                           viewModel);
    }else @"尚未接入此功能".tr.toast();
}

-(NSString *)relationText{
    return @"JobsOCTimer 是单个计时任务：你直接持有一个 JobsTimer，配置 timerType、timerStyle、interval、startTime、tick 和 finish，适合一个页面里明确的一件计时工作。\n\nJobsOCTimer 的衍生品会把 JobsTimer 包进具体 UI，例如 JobsCountdownView 和 UIButton+JobsTimer，让业务只关心显示和点击。\n\nJobsOCTimerMgr 是多个 JobsTimer 的统一注册表：用 identifier 管理 timer，适合多个模块要集中 start / pause / resume / stop，或需要统一处理前后台策略的场景。";
}
#pragma mark —— lazyLoad
-(UITableView *)tableView{
    if (!_jobsTimerTableView) {
        @jobs_weakify(self)
        _jobsTimerTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byRowHeight(JobsWidth(64))
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .bySectionHeaderTopPadding(0)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsWidth(10), 0))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.bottom.equalTo(self.relationTextView.mas_top).offset(-JobsWidth(10));
                });
        });
    };return _jobsTimerTableView;
}

-(UITextView *)relationTextView{
    if (!_relationTextView) {
        @jobs_weakify(self)
        _relationTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            textView.byText(self.relationText.tr)
                .byTextColor(HEXCOLOR(0x5F6B7A))
                .byFont(UIFontWeightRegularSize(13))
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(12), JobsWidth(12), JobsWidth(12), JobsWidth(12)))
                .byBgColor(JobsWhiteColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(16));
                    make.right.equalTo(self.view).offset(-JobsWidth(16));
                    make.bottom.equalTo(self.view).offset(-(JobsBottomSafeAreaHeight() + JobsWidth(12)));
                    make.height.mas_equalTo(JobsWidth(178));
                });
        });
    };return _relationTextView;
}

-(NSArray<NSArray<UIViewModel *> *> *)demoGroupArr{
    if (!_demoGroupArr) {
        _demoGroupArr = @[
            @[
                [self demoViewModelWithTitle:@"JobsTimer / JobsCountdownView"
                                    subTitle:@"单个 JobsTimer 的 start、pause、resume、stop 和倒计时视图"
                                         cls:JobsTimerVC.class],
                [self demoViewModelWithTitle:@"倒计时按钮"
                                    subTitle:@"UIButton+JobsTimer：验证码、重发、支付等待"
                                         cls:JobsCountdownButtonDemoVC.class]
            ],
            @[
                [self demoViewModelWithTitle:@"JobsOCTimerMgr 多任务管理"
                                    subTitle:@"按 identifier 统一注册、启动、暂停、恢复和移除多个 Timer"
                                         cls:JobsOCTimerMgrDemoVC.class]
            ]
        ];
    };return _demoGroupArr;
}

-(NSArray<NSString *> *)sectionTitleArr{
    if (!_sectionTitleArr) {
        _sectionTitleArr = @[
            @"JobsOCTimer".tr,
            @"JobsOCTimerMgr".tr
        ];
    };return _sectionTitleArr;
}

@end
