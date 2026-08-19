//
//  JobsMultiTimerTableDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsMultiTimerTableDemoVC.h"

static NSString *const JobsMultiTimerTableDemoCellReuseIdentifier = @"JobsMultiTimerTableDemoCell";
static NSString *const JobsMultiTimerTableDemoIdentifierKey = @"identifier";
static NSString *const JobsMultiTimerTableDemoTitleKey = @"title";
static NSString *const JobsMultiTimerTableDemoRemainKey = @"remain";
static NSString *const JobsMultiTimerTableDemoDoneKey = @"done";
static NSString *const JobsMultiTimerTableDemoEndAtKey = @"endAt";
static NSString *const JobsMultiTimerTableDemoTickKey = @"tick";
static NSString *const JobsMultiTimerWisdomCellReuseIdentifier = @"JobsMultiTimerWisdomCell";
static NSString *const JobsMultiTimerWisdomTitleKey = @"title";
static NSString *const JobsMultiTimerWisdomDetailKey = @"detail";

@interface JobsMultiTimerTableDemoVC (){
    UITableView *_multiTimerTableView;
}

Prop_strong()NSMutableArray<NSMutableDictionary<NSString *, id> *>*dataMutArr;
Prop_copy()NSString *timerScopeIdentifier;
Prop_strong()UIButton *wisdomActionBtn;
Prop_strong()UIView *wisdomOverlayView;
Prop_strong()UITableView *wisdomTableView;
Prop_strong()NSArray<NSDictionary<NSString *, NSString *> *>*wisdomItems;
Prop_assign()BOOL wisdomListVisible;

-(jobsByVoidBlock _Nonnull)setupRows;
-(jobsByVoidBlock _Nonnull)setupTimers;
-(jobsByVoidBlock _Nonnull)refreshCountdownModels;
-(jobsByVoidBlock _Nonnull)stopAndRemoveTimerScope;
-(jobsByVoidBlock _Nonnull)showWisdomList;
-(jobsByVoidBlock _Nonnull)hideWisdomList;
-(void)updateIdentifier:(NSString *)identifier
          expectedTimer:(JobsTimer *)expectedTimer;
-(JobsRetNSIndexPathByNSStringBlock _Nonnull)indexPathForIdentifier;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsMultiTimerTableDemoVC
@interface JobsMultiTimerTableDemoVC (JobsPropertyDSLSetterAutogen_970f1d4c71)
-(void)setWisdomListVisible:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsMultiTimerTableDemoVC

@implementation JobsMultiTimerTableDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    self.stopAndRemoveTimerScope();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMultiTimerTableDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"时时彩".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
        self.byRightBarButtonItems([@[
            [UIBarButtonItem.alloc initWithCustomView:self.wisdomActionBtn]
        ] mutableCopy]);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMultiTimerTableDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        [JobsThemeCenter.shared
            bindObject:self
                  slot:@"JobsMultiTimerTableDemoVC.wisdomList"
                 apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            (void)center;
            JobsMultiTimerTableDemoVC *viewController = (JobsMultiTimerTableDemoVC *)object;
            if (!viewController.wisdomListVisible) return;
            viewController.wisdomTableView.byBgColor(JobsSecondarySystemBackgroundColor);
            [viewController.wisdomTableView reloadData];
        }];
        self.setupRows();
        self.tableView.byVisible(YES);
        self.setupTimers();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMultiTimerTableDemoVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.refreshCountdownModels();
        (JobsTimerMgr.shared()).resumeScope(self.timerScopeIdentifier);
        [self.tableView reloadData];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMultiTimerTableDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.hideWisdomList();
        (JobsTimerMgr.shared()).pauseScope(self.timerScopeIdentifier);
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)showWisdomList{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byWisdomListVisible(YES);
        self.wisdomOverlayView
            .byBgColor(RGBA_COLOR(0, 0, 0, 0.35))
            .byHidden(NO);
        self.wisdomTableView.byBgColor(JobsSecondarySystemBackgroundColor);
        [self.wisdomTableView reloadData];
        self.view.byBringSubviewToFront(self.wisdomOverlayView);
    };
}

-(jobsByVoidBlock _Nonnull)hideWisdomList{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byWisdomListVisible(NO);
        _wisdomOverlayView.byHidden(YES);
    };
}

