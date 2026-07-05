//
//  JobsCommentCoreVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCommentCoreVC.h"

@interface JobsCommentCoreVC ()
/// UI
Prop_strong()JobsCommentTitleHeaderView *titleHeaderView;
/// Data
Prop_strong()JobsCommentModel *mjModel;
Prop_strong()JobsCommentModel *yyModel;
Prop_assign()CGFloat jobsPanBeginPopUpHeight;

-(void)loadLocalCommentData;
-(void)jobs_setupTitlePanGesture;
-(CGFloat)jobs_minPopUpHeight;
-(CGFloat)jobs_maxPopUpHeight;
-(CGFloat)jobs_limitedPopUpHeight:(CGFloat)height;
-(void)jobs_updateCommentPopUpHeight:(CGFloat)height;
-(void)jobs_settleCommentPopUpHeightWithVelocity:(CGFloat)velocityY;

@end

@implementation JobsCommentCoreVC

- (void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
//        [self loadData];
    };return self;
}

-(void)loadView{
    [super loadView];
    @jobs_weakify(self)
    [jobsGetMainWindow() actionObjBlock:^(id data) {
        @jobs_strongify(self)
        [self dismissViewControllerAnimated:YES completion:Nil];
    }];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.byBgColor(HEXCOLOR(0xF6F7FB));

//    @jobs_weakify(self)
//    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.userHeadBtn));
//    });
//    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
//        @jobs_strongify(self)
////        data.add(UIBarButtonItem.initBy(self.deleteBtn));
//    });
//    self.makeNavByAlpha(1);
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    self.gk_statusBarHidden = YES;
    self.gk_navigationBar.jobsVisible = YES;
    
    self.titleHeaderView.byAlpha(1);
    [self jobs_setupTitlePanGesture];

    self.tableView.byShow(self);
    [self loadLocalCommentData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— 一些公有方法
-(void)setMJModel:(JobsCommentModel *)mjModel{
    _mjModel = mjModel;
    self.tableView.endRefreshing(_mjModel.listDataArr.count);
}

-(void)setYYModel:(JobsCommentModel *)yyModel{
    _yyModel = yyModel;
    self.tableView.endRefreshing(_yyModel.listDataArr.count);
}

-(JobsCommentTitleHeaderView *)getJobsCommentTitleHeaderView{
    return self.titleHeaderView;
}

-(UITableView *)getTableView{
    return self.tableView;
}
#pragma mark —— 一些私有方法
-(void)jobs_setupTitlePanGesture{
    self.titleHeaderView.byUserInteractionEnabled(YES);
    self.titleHeaderView.weak_target = self;
    @jobs_weakify(self)
    self.titleHeaderView.panGR_SelImp.selector = [self jobsSelectorBlock:^id _Nullable(id _Nullable target,
                                                                                       UIPanGestureRecognizer *_Nullable sender) {
        @jobs_strongify(self)
        CGPoint translation = [sender translationInView:self.view.superview ? : self.view];
        CGFloat velocityY = [sender velocityInView:self.view.superview ? : self.view].y;
        if (sender.state == UIGestureRecognizerStateBegan) {
            self.jobsPanBeginPopUpHeight = self.popUpHeight;
        }
        if (sender.state == UIGestureRecognizerStateChanged) {
            [self jobs_updateCommentPopUpHeight:self.jobsPanBeginPopUpHeight - translation.y];
        }
        if (sender.state == UIGestureRecognizerStateEnded ||
            sender.state == UIGestureRecognizerStateCancelled ||
            sender.state == UIGestureRecognizerStateFailed) {
            [self jobs_settleCommentPopUpHeightWithVelocity:velocityY];
        };return nil;
    }];
    self.titleHeaderView.panGR.enabled = YES;
    self.titleHeaderView.panGR.cancelsTouchesInView = NO;
}

-(CGFloat)jobs_minPopUpHeight{
    return JobsMainScreen_HEIGHT() / 2;
}

-(CGFloat)jobs_maxPopUpHeight{
    return JobsMainScreen_HEIGHT();
}

-(CGFloat)jobs_limitedPopUpHeight:(CGFloat)height{
    return MIN(MAX(height, self.jobs_minPopUpHeight), self.jobs_maxPopUpHeight);
}

-(void)jobs_updateCommentPopUpHeight:(CGFloat)height{
    self.popUpHeight = [self jobs_limitedPopUpHeight:height];
    [self.presentationController.containerView setNeedsLayout];
    [self.presentationController.containerView layoutIfNeeded];
}

-(void)jobs_settleCommentPopUpHeightWithVelocity:(CGFloat)velocityY{
    CGFloat middleHeight = (self.jobs_minPopUpHeight + self.jobs_maxPopUpHeight) / 2;
    CGFloat targetHeight = (velocityY < -300 || (velocityY <= 300 && self.popUpHeight >= middleHeight)) ? self.jobs_maxPopUpHeight : self.jobs_minPopUpHeight;
    [UIView animateWithDuration:0.28
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        [self jobs_updateCommentPopUpHeight:targetHeight];
    } completion:NULL];
}

-(void)一级标题点击事件{
    @"一级标题点击事件".tr.toast();
}

-(void)二级标题点击事件{
    @"二级标题点击事件".tr.toast();
}
#pragma mark —— Data
-(void)loadLocalCommentData{
    NSDictionary *dic = @"CommentData".readLocalFileWithName;
    self.mjModel = [JobsCommentModel mj_objectWithKeyValues:dic[@"data"]];
    JobsLog(@"self.mjModel = %@",self.mjModel);
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsLoadMoreTBVCell.cellHeightByModel(nil);//isFullShow
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return JobsWidth(8);
}

-(nullable __kindof UIView *)tableView:(UITableView *)tableView
                viewForFooterInSection:(NSInteger)section{
    return jobsMakeView(^(__kindof UIView * _Nullable view) {
        view.byBgColor(HEXCOLOR(0xF6F7FB));
    });
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self 二级标题点击事件];
}
/// 二级评论
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    @jobs_weakify(self)
    return jobsMakeFirstCommentCustomCofigModel(^(__kindof JobsFirstCommentCustomCofigModel * _Nullable model) {
        @jobs_strongify(self)
        model.childDataArr = self.mjModel.listDataArr[section].childDataArr;
    }).firstShowNum;
}
/// 二级评论数据 展示在cellForRowAtIndexPath
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsFirstCommentModel *firstCommentModel = (JobsFirstCommentModel *)self.mjModel.listDataArr[indexPath.section];//一级评论数据 展示在viewForHeaderInSection
    JobsChildCommentModel *childCommentModel = firstCommentModel.childDataArr[indexPath.row];//二级评论数据 展示在cellForRowAtIndexPath
    JobsFirstCommentCustomCofigModel *customCofigModel = jobsMakeFirstCommentCustomCofigModel(^(__kindof JobsFirstCommentCustomCofigModel * _Nullable model) {
        model.childDataArr = firstCommentModel.childDataArr;
    });
    if (customCofigModel.isFullShow) {
        JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1ByTableView(tableView);
        cell.jobsRichElementsTableViewCellBy(childCommentModel)
            .JobsBlock1(^(id _Nullable data) {
            
        });return cell;
    }else{
        if (indexPath.row <= customCofigModel.firstShowNum) {
            // 二级评论展示...
            JobsInfoTBVCell *cell = JobsInfoTBVCell.cellStyleValue1ByTableView(tableView);
            cell.jobsRichElementsTableViewCellBy(childCommentModel)
                .JobsBlock1(^(id _Nullable data) {
                
            });return cell;
        }else{
            // 加载更多...
            JobsLoadMoreTBVCell *cell = JobsLoadMoreTBVCell.cellStyleValue1ByTableView(tableView);
            cell.jobsRichElementsTableViewCellBy(nil)
                .JobsBlock1(^(id _Nullable data) {
                
            });return cell;
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsLog(@"一级评论的个数 = %ld",self.mjModel.listDataArr.count);
    return self.mjModel.listDataArr.count;/// 一级评论👌
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section{///  👌
    return JobsCommentPopUpView_viewForHeaderInSection.viewHeightByModel(nil);
}
/// 一级评论数据 展示在viewForHeaderInSection
/// 这里涉及到复用机制，return出去的是UITableViewHeaderFooterView的派生类
- (nullable __kindof UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section{
    @jobs_weakify(self)
    return JobsCommentPopUpView_viewForHeaderInSection
        .JobsRichViewByModel(self.mjModel.listDataArr[section])/// 一级评论数据 展示在viewForHeaderInSection
        .JobsBlock1(^(id _Nullable data) {/// 一级标题点击事件
            @jobs_strongify(self)
            [self 一级标题点击事件];
    });
}
#pragma mark —— lazyLoad
-(JobsCommentTitleHeaderView *)titleHeaderView{
    if (!_titleHeaderView) {
        @jobs_weakify(self)
        _titleHeaderView = JobsCommentTitleHeaderView
            .JobsRichViewByModel(nil)
            .JobsBlock1(^(id _Nullable data) {/// 一级标题点击事件
                @jobs_strongify(self)
                self.backViewControllerCore(self);
        });
        _titleHeaderView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self.view);
            make.height.mas_equalTo(JobsWidth(50));
        });
    };return _titleHeaderView;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        /// UITableViewStyleGrouped 取消悬停效果
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(JobsWhiteColor)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"没有评论".tr)
                        .bySubTitle(@"来发布第一条吧".tr)
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"暂无数据".img)
                        .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0));
                }))
                .byMJRefreshHeader(self.lotAnimMJRefreshHeader.byRefreshConfigModel(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                    model.byStateIdleTitle(@"下拉刷新数据".tr)
                         .byPullingTitle(@"下拉刷新数据".tr)
                         .byRefreshingTitle(@"正在刷新数据".tr)
                         .byWillRefreshTitle(@"刷新数据中".tr)
                         .byNoMoreDataTitle(@"下拉刷新数据".tr);
                    model.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        [self loadLocalCommentData];
                    //    self.yyModel = [MKCommentModel yy_modelWithDictionary:dic[@"data"]];
                        // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                        self.tableView.pagingEnabled = NO;
                        self.tableView.mj_footer.state = MJRefreshStateIdle;
                        self.tableView.mj_footer.byHidden(YES);
                        self.tableView.pagingEnabled = YES;
                        return nil;
                    };
                })))
                .byMJRefreshFooter(self.view.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.byStateIdleTitle(@"".tr)
                        .byPullingTitle(@"".tr)
                        .byRefreshingTitle(@"".tr)
                        .byWillRefreshTitle(@"".tr)
                        .byNoMoreDataTitle(@"".tr);
                    data.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"上拉加载更多");
                        self.tableView.endRefreshing(self.mjModel.listDataArr.count);
                        return nil;
                    };
                })))
                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byContentInset(UIEdgeInsetsMake(JobsWidth(8), 0, JobsBottomSafeAreaHeight(), 0))
                .byBgColor(HEXCOLOR(0xF6F7FB))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.titleHeaderView.mas_bottom);
                    make.bottom.left.right.equalTo(self.view);
                });
            tableView.mj_footer.byHidden(YES);
            tableView.mj_footer.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
            self.view.mjRefreshTargetView = tableView;
        });
    };return _tableView;
}

@end
