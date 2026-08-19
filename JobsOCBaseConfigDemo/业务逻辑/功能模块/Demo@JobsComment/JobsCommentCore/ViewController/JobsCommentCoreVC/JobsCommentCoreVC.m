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
Prop_assign()CGFloat jobsDefaultPopUpHeight;

-(jobsByVoidBlock _Nonnull)loadLocalCommentData;
-(jobsByVoidBlock _Nonnull)jobs_setupTitlePanGesture;
-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_defaultPopUpHeight;
-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_minimumTrackingPopUpHeight;
-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_maxPopUpHeight;
-(JobsRetCGFloatByCGFloatBlock _Nonnull)jobs_limitedPopUpHeight;
-(jobsByCGFloatBlock _Nonnull)jobs_updateCommentPopUpHeight;
-(jobsByCGFloatBlock _Nonnull)jobs_finishCommentPopUpPanWithVelocity;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCommentCoreVC
@interface JobsCommentCoreVC (JobsPropertyDSLSetterAutogen_6dee236e01)
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setJobsDefaultPopUpHeight:(CGFloat)data;
-(void)setJobsPanBeginPopUpHeight:(CGFloat)data;
-(void)setMjModel:(JobsCommentModel * _Nullable)data;
-(void)setPopUpHeight:(CGFloat)data;
-(void)setPreferredContentSize:(CGSize)data;
-(void)setTransitioningDelegate:(id <UIViewControllerTransitioningDelegate> _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCommentCoreVC

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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        @jobs_weakify(self)
        (jobsGetMainWindow()).actionObjBlock(^(id data) {
            @jobs_strongify(self)
            [self dismissViewControllerAnimated:YES completion:Nil];
        });
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.view.byBgColor(JobsSystemBackgroundColor);
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
            self.byHiddenNavigationBar(YES);
            self.byGKStatusBarHidden(YES);
            self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
                navigationBar.byVisible(YES);
            });
            self.titleHeaderView.byAlpha(1);
            self.byJobsDefaultPopUpHeight(self.popUpHeight);
            self.jobs_setupTitlePanGesture();
            self.tableView.byShow(self);
            self.loadLocalCommentData();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark —— 一些公有方法
-(void)setMJModel:(JobsCommentModel *)mjModel{
    jobsByCommentModelBlock action = ((jobsByCommentModelBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsSetMJModel)))(self, @selector(jobsSetMJModel));
    if (action) action(mjModel);
}

-(jobsByCommentModelBlock _Nonnull)jobsSetMJModel{
    @jobs_weakify(self)
    return ^(JobsCommentModel * mjModel){
        @jobs_strongify(self)
        if (!self) return;
        _mjModel = mjModel;
        self.tableView.endRefreshing(_mjModel.listDataArr.count);
    };
}

-(void)setYYModel:(JobsCommentModel *)yyModel{
    jobsByCommentModelBlock action = ((jobsByCommentModelBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsSetYYModel)))(self, @selector(jobsSetYYModel));
    if (action) action(yyModel);
}

-(jobsByCommentModelBlock _Nonnull)jobsSetYYModel{
    @jobs_weakify(self)
    return ^(JobsCommentModel * yyModel){
        @jobs_strongify(self)
        if (!self) return;
        _yyModel = yyModel;
        self.tableView.endRefreshing(_yyModel.listDataArr.count);
    };
}

-(JobsRetJobsCommentTitleHeaderViewByVoidBlock _Nonnull)getJobsCommentTitleHeaderView{
    @jobs_weakify(self)
    return ^JobsCommentTitleHeaderView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.titleHeaderView;
    };
}

