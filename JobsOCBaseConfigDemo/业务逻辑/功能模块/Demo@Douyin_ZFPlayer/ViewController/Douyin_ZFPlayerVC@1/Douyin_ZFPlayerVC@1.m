//
//  Douyin_ZFPlayerVC@1.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Douyin_ZFPlayerVC@1.h"

@interface Douyin_ZFPlayerVC_1 ()

Prop_strong()NSMutableArray <VideoModel_Core *>*__block dataMutArr;
-(JobsRetDouyinZFPlayerVC1ByNSIntegerBlock _Nonnull)byIndex;
-(jobsByVoidBlock _Nonnull)stopVisiblePlayers;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN RequestTool
@interface RequestTool (JobsLocalPropertyDSLAutogen_727a9291be)
-(JobsRetRequestToolByHTTPRequestHeaderLanguageTypeBlock _Nonnull)byLanguageType;
-(void)setLanguageType:(HTTPRequestHeaderLanguageType)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END RequestTool

@implementation Douyin_ZFPlayerVC_1

-(JobsRetDouyinZFPlayerVC1ByNSIntegerBlock _Nonnull)byIndex{
    @jobs_weakify(self)
    return ^__kindof Douyin_ZFPlayerVC_1 *_Nullable(NSInteger value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setIndex:value];
        return self;
    };
}

- (void)dealloc {
    self.stopVisiblePlayers();
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
        self.byIndex(0);
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byTextCor(JobsLabelColor)
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
            self.tableView.byShow(self);
        //    [self monitorScrollView];
        //    [self requestData:NO];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        [self.tableView.mj_header beginRefreshing];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.byIndex(0);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopVisiblePlayers();
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)stopVisiblePlayers{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (__kindof UITableViewCell *cell in _tableView.visibleCells) {
            if ([cell isKindOfClass:JobsPlayerTBVCell.class]) {
                ((JobsPlayerTBVCell *)cell).stopPlayer();
            }
        }
    };
}

