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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSkeletonViewDemoVC
@interface JobsOCSkeletonViewDemoVC (JobsPropertyDSLSetterAutogen_d02745f49c)
-(void)setLoading:(BOOL)data;
-(void)setSkeletonRowCount:(NSUInteger)data;
-(void)setUseGradientSkeleton:(BOOL)data;
-(void)setUserDataArr:(NSArray <JobsOCSkeletonUser *>* _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSkeletonViewDemoVC

@implementation JobsOCSkeletonViewDemoVC
-(void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSkeletonViewDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(@"JobsOCSkeletonView")
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightRegularSize(18));
            })
            .byBgCor(HEXCOLOR(0xF5F7FA))
            .byNavBgCor(HEXCOLOR(0xF5F7FA));
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSkeletonViewDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.byUseGradientSkeleton(YES);
        self.bySkeletonRowCount(8);
        self.byUserDataArr(@[]);
        self.makeNavByAlpha(1);
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.byRightBarButtonItems(jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
            data.add(UIBarButtonItem.initBy(self.reloadBtn))
                .add(UIBarButtonItem.initBy(self.modeBtn));
        }));
        self.tableView.byAlpha(1);
        self.startMockRequest();
    };
}
#pragma mark —— Actions
-(jobsByVoidBlock _Nonnull)startMockRequest{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byLoading(YES);
        self.byUserDataArr(@[]);
        [self.tableView reloadData];
        @jobs_weakify(self)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            self.byLoading(NO);
            self.byUserDataArr(JobsOCSkeletonUser.mockUsersWithCount(16));
            self.tableView.byHideSkeletonAndReload();
        });
    };
}

-(jobsByVoidBlock _Nonnull)reloadDataAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.startMockRequest();
    };
}

-(jobsByVoidBlock _Nonnull)switchSkeletonMode{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byUseGradientSkeleton(!self.useGradientSkeleton);
        self.updateModeButtonTitle();
        if (self.loading) [self.tableView reloadData];
    };
}

-(jobsByVoidBlock _Nonnull)updateModeButtonTitle{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *title = self.useGradientSkeleton ? @"扫光" : @"脉冲";
        self.modeBtn.jobsResetBtnTitle(title.jobsTr());
    };
}

-(JobsRetJobsOCSkeletonConfigByVoidBlock _Nonnull)currentSkeletonConfig{
    @jobs_weakify(self)
    return ^JobsOCSkeletonConfig *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsOCSkeletonConfig *config = self.useGradientSkeleton ? JobsOCSkeletonConfig.shimmerConfig() : JobsOCSkeletonConfig.pulseConfig();
        if (self.useGradientSkeleton) {
            config.byBaseColor(HEXCOLOR(0xE7ECF3));
            config.byHighlightColor(HEXCOLOR(0xF9FBFF));
            config.byAnimationDuration(1.15);
        } else {
            config.byBaseColor(HEXCOLOR(0xE4E9F1));
            config.byHighlightColor(HEXCOLOR(0xE4E9F1));
            config.byAnimationDuration(0.85);
        }
        config.byCornerRadius(-1);
        return config;
    };
}

-(UIButton *)navButtonByTitle:(NSString *)title
                       action:(jobsByBtnBlock)action{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.jobsTr())
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
    JobsOCSkeletonUserCell *cell = [tableView dequeueReusableCellWithIdentifier:[JobsOCSkeletonUserCell reuseIdentifier]()
                                                                   forIndexPath:indexPath];
    if (self.loading) {
        cell.showSkeletonWithConfig(self.currentSkeletonConfig());
    } else {
        cell.configureWithUser(self.userDataArr[indexPath.row]);
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
                .byBgColor(JobsSecondarySystemBackgroundColor);
            [tableView registerClass:JobsOCSkeletonUserCell.class
               forCellReuseIdentifier:[JobsOCSkeletonUserCell reuseIdentifier]()];
            tableView
                .resetContentInset(UIEdgeInsetsMake(JobsWidth(12), 0, JobsWidth(24), 0))
                .addOn(self.view);
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
            weak_self.reloadDataAction();
        }];
    };return _reloadBtn;
}

-(UIButton *)modeBtn{
    if (!_modeBtn) {
        @jobs_weakify(self)
        _modeBtn = [self navButtonByTitle:@"扫光"
                                   action:^(__kindof UIButton * _Nullable button) {
            weak_self.switchSkeletonMode();
        }];
    };return _modeBtn;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSkeletonViewDemoVC
-(JobsRetJobsOCSkeletonViewDemoVCByBOOLBlock _Nonnull)byLoading{
    @jobs_weakify(self)
    return ^__kindof JobsOCSkeletonViewDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setLoading:data];
        return self;
    };
}

-(JobsRetJobsOCSkeletonViewDemoVCByBOOLBlock _Nonnull)byUseGradientSkeleton{
    @jobs_weakify(self)
    return ^__kindof JobsOCSkeletonViewDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setUseGradientSkeleton:data];
        return self;
    };
}

-(JobsRetJobsOCSkeletonViewDemoVCByNSArrayJobsOCSkeletonUserBlock _Nonnull)byUserDataArr{
    @jobs_weakify(self)
    return ^__kindof JobsOCSkeletonViewDemoVC * _Nullable(NSArray <JobsOCSkeletonUser *>* _Nullable data){
        @jobs_strongify(self)
        [self setUserDataArr:data];
        return self;
    };
}

-(JobsRetJobsOCSkeletonViewDemoVCByNSUIntegerBlock _Nonnull)bySkeletonRowCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCSkeletonViewDemoVC * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setSkeletonRowCount:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSkeletonViewDemoVC
@end