-(JobsRetTableViewByVoidBlock _Nonnull)getTableView{
    @jobs_weakify(self)
    return ^UITableView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.tableView;
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)jobs_setupTitlePanGesture{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.titleHeaderView.byUserInteractionEnabled(YES);
        self.titleHeaderView.byWeak_target(self);
        @jobs_weakify(self)
        self.titleHeaderView.panGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                                           UIPanGestureRecognizer *_Nullable sender) {
            @jobs_strongify(self)
            CGPoint translation = [sender translationInView:self.view.superview ? : self.view];
            CGFloat velocityY = [sender velocityInView:self.view.superview ? : self.view].y;
            if (sender.state == UIGestureRecognizerStateBegan) {
                self.byJobsPanBeginPopUpHeight(self.popUpHeight);
            }
            if (sender.state == UIGestureRecognizerStateChanged) {
                self.jobs_updateCommentPopUpHeight(self.jobsPanBeginPopUpHeight - translation.y);
            }
            if (sender.state == UIGestureRecognizerStateEnded ||
                sender.state == UIGestureRecognizerStateCancelled ||
                sender.state == UIGestureRecognizerStateFailed) {
                self.jobs_finishCommentPopUpPanWithVelocity(velocityY);
            };return nil;
        });
        if (self.titleHeaderView.panGR) self.titleHeaderView.panGR.byEnabled(YES);
        self.titleHeaderView.panGR.byCancelsTouchesInView(NO);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_defaultPopUpHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        if (_jobsDefaultPopUpHeight <= 0) {
            _jobsDefaultPopUpHeight = self.popUpHeight;
        };return _jobsDefaultPopUpHeight;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_minimumTrackingPopUpHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return 1.f;
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_maxPopUpHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return JobsMainScreen_HEIGHT();
    };
}

-(JobsRetCGFloatByCGFloatBlock _Nonnull)jobs_limitedPopUpHeight{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat height){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MIN(MAX(height, self.jobs_minimumTrackingPopUpHeight()), self.jobs_maxPopUpHeight());
    };
}

-(jobsByCGFloatBlock _Nonnull)jobs_updateCommentPopUpHeight{
    @jobs_weakify(self)
    return ^(CGFloat height){
        @jobs_strongify(self)
        if (!self) return;
        self.byPopUpHeight(self.jobs_limitedPopUpHeight(height));
        [self.presentationController.containerView setNeedsLayout];
        [self.presentationController.containerView layoutIfNeeded];
    };
}

-(jobsByCGFloatBlock _Nonnull)jobs_finishCommentPopUpPanWithVelocity{
    @jobs_weakify(self)
    return ^(CGFloat velocityY){
        @jobs_strongify(self)
        if (!self) return;
        if (self.popUpHeight >= self.jobs_defaultPopUpHeight()) return;
        UIView *presentedView = self.presentationController.presentedView ? : self.view;
        CGFloat distance = CGRectGetHeight(presentedView.bounds) + JobsBottomSafeAreaHeight();
        CGFloat initialVelocity = MAX(velocityY / MAX(distance, 1.f), 0.1f);
        UIView.jobsAnimateWithSpring(0.42,
            0,
            0.82,
            initialVelocity,
            UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut,
            ^{
            presentedView.byTransform(CGAffineTransformMakeTranslation(0, distance));
            presentedView.byAlpha(0.02);
        },
            ^(BOOL finished) {
            [self dismissViewControllerAnimated:NO
                                     completion:nil];
        });
    };
}

-(void)一级标题点击事件{
    @"一级标题点击事件".jobsTr().toast();
}

-(void)二级标题点击事件{
    @"二级标题点击事件".jobsTr().toast();
}
#pragma mark —— Data
-(jobsByVoidBlock _Nonnull)loadLocalCommentData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSDictionary *dic = @"CommentData".readLocalFileWithName();
        self.byMjModel([JobsCommentModel mj_objectWithKeyValues:dic[@"data"]]);
        JobsLog(@"self.mjModel = %@",self.mjModel);
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsLoadMoreTBVCell.cellHeightByModel(nil);//isFullShow
}