/// 真实的网络请求
-(jobsByBOOLBlock _Nonnull)requestData{
    @jobs_weakify(self)
    return ^(BOOL isLoadMore){
        @jobs_strongify(self)
        if (!self) return;
        JobsNetworkingPrepare
        [DataManager.sharedManager setTag:ReuseIdentifier];
        /**
         公共配置
         插件机制
         证书设置
         */
        RequestTool *config = RequestTool.new;
        config.byLanguageType(HTTPRequestHeaderLanguageCN);
        RequestTool.setupPublicParametersBy(config);
        @jobs_weakify(self)
        NSDictionary *parameters = @{@"pageSize":@(10),
                                     @"pageNum":self.currentPage};
        [JobsNetworkingAPI requestApi:This.jobs_appInterfaceTesting().funcName
                           parameters:parameters
                         successBlock:^(JobsResponseModel *data) {
            @jobs_strongify(self)
            JobsLog(@"");
            if([data.data isKindOfClass:NSArray.class]){
                NSArray *tempDataArr = (NSArray *)data.data;
                {// 数据组装
                    /**
                        上拉加载更多
                        请求到有实际意义上的数据 ——> 上拉加载更多
                        请求到没有有实际意义上的数据 ——>  没有更多数据了
                     */
                    /**
                     下拉刷新
                        请求到有实际意义上的数据 ——> 清除以前的旧的数据 下拉可以刷新
                        请求到没有有实际意义上的数据 ——> 不清除以前的旧的数据 下拉可以刷新
                     */
                    // 如果当前操作是下拉刷新 并且 请求到的数组里面有值——>清除已有的数据
                    if (!isLoadMore && tempDataArr.count) {
                        [self.dataMutArr removeAllObjects];
                    }
                    if (isLoadMore) {
                        if (tempDataArr.count) {
                            [self.dataMutArr addObjectsFromArray:tempDataArr];
                            self->_tableView.endRefreshing(self.dataMutArr.count);//上拉加载更多
                        }else{
                            self->_tableView.endRefreshingWithNoMoreData(self.dataMutArr.count);//没有更多数据了
                        }
                    }
                }
            }
        }failureBlock:^(id data) {
            @jobs_strongify(self)
            if (self.currentPage.integerValue > 1) {
                self.byCurrentPage(@(self.currentPage.integerValue - 1));
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)roll{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.index <= self.dataMutArr.count - 1 &&
            self.index >= 0) {
            [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                                        animated:YES
                                  scrollPosition:UITableViewScrollPositionMiddle];
        }
    };
}
/*
 * 如果用户下拉,返回1;如果上拉快到底部时返回2
 * 并且在映射完成后用了distinctUntilChanged属性,当我的映射值不产生变化时是不会传递映射值的
 * 这样当用户拉倒需要刷新的位置,只会发一个信号给订阅者,只会执行一次刷新数据的方法
 */
-(jobsByVoidBlock _Nonnull)monitorScrollView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [[[RACObserve(self.tableView, contentOffset) map:^id(id value) {
            if (self.tableView.contentOffset.y < - 50) {
                //下拉刷新方法
    //            JobsLog(@"1");
                return @"1";
            }
            if (self.tableView.contentOffset.y - self.tableView.contentSize.height < 80 &&
                self.tableView.contentSize.height > 80) {
                //上拉加载方法
                self.tableView.mj_footer.byHidden(NO);
    //            [self.tableView.mj_footer endRefreshingWithNoMoreData]; MJRefreshStateNoMoreData
                self.tableView.mj_footer.byState(MJRefreshStateNoMoreData);
                [self.tableView.mj_footer endRefreshing];
    //            JobsLog(@"2");
                return @"2";
            }else{
    //            JobsLog(@"0");
                return @"0";
            }
        }] distinctUntilChanged] subscribeNext:^(id x) {
            JobsLog(@"%@",x);
            if ([x integerValue] == 1) {
    //            JobsLog(@"↓");
            }else if ([x integerValue] == 2){
    //            JobsLog(@"↑");
            }
        }];
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsPlayerTBVCell.cellHeightByModel(nil);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsPlayerTBVCell *cell = JobsPlayerTBVCell.cellStyleValue1ByTableView(tableView);
    cell.byIndex(indexPath.row);
    self.byIndex(indexPath.row);
    @jobs_weakify(self)
    cell.jobsRichElementsTableViewCellBy(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
        @jobs_strongify(self)
        viewModel.byRow(indexPath.row)
                 .byData(self.dataMutArr[indexPath.row]);
    })).JobsBlock1(^(JobsTuple *data) {
        @jobs_strongify(self)
        NSNumber *direction = data.jobsTupleValueArr()[0];
        NSNumber *index = data.jobsTupleValueArr()[1];
        self.byIndex(index.intValue);
        if (direction.intValue) {//手势朝下
            self.index -= 1;
        }else{//手势朝上
            self.index += 1;
        }
        if (self.index < 0) {
            self.byIndex(0);
        }
        if (self.index > self.dataMutArr.count - 1) {
            self.byIndex(self.dataMutArr.count - 1);
        }
        JobsLog(@"MMM = %ld",self.index);
        [self roll]();
    });
    JobsLog(@"DDD0 = %ld",self.index);
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_1.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
    return action ? action(tableView) : (NSInteger){0};
}

