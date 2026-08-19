//
//  JobsIMListView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMListView.h"

@interface JobsIMListView ()
/// UI
Prop_strong()UIColor *bgColour;
/// Data
Prop_strong()NSMutableArray <JobsIMListDataModel *>*jobsIMListMutArr;

@end

@implementation JobsIMListView
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsIMListView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.tableView.byShow(self);
    };
}
#pragma mark —— 一些私有方法

#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsIMListTBVCell.cellHeightByModel(nil);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.objBlock) self.objBlock(self.jobsIMListMutArr[indexPath.row]);
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.jobsIMListMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIMListTBVCell *cell = JobsIMListTBVCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .byDelegate(self)
        .jobsRichElementsTableViewCellBy(self.jobsIMListMutArr[indexPath.row])
        .JobsBlock1(^(id _Nullable data) {;
        });
    return cell.byAllowsMultipleSwipe(YES);
}
#pragma mark —— MGSwipeTableCellDelegate
-(jobsByMGSwipeTableCellBlock _Nonnull)swipeTableCellWillBeginSwiping{
    @jobs_weakify(self)
    return ^(MGSwipeTableCell * cell){
        @jobs_strongify(self)
        if (!self) return;
        NSObject.feedbackGenerator(nil);//震动反馈
    };
}
/// 点击了第几个滑动出现的按钮？
-(BOOL)swipeTableCell:(MGSwipeTableCell *)cell
  tappedButtonAtIndex:(NSInteger)index
            direction:(MGSwipeDirection)direction
        fromExpansion:(BOOL)fromExpansion{
    JobsLog(@"Delegate: button tapped, %@ position, index %d, from Expansion: %@",direction == MGSwipeDirectionLeftToRight ? @"left" : @"right", (int)index, fromExpansion ? @"YES" : @"NO");
    return YES;
}

-(void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    JobsLog(@"Tapped accessory button");
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            MJRefreshConfigModel *headerConfig = jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                model.byStateIdleTitle(@"下拉刷新数据".jobsTr())
                    .byPullingTitle(@"下拉刷新数据".jobsTr())
                    .byRefreshingTitle(@"正在刷新数据".jobsTr())
                    .byWillRefreshTitle(@"刷新数据中".jobsTr())
                    .byNoMoreDataTitle(@"下拉刷新数据".jobsTr())
                    .byTextColor(JobsSecondaryLabelColor)
                    .byLoadBlock(^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"下拉刷新");
                        self.tableView.endRefreshing(NO);
                        return nil;
                    });
            });
            MJRefreshConfigModel *footerConfig = jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                model.byStateIdleTitle(@"".jobsTr())
                    .byPullingTitle(@"".jobsTr())
                    .byRefreshingTitle(@"".jobsTr())
                    .byWillRefreshTitle(@"".jobsTr())
                    .byNoMoreDataTitle(@"".jobsTr())
                    .byTextColor(JobsSecondaryLabelColor)
                    .byLoadBlock(^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"上拉加载更多");
                        self.tableView.byPagingEnabled(NO);
                        self.tableView.mj_footer.byHidden(YES);
                        self.tableView.byPagingEnabled(YES);
                        self.tableView.endRefreshing(NO);
                        return nil;
                    });
            });
            tableView
                .byMJRefreshHeader(tableView.LOTAnimationMJRefreshHeaderBy(headerConfig))
                .byMJRefreshFooter(tableView.MJRefreshAutoGifFooterBy(footerConfig))
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byPagingEnabled(YES) // 这个属性为YES会使得Tableview一格一格的翻动
                .byShowsVerticalScrollIndicator(NO)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)

                .byBgColor(self.bgColour)
                .addOn(self);
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.edges.equalTo(self);
            }];
            tableView.mj_footer.byBgColor(JobsSystemBackgroundColor);
            tableView.mj_footer.byHidden(NO);
        });
    };return _tableView;
}

-(NSMutableArray<JobsIMListDataModel *> *)jobsIMListMutArr{
    if (!_jobsIMListMutArr) {
        _jobsIMListMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<JobsIMListDataModel *> * _Nullable arr) {
            arr.add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.byUserID(@"jobsim_peer_mahuateng")
                    .byPeerID(@"lan_peer_mahuateng")
                    .byUsernameStr(@"马化腾")
                    .byContentStr(@"晚上西藏饭店3楼喜马拉雅厅不见不散，到了电话")
                    .byTimeStr(@"22:54")
                    .byUserHeaderIMG(UIImage.animatedGIFByName(@"动态头像_1 尺寸126"))
                    .byTransportKind(JobsIMTransportKindLANBonjourNetwork)
                    .byPeerOnlineState(JobsIMPeerOnlineStateOnlineForeground);
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.byUserID(@"jobsim_peer_mayun")
                    .byPeerID(@"nearby_peer_mayun")
                    .byUsernameStr(@"马云")
                    .byContentStr(@"刘总请再给我一次机会")
                    .byTimeStr(@"05:34")
                    .byUserHeaderIMG(UIImage.animatedGIFByName(@"动态头像_2 尺寸126"))
                    .byTransportKind(JobsIMTransportKindNearbyMultipeer)
                    .byPeerOnlineState(JobsIMPeerOnlineStateOnlineForeground);
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.byUserID(@"jobsim_peer_lijiacheng")
                    .byPeerID(@"lan_peer_lijiacheng")
                    .byUsernameStr(@"李嘉诚")
                    .byContentStr(@"小刘我很看好你，什么时候有空过来坐坐")
                    .byTimeStr(@"02:14")
                    .byUserHeaderIMG(UIImage.animatedGIFByName(@"动态头像_1 尺寸126"))
                    .byTransportKind(JobsIMTransportKindLANBonjourNetwork)
                    .byPeerOnlineState(JobsIMPeerOnlineStateBackgroundMaybeOffline);
            })).add(jobsMakeIMListDataModel(^(__kindof JobsIMListDataModel * _Nullable model) {
                model.byUserID(@"jobsim_peer_nio_wang")
                    .byPeerID(@"nearby_peer_nio_wang")
                    .byUsernameStr(@"蔚来卡地亚花园城营销小王")
                    .byContentStr(@"刘总给你留了一套独栋，什么时候有空过来办手续")
                    .byTimeStr(@"20:34")
                    .byUserHeaderIMG(UIImage.animatedGIFByName(@"动态头像_2 尺寸126"))
                    .byTransportKind(JobsIMTransportKindNearbyMultipeer)
                    .byPeerOnlineState(JobsIMPeerOnlineStateOffline);
            }));
        });
    };return _jobsIMListMutArr;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = JobsSystemBackgroundColor;
    };return _bgColour;
}

@end