-(jobsByVoidBlock _Nonnull)setupRows{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.dataMutArr removeAllObjects];
        NSArray<NSNumber *>*tickArr = @[@0.5, @1.0, @1.0, @2.0];
        for (NSUInteger idx = 0; idx < 60; idx++) {
            NSInteger remain = 8 + (NSInteger)((idx * 7) % 293);
            CGFloat tick = tickArr[idx % tickArr.count].doubleValue;
            NSString *identifier = [NSString stringWithFormat:@"jobs.demo.multiTimer.%lu",(unsigned long)idx];
            [self.dataMutArr addObject:@{
                JobsMultiTimerTableDemoIdentifierKey : identifier,
                JobsMultiTimerTableDemoTitleKey : [NSString stringWithFormat:@"Row #%lu  (tick:%.1fs, remain:%lds)",(unsigned long)idx,tick,(long)remain],
                JobsMultiTimerTableDemoRemainKey : @(remain),
                JobsMultiTimerTableDemoDoneKey : @(NO),
                JobsMultiTimerTableDemoEndAtKey : [NSDate dateWithTimeIntervalSinceNow:remain],
                JobsMultiTimerTableDemoTickKey : @(tick)
            }.mutableCopy];
        }
    };
}

-(jobsByVoidBlock _Nonnull)setupTimers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        for (NSUInteger idx = 0; idx < self.dataMutArr.count; idx++) {
            NSMutableDictionary<NSString *, id> *item = self.dataMutArr[idx];
            NSString *identifier = item[JobsMultiTimerTableDemoIdentifierKey];
            NSTimeInterval remain = MAX(0, ceil([item[JobsMultiTimerTableDemoEndAtKey] timeIntervalSinceNow]));
            NSTimeInterval tick = [item[JobsMultiTimerTableDemoTickKey] doubleValue];
            if (remain <= 0) {
                item[JobsMultiTimerTableDemoRemainKey] = @(0);
                item[JobsMultiTimerTableDemoDoneKey] = @(YES);
                continue;
            }
            JobsTimerMgr *manager = JobsTimerMgr.shared();
            manager
                .byUpsertScopedTimer(identifier,
                                     self.timerScopeIdentifier,
                                     JobsTimerTypeGCD,
                                     JobsTimerBackgroundPolicyPauseAndResume,
                                     YES,
                                     ^(JobsTimer * _Nullable timer) {
                    timer.byTimerStyle(TimerStyle_anticlockwise)
                        .byStartTime(remain)
                        .byTimeInterval(tick)
                        .byQueue(dispatch_get_main_queue());
                                     },
                                     nil);
            JobsTimer *expectedTimer = manager.timerForIdentifier(identifier);
            __weak JobsTimer *weakExpectedTimer = expectedTimer;
            manager
                .byOnTick(identifier, ^(__unused CGFloat time) {
                    @jobs_strongify(self)
                    [self updateIdentifier:identifier
                             expectedTimer:weakExpectedTimer];
                })
                .byOnFinish(identifier, ^(__unused __kindof JobsTimer * _Nullable timer) {
                    @jobs_strongify(self)
                    [self updateIdentifier:identifier
                             expectedTimer:weakExpectedTimer];
                });
        }
    };
}

-(jobsByVoidBlock _Nonnull)refreshCountdownModels{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSMutableDictionary<NSString *, id> *item in self.dataMutArr) {
            NSString *identifier = item[JobsMultiTimerTableDemoIdentifierKey];
            NSInteger remain = MAX(0, (NSInteger)ceil([item[JobsMultiTimerTableDemoEndAtKey] timeIntervalSinceNow]));
            item[JobsMultiTimerTableDemoRemainKey] = @(remain);
            item[JobsMultiTimerTableDemoDoneKey] = @(remain <= 0);
            if (remain <= 0) {
                JobsTimer *expectedTimer = JobsTimerMgr.shared().timerForIdentifier(identifier);
                if (expectedTimer) {
                    [JobsTimerMgr.shared() stopAndRemove:identifier
                                        expectedTimer:expectedTimer];
                }
            }
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopAndRemoveTimerScope{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        (JobsTimerMgr.shared()).stopAndRemoveScope(self.timerScopeIdentifier);
    };
}