-(JobsRetNSIntegerByUITableViewBlock _Nonnull)jobsNumberOfSectionsInTableView{
    @jobs_weakify(self)
    return ^NSInteger(UITableView * tableView){
        @jobs_strongify(self)
        if (!self) return (NSInteger){0};
        return 1;
    };
}
/// UITableViewCell 的生命周期 : 将要出现的cell
- (void)tableView:(UITableView *)tableView
  willDisplayCell:(JobsPlayerTBVCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsLog(@"KKK %ld",(long)indexPath.row);
    [cell.getPlayer().currentPlayerManager play];
}
/// 已经消失的 UITableViewCell
- (void)tableView:(UITableView *)tableView
didEndDisplayingCell:(JobsPlayerTBVCell *)cell
forRowAtIndexPath:(NSIndexPath*)indexPath{
    JobsLog(@"DDDD %ld",(long)indexPath.row);
    [cell.getPlayer().currentPlayerManager pause];
}
#pragma mark —— lazyLoad
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    JobsLog(@"下拉刷新");
                    self.byCurrentPage(@(1));
                    // @"data".readLocalFileWithName;/// 获取本地的数据
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                }].byMJRefreshHeaderConfigModel(self.jobsMjHeaderDefaultConfig()))
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    JobsLog(@"上拉加载更多");
                    self.byCurrentPage(@(self.currentPage.integerValue + 1));
                //    JobsLog(@"%@",self.tableView.mj_footer);
                //    [self.tableView.mj_footer endRefreshing];
                //    [self.tableView reloadData];
                //    //特别说明：pagingEnabled = YES 在此会影响Cell的偏移量，原作者希望我们在这里临时关闭一下，刷新完成以后再打开
                //    self.tableView.pagingEnabled = NO;
                //    [self performSelector:@selector(delayMethods) withObject:nil afterDelay:2];
                    // @"data".readLocalFileWithName;/// 获取本地的数据
                    self->_tableView.endRefreshing(self.dataMutArr.count);
                }].byMJRefreshFooterConfigModel(self.jobsMjFooterDefaultConfig()))
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byPagingEnabled(YES)
                .byShowsVerticalScrollIndicator(NO)
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.byTitle(@"暂无数据".jobsTr())
                        .bySubTitle(@"骚等片刻".jobsTr())
                        .byTitleCor(JobsWhiteColor)
                        .byTitleFont(bayonRegular(JobsWidth(30)))
                        .byNormalImage(@"暂无数据".img)
                        .byBaseBackgroundColor(JobsClearColor.colorWithAlphaComponentBy(0));
                }))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsBlackColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view);
                    if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                        make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    }else{
                        make.top.equalTo(self.view.mas_top);
                    }
                    make.bottom.equalTo(self.view.mas_bottom).offset(AppDelegate.tabBarVC.tabBar.isHidden ? 0 : -JobsTabBarHeightByBottomSafeArea(AppDelegate.tabBarVC));
                });
            self.view.byMjRefreshTargetView(tableView);
        });
    };return _tableView;
}

-(NSMutableArray <VideoModel_Core *>*)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <VideoModel_Core *>*_Nullable data) {
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4")
                    .byVideoTitle(@"第1条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第1条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4")
                    .byVideoTitle(@"第2条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第2条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4")
                    .byVideoTitle(@"第3条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第3条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4")
                    .byVideoTitle(@"第4条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第4条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7194236f31b2e1e3da0fe06cfed4ba2b.mp4")
                    .byVideoTitle(@"第5条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第5条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
                    .byVideoTitle(@"第6条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第6条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"http://vjs.zencdn.net/v/oceans.mp4")
                    .byVideoTitle(@"第7条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第7条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://media.w3.org/2010/05/sintel/trailer.mp4")
                    .byVideoTitle(@"第8条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第8条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4")
                    .byVideoTitle(@"第9条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }))/// 第9条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data) {
//                data.isPraise;
//                data.authorId;
//                data.videoSort;
//                data.headImage;
//                data.praiseNum;
//                data.author;
//                data.videoId;
//                data.videoSize;
//                data.isVip;
//                data.commentNum;
//                data.isAttention;
//                data.areSelf;
//                data.publishTime;
//                data.playNum;
//                data.videoTime;
                data
                    .byVideoIdcUrl(@"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4")
                    .byVideoTitle(@"第10条视频".jobsTr())
                    .byVideoImg(@"视频封面");
            }));/// 第10条视频
        });
    };return _dataMutArr;
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN RequestTool
@implementation RequestTool (JobsLocalPropertyDSLAutogen_727a9291be)
-(JobsRetRequestToolByHTTPRequestHeaderLanguageTypeBlock _Nonnull)byLanguageType{
    @jobs_weakify(self)
    return ^__kindof RequestTool * _Nullable(HTTPRequestHeaderLanguageType data){
        @jobs_strongify(self)
        [self setLanguageType:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END RequestTool
