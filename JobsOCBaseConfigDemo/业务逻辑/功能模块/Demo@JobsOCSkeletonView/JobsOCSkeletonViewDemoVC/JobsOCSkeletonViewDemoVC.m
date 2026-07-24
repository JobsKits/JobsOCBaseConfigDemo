//
//  JobsOCSkeletonViewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsOCSkeletonViewDemoVC.h"

@interface JobsOCSkeletonViewDemoVC ()

Prop_strong()NSArray <JobsOCSkeletonUser *>*userDataArr;
Prop_assign()BOOL loading;
Prop_assign()BOOL useGradientSkeleton;
Prop_assign()NSUInteger skeletonRowCount;
Prop_strong()UIButton *reloadBtn;
Prop_strong()UIButton *modeBtn;

@end

@implementation JobsOCSkeletonViewDemoVC
-(void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

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
            data.byText(@"JobsOCSkeletonView");
            data.byTextCor(HEXCOLOR(0x263342));
            data.byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.useGradientSkeleton = YES;
    self.skeletonRowCount = 8;
    self.userDataArr = @[];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        data.add(UIBarButtonItem.initBy(self.reloadBtn))
            .add(UIBarButtonItem.initBy(self.modeBtn));
    });
    self.tableView.byAlpha(1);
    [self startMockRequest];
}
#pragma mark —— Actions
-(void)startMockRequest{
    self.loading = YES;
    self.userDataArr = @[];
    [self.tableView reloadData];
    @jobs_weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        self.loading = NO;
        self.userDataArr = [JobsOCSkeletonUser mockUsersWithCount:16];
        self.tableView.byHideSkeletonAndReload();
    });
}

-(void)reloadDataAction{
    [self startMockRequest];
}

-(void)switchSkeletonMode{
    self.useGradientSkeleton = !self.useGradientSkeleton;
    [self updateModeButtonTitle];
    if (self.loading) [self.tableView reloadData];
}

-(void)updateModeButtonTitle{
    NSString *title = self.useGradientSkeleton ? @"扫光" : @"脉冲";
    self.modeBtn.jobsResetBtnTitle(title.tr);
}

-(JobsOCSkeletonConfig *)currentSkeletonConfig{
    JobsOCSkeletonConfig *config = self.useGradientSkeleton ? JobsOCSkeletonConfig.shimmerConfig : JobsOCSkeletonConfig.pulseConfig;
    if (self.useGradientSkeleton) {
        config.baseColor = HEXCOLOR(0xE7ECF3);
        config.highlightColor = HEXCOLOR(0xF9FBFF);
        config.animationDuration = 1.15;
    } else {
        config.baseColor = HEXCOLOR(0xE4E9F1);
        config.highlightColor = HEXCOLOR(0xE4E9F1);
        config.animationDuration = 0.85;
    }
    config.cornerRadius = -1;
    return config;
}

-(UIButton *)navButtonByTitle:(NSString *)title
                       action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(14))
            .jobsResetBtnTitleCor(HEXCOLOR(0x0A84FF))
            .onClickBy(action)
            .byFrame(CGRectMake(0, 0, JobsWidth(48), JobsWidth(32)));
    });
}
#pragma mark —— UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.loading ? self.skeletonRowCount : self.userDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsOCSkeletonUserCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsOCSkeletonUserCell.reuseIdentifier
                                                                   forIndexPath:indexPath];
    if (self.loading) {
        [cell showSkeletonWithConfig:self.currentSkeletonConfig];
    } else {
        [cell configureWithUser:self.userDataArr[indexPath.row]];
    };return cell;
}
#pragma mark —— UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(82);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}
#pragma mark —— LazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byRowHeight(JobsWidth(82))
                .byEstimatedRowHeight(JobsWidth(82))
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byDelegate(self)
                .byDataSource(self)
                .byShowsVerticalScrollIndicator(NO)
                .byBgColor(HEXCOLOR(0xF5F7FA));
            [tableView registerClass:JobsOCSkeletonUserCell.class
               forCellReuseIdentifier:JobsOCSkeletonUserCell.reuseIdentifier];
            tableView.resetContentInset(UIEdgeInsetsMake(JobsWidth(12), 0, JobsWidth(24), 0));
            tableView.addOn(self.view);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
                make.left.right.bottom.equalTo(self.view);
            }];
        });
    };return _tableView;
}

-(UIButton *)reloadBtn{
    if (!_reloadBtn) {
        @jobs_weakify(self)
        _reloadBtn = [self navButtonByTitle:@"重载"
                                     action:^(__kindof UIButton * _Nullable button) {
            [weak_self reloadDataAction];
        }];
    };return _reloadBtn;
}

-(UIButton *)modeBtn{
    if (!_modeBtn) {
        @jobs_weakify(self)
        _modeBtn = [self navButtonByTitle:@"扫光"
                                   action:^(__kindof UIButton * _Nullable button) {
            [weak_self switchSkeletonMode];
        }];
    };return _modeBtn;
}

@end