-(void)updateIdentifier:(NSString *)identifier
          expectedTimer:(JobsTimer *)expectedTimer{
    NSIndexPath *indexPath = self.indexPathForIdentifier(identifier);
    if (!indexPath) return;
    NSMutableDictionary<NSString *, id> *item = self.dataMutArr[indexPath.row];
    NSInteger remain = MAX(0, (NSInteger)ceil([item[JobsMultiTimerTableDemoEndAtKey] timeIntervalSinceNow]));
    item[JobsMultiTimerTableDemoRemainKey] = @(remain);
    item[JobsMultiTimerTableDemoDoneKey] = @(remain <= 0);
    if (remain <= 0) {
        [JobsTimerMgr.shared() stopAndRemove:identifier
                            expectedTimer:expectedTimer];
    }
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell) {
        cell.detailTextLabel.byText(remain <= 0
                                    ? @"已结束".jobsTr()
                                    : [NSString stringWithFormat:@"剩余：%@ 秒".jobsTr(),item[JobsMultiTimerTableDemoRemainKey]]);
    }
}

-(JobsRetNSIndexPathByNSStringBlock _Nonnull)indexPathForIdentifier{
    @jobs_weakify(self)
    return ^NSIndexPath *(NSString * identifier){
        @jobs_strongify(self)
        if (!self) return nil;
        for (NSUInteger idx = 0; idx < self.dataMutArr.count; idx++) {
            if ([self.dataMutArr[idx][JobsMultiTimerTableDemoIdentifierKey] isEqualToString:identifier]) {
                return [NSIndexPath indexPathForRow:idx
                                          inSection:0];
            }
        };return nil;
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return tableView == _wisdomTableView
        ? self.wisdomItems.count + 1
        : self.dataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _wisdomTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsMultiTimerWisdomCellReuseIdentifier];
        if (!cell) {
            cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:JobsMultiTimerWisdomCellReuseIdentifier];
        }
        BOOL isCloseRow = indexPath.row == self.wisdomItems.count;
        if (isCloseRow) {
            cell.textLabel
                .byText(@"关闭".jobsTr())
                .byTextCor(JobsSystemBlueColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightSemiboldSize(16))
                .byNumberOfLines(1);
            cell.detailTextLabel.byText(nil);
            cell.bySelectionStyle(UITableViewCellSelectionStyleDefault);
        }else{
            NSDictionary<NSString *, NSString *> *item = self.wisdomItems[indexPath.row];
            cell.textLabel
                .byText(item[JobsMultiTimerWisdomTitleKey].jobsTr())
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentLeft)
                .byFont(UIFontWeightSemiboldSize(15))
                .byNumberOfLines(1);
            cell.detailTextLabel
                .byText(item[JobsMultiTimerWisdomDetailKey].jobsTr())
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentLeft)
                .byFont(UIFontWeightRegularSize(12))
                .byNumberOfLines(0);
            cell.bySelectionStyle(UITableViewCellSelectionStyleNone);
        }
        cell.byBgColor(JobsSystemBackgroundColor);
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsMultiTimerTableDemoCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsMultiTimerTableDemoCellReuseIdentifier];
    }
    NSDictionary<NSString *, id> *item = self.dataMutArr[indexPath.row];
    BOOL done = [item[JobsMultiTimerTableDemoDoneKey] boolValue];
    cell.textLabel.byText(item[JobsMultiTimerTableDemoTitleKey]);
    cell.detailTextLabel.byText(done ? @"已结束".jobsTr() : [NSString stringWithFormat:@"剩余：%@ 秒".jobsTr(),item[JobsMultiTimerTableDemoRemainKey]]);
    cell.bySelectionStyle(UITableViewCellSelectionStyleNone);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _wisdomTableView) {
        return indexPath.row == self.wisdomItems.count
            ? JobsWidth(52)
            : UITableViewAutomaticDimension;
    };return JobsWidth(56);
}

-(nullable NSString *)tableView:(UITableView *)tableView
        titleForHeaderInSection:(NSInteger)section{
    return tableView == _wisdomTableView
        ? @"时时彩 Demo 的设计智慧".jobsTr()
        : nil;
}

-(nullable NSString *)tableView:(UITableView *)tableView
        titleForFooterInSection:(NSInteger)section{
    return tableView == _wisdomTableView
        ? @"记住：VC 只有一个 Scope，不是只有一个 Timer。".jobsTr()
        : nil;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView != _wisdomTableView ||
        indexPath.row != self.wisdomItems.count) return;
    [tableView deselectRowAtIndexPath:indexPath
                            animated:YES];
    self.hideWisdomList();
}
#pragma mark —— lazyLoad
-(UIButton *)wisdomActionBtn{
    if (!_wisdomActionBtn) {
        @jobs_weakify(self)
        _wisdomActionBtn = jobsMakeBaseButton(^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            button
                .jobsResetBtnTitle(@"查看设计智慧".jobsTr())
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnBgCor(JobsClearColor)
                .onClickBy(^(UIButton *sender) {
                    @jobs_strongify(self)
                    self.showWisdomList();
                })
                .byAccessibilityLabel(@"查看设计智慧".jobsTr())
                .bySize(CGSizeMake(JobsWidth(44), JobsWidth(44)));
        });
        _wisdomActionBtn.jobsBtnClickEventBlock(^id(UIButton *sender) {
            if (sender.clickBlock) sender.clickBlock(sender);
            return nil;
        });
    };return _wisdomActionBtn;
}

