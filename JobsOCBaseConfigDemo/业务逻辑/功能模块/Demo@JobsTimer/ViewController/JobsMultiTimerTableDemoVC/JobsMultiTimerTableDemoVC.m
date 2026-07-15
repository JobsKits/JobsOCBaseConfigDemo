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

@interface JobsMultiTimerTableDemoVC (){
    UITableView *_multiTimerTableView;
}

Prop_strong()NSMutableArray<NSMutableDictionary<NSString *, id> *>*dataMutArr;

-(void)setupRows;
-(void)setupTimers;
-(void)removeTimers;
-(void)updateIdentifier:(NSString *)identifier
                   time:(CGFloat)time;
-(nullable NSIndexPath *)indexPathForIdentifier:(NSString *)identifier;

@end

@implementation JobsMultiTimerTableDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    [self removeTimers];
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
            data.byText(@"时时彩".tr)
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
    [self setupRows];
    self.tableView.byVisible(YES);
    [self setupTimers];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self removeTimers];
}
#pragma mark —— 一些私有方法
-(void)setupRows{
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
            JobsMultiTimerTableDemoDoneKey : @(NO)
        }.mutableCopy];
    }
}

-(void)setupTimers{
    [self removeTimers];
    @jobs_weakify(self)
    NSArray<NSNumber *>*tickArr = @[@0.5, @1.0, @1.0, @2.0];
    for (NSUInteger idx = 0; idx < self.dataMutArr.count; idx++) {
        NSMutableDictionary<NSString *, id> *item = self.dataMutArr[idx];
        NSString *identifier = item[JobsMultiTimerTableDemoIdentifierKey];
        NSTimeInterval remain = [item[JobsMultiTimerTableDemoRemainKey] doubleValue];
        NSTimeInterval tick = tickArr[idx % tickArr.count].doubleValue;
        JobsTimerMgr.shared
            .byUpsertTimer(identifier,
                           JobsTimerTypeGCD,
                           JobsTimerBackgroundPolicyPauseAndResume,
                           YES,
                           ^(JobsTimer * _Nullable timer) {
                timer.byTimerStyle(TimerStyle_anticlockwise)
                    .byStartTime(remain)
                    .byTimeInterval(tick)
                    .byQueue(dispatch_get_main_queue());
            },
                           nil)
            .byOnTick(identifier, ^(CGFloat time) {
                @jobs_strongify(self)
                [self updateIdentifier:identifier
                                   time:time];
            })
            .byOnFinish(identifier, ^(__kindof JobsTimer * _Nullable timer) {
                @jobs_strongify(self)
                NSIndexPath *indexPath = [self indexPathForIdentifier:identifier];
                if (!indexPath) return;
                NSMutableDictionary<NSString *, id> *data = self.dataMutArr[indexPath.row];
                data[JobsMultiTimerTableDemoRemainKey] = @(0);
                data[JobsMultiTimerTableDemoDoneKey] = @(YES);
                [self.tableView reloadRowsAtIndexPaths:@[indexPath]
                                      withRowAnimation:UITableViewRowAnimationNone];
            });
    }
}

-(void)removeTimers{
    for (NSDictionary<NSString *, id> *item in self.dataMutArr) {
        [JobsTimerMgr.shared stopAndRemove:item[JobsMultiTimerTableDemoIdentifierKey]];
    }
}

-(void)updateIdentifier:(NSString *)identifier
                   time:(CGFloat)time{
    NSIndexPath *indexPath = [self indexPathForIdentifier:identifier];
    if (!indexPath) return;
    NSMutableDictionary<NSString *, id> *item = self.dataMutArr[indexPath.row];
    item[JobsMultiTimerTableDemoRemainKey] = @(MAX(0, ceil(time)));
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if (cell) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"剩余：%@ 秒".tr,item[JobsMultiTimerTableDemoRemainKey]];
    }
}

-(NSIndexPath *)indexPathForIdentifier:(NSString *)identifier{
    for (NSUInteger idx = 0; idx < self.dataMutArr.count; idx++) {
        if ([self.dataMutArr[idx][JobsMultiTimerTableDemoIdentifierKey] isEqualToString:identifier]) {
            return [NSIndexPath indexPathForRow:idx
                                      inSection:0];
        }
    };return nil;
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JobsMultiTimerTableDemoCellReuseIdentifier];
    if (!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:JobsMultiTimerTableDemoCellReuseIdentifier];
    }
    NSDictionary<NSString *, id> *item = self.dataMutArr[indexPath.row];
    BOOL done = [item[JobsMultiTimerTableDemoDoneKey] boolValue];
    cell.textLabel.text = item[JobsMultiTimerTableDemoTitleKey];
    cell.detailTextLabel.text = done ? @"已结束".tr : [NSString stringWithFormat:@"剩余：%@ 秒".tr,item[JobsMultiTimerTableDemoRemainKey]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsWidth(56);
}
#pragma mark —— lazyLoad
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
                .byBgColor(JobsWhiteColor)
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

@end