-(CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(nullable __kindof UIView *)tableView:(UITableView *)tableView
                viewForFooterInSection:(NSInteger)section{
    return nil;
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
        model.byChildDataArr(self.mjModel.listDataArr[section].childDataArr);
    }).firstShowNum;
}
/// 二级评论数据 展示在cellForRowAtIndexPath
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsFirstCommentModel *firstCommentModel = (JobsFirstCommentModel *)self.mjModel.listDataArr[indexPath.section];//一级评论数据 展示在viewForHeaderInSection
    JobsChildCommentModel *childCommentModel = firstCommentModel.childDataArr[indexPath.row];//二级评论数据 展示在cellForRowAtIndexPath
    JobsFirstCommentCustomCofigModel *customCofigModel = jobsMakeFirstCommentCustomCofigModel(^(__kindof JobsFirstCommentCustomCofigModel * _Nullable model) {
        model.byChildDataArr(firstCommentModel.childDataArr);
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
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCommentCoreVC.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        JobsLog(@"一级评论的个数 = %ld",self.mjModel.listDataArr.count);
        return self.mjModel.listDataArr.count;/// 一级评论👌
    };
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
        /// UITableViewStyleGrouped 取消 sectionHeader 悬停效果
        _tableView = jobsMakeTableViewByGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .bySeparatorColor(JobsWhiteColor)
                .byEstimatedRowHeight(0)
                .byEstimatedSectionHeaderHeight(0)
                .byEstimatedSectionFooterHeight(0)
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"没有评论".jobsTr())
                        .bySubTitle(@"来发布第一条吧".jobsTr())
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"暂无数据".img)
                        .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0));
                }))
                .byMJRefreshHeader(self.lotAnimMJRefreshHeader.byRefreshConfigModel(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                    model.byStateIdleTitle(@"下拉刷新数据".jobsTr())
                         .byPullingTitle(@"下拉刷新数据".jobsTr())
                         .byRefreshingTitle(@"正在刷新数据".jobsTr())
                         .byWillRefreshTitle(@"刷新数据中".jobsTr())
                         .byNoMoreDataTitle(@"下拉刷新数据".jobsTr());
                    model.loadBlock = ^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        self.loadLocalCommentData();
                    //    self.yyModel = [MKCommentModel yy_modelWithDictionary:dic[@"data"]];
                        // 特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                        self.tableView.byPagingEnabled(NO);
                        self.tableView.mj_footer.byState(MJRefreshStateIdle);
                        self.tableView.mj_footer.byHidden(YES);
                        self.tableView.byPagingEnabled(YES);
                        return nil;
                    };
                })))
                .byMJRefreshFooter(self.view.MJRefreshAutoGifFooterBy(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable data) {
                    data.byStateIdleTitle(@"".jobsTr())
                        .byPullingTitle(@"".jobsTr())
                        .byRefreshingTitle(@"".jobsTr())
                        .byWillRefreshTitle(@"".jobsTr())
                        .byNoMoreDataTitle(@"".jobsTr());
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
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.titleHeaderView.mas_bottom);
                    make.bottom.left.right.equalTo(self.view);
                });
            tableView.mj_footer.byHidden(YES);
            tableView.mj_footer.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
            self.view.byMjRefreshTargetView(tableView);
        });
    };return _tableView;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCommentCoreVC
-(JobsRetJobsCommentCoreVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}

-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byJobsDefaultPopUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setJobsDefaultPopUpHeight:data];
        return self;
    };
}

-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byJobsPanBeginPopUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setJobsPanBeginPopUpHeight:data];
        return self;
    };
}

-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byPopUpHeight{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setPopUpHeight:data];
        return self;
    };
}

-(JobsRetJobsCommentCoreVCByJobsCommentModelBlock _Nonnull)byMjModel{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(JobsCommentModel * _Nullable data){
        @jobs_strongify(self)
        [self setMjModel:data];
        return self;
    };
}
-(JobsRetJobsCommentCoreVCByCGSizeBlock _Nonnull)byPreferredContentSize{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(CGSize data){
        @jobs_strongify(self)
        [self setPreferredContentSize:data];
        return self;
    };
}

-(JobsRetJobsCommentCoreVCByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsCommentCoreVC * _Nullable(id <UIViewControllerTransitioningDelegate> _Nullable data){
        @jobs_strongify(self)
        [self setTransitioningDelegate:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCommentCoreVC
@end