-(UIView *)wisdomOverlayView{
    if (!_wisdomOverlayView) {
        @jobs_weakify(self)
        _wisdomOverlayView = jobsMakeBaseView(^(__kindof BaseView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(RGBA_COLOR(0, 0, 0, 0.35))
                .byHidden(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    };return _wisdomOverlayView;
}

-(UITableView *)wisdomTableView{
    if (!_wisdomTableView) {
        @jobs_weakify(self)
        _wisdomTableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byDelegate(self)
                .byDataSource(self)
                .byRowHeight(UITableViewAutomaticDimension)
                .byEstimatedRowHeight(JobsWidth(92))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(16))
                .byClipsToBounds(YES)
                .addOn(self.wisdomOverlayView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.equalTo(self.wisdomOverlayView).offset(JobsWidth(16));
                    make.right.bottom.equalTo(self.wisdomOverlayView).offset(-JobsWidth(16));
                });
        });
    };return _wisdomTableView;
}

-(UITableView *)tableView{
    if (!_multiTimerTableView) {
        @jobs_weakify(self)
        _multiTimerTableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.byDelegate(self)
                .byDataSource(self)
                .byRowHeight(JobsWidth(56))
                .bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
                });
        });
    };return _multiTimerTableView;
}

-(NSMutableArray<NSMutableDictionary<NSString *,id> *> *)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = NSMutableArray.array;
    };return _dataMutArr;
}

-(NSString *)timerScopeIdentifier{
    if(!_timerScopeIdentifier){
        _timerScopeIdentifier = [NSString stringWithFormat:@"com.jobs.demo.multiTimer.%@",NSUUID.UUID.UUIDString];
    };return _timerScopeIdentifier;
}

-(NSArray<NSDictionary<NSString *,NSString *> *> *)wisdomItems{
    if (!_wisdomItems) {
        _wisdomItems = @[
            @{
                JobsMultiTimerWisdomTitleKey : @"一对一的逻辑关系",
                JobsMultiTimerWisdomDetailKey : @"Cell 一次只绑定一个 Model；每个 Model 用稳定 identifier 对应一个逻辑 Timer。VC 不是只有一个 Timer。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"TimerMgr 才是物理托管者",
                JobsMultiTimerWisdomDetailKey : @"Timer 统一登记到 TimerMgr；VC 只持有一个 scopeIdentifier，用它管理这一页的整组 Timer。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"绝对时间才是真值",
                JobsMultiTimerWisdomDetailKey : @"Model 保存 endAt，剩余时间永远由 endAt - 当前时间计算；Timer 只负责触发刷新，因此暂停、卡顿和离屏都不会造成累计漂移。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"复用必须先解绑旧关系",
                JobsMultiTimerWisdomDetailKey : @"Cell 绑定新 Model 前，旧绑定关系必须失效；回调按 identifier 定位当前 Model 与可见 Cell，旧回调不能污染复用后的新内容。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"精准取消，而不是只看 ID",
                JobsMultiTimerWisdomDetailKey : @"清理时同时比对 identifier 与 expectedTimer 实例，旧清理请求不会误杀同 ID 的替换 Timer。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"生命周期按 Scope 治理",
                JobsMultiTimerWisdomDetailKey : @"页面离场统一 pause，返回统一 resume，VC 释放统一 stopAndRemove；单个 Cell 不负责整页生命周期。"
            },
            @{
                JobsMultiTimerWisdomTitleKey : @"Model 先变，UI 后刷新",
                JobsMultiTimerWisdomDetailKey : @"倒计时先从 Model 的 endAt 计算，再只刷新当前可见 Cell；Cell 是展示层，不是业务时间的唯一保存者。"
            }
        ];
    };return _wisdomItems;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsMultiTimerTableDemoVC
-(JobsRetJobsMultiTimerTableDemoVCByBOOLBlock _Nonnull)byWisdomListVisible{
    @jobs_weakify(self)
    return ^__kindof JobsMultiTimerTableDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWisdomListVisible:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsMultiTimerTableDemoVC
@end
