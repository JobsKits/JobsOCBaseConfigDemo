//
//  Douyin_ZFPlayerVC@2.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "Douyin_ZFPlayerVC@2.h"

@interface Douyin_ZFPlayerVC_2 ()
/// UI
Prop_strong()ZFPlayerController *player;
Prop_strong()ZFDouYinControlView *controlView;
Prop_strong()ZFCustomControlView *fullControlView;
Prop_strong()JobsBitsMonitorSuspendLab *bitsMonitorSuspendLab;
/// Data
Prop_strong()NSMutableArray <VideoModel_Core *>*dataMutArr;/// 我的数据源

-(JobsRetDouyinZFPlayerVC2ByIndexPathBlock _Nonnull)byIndexPath;

@end

@implementation Douyin_ZFPlayerVC_2

-(JobsRetDouyinZFPlayerVC2ByIndexPathBlock _Nonnull)byIndexPath{
    @jobs_weakify(self)
    return ^__kindof Douyin_ZFPlayerVC_2 *_Nullable(NSIndexPath *_Nullable indexPath){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setIndexPath:indexPath];
        return self;
    };
}

-(void)dealloc {
    JobsLog(@"%@",JobsLocalFunc);
}
#pragma mark —— Lifecycle
-(instancetype)init{
    if (self = [super init]) {
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            .byBgCor(JobsClearColor)
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightRegularSize(18))
                    .byText(data.attributedTitle.string);
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            // self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
            /// 全局只需要写一次。在AppDelegate里面进行配置
    };
}

-(void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.bitsMonitorSuspendLab.byVisible(YES);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.tableView.mj_header.beginRefreshing;
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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

- (void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.player.currentPlayerManager.stop;
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        /// 销毁流程
        [self.bitsMonitorSuspendLab removeFromSuperview];
        ((JobsNetworkTrafficMonitor *)JobsNetworkTrafficMonitor.shared()).byStop();
        JobsNetworkTrafficMonitor.destroyShared();
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLayoutSubviews];
            /**
             * 请求到数据以后，刷新界面reloadData
             * 这个时候会先走UITableViewDelegate,UITableViewDataSource
             * 再viewWillLayoutSubviews-viewDidLayoutSubviews
             * 在这个时候拿到确定的当前self.indexPath进行播放
             */
        //    if (self.dataMutArr.count) {
        //        [self playTheVideoAtIndexPath:self.indexPath];
        //        [self.tableView ly_hideEmptyView];
        //    }else{
        //        [self.tableView ly_showEmptyView];
        //    }
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)requestData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
        [self.player stopCurrentPlayingCell];
        /// 获取本地的数据
        NSDictionary *rootDict = @"data".readLocalFileWithName();
        NSArray *videoList = [rootDict objectForKey:@"list"];
        for (NSDictionary *dataDic in videoList) {
            VideoModel_Core *model = VideoModel_Core.byData(dataDic);
            self.dataMutArr.add(model);
        }
        /// 找到可以播放的视频并播放
        @jobs_weakify(self)
        [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
            @jobs_strongify(self)
            self.playTheVideoAtIndexPath(indexPath);
        }];
        self.tableView.endRefreshing(self.dataMutArr.count);
    //    [self endRefreshingWithNoMoreData:self.tableView];
    };
}

-(jobsByIndexPathBlock _Nonnull)playTheVideoAtIndexPath{
    @jobs_weakify(self)
    return ^(NSIndexPath * indexPath){
        @jobs_strongify(self)
        if (!self) return;
        VideoModel_Core *data = (VideoModel_Core *)self.dataMutArr[indexPath.row];
        {
            NSString *URLString = [data.videoIdcUrl stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
            NSURL *URL = [KTVHTTPCache proxyURLWithOriginalURL:URLString.jobsURL()];
            [self.player playTheIndexPath:indexPath assetURL:URL];
        }
        self.controlView
            .byResetControlView()
            .byShowCoverViewWithUrl(data.thumbnail_url);
        [self.fullControlView showTitle:@"custom landscape controlView".jobsTr()
                         coverURLString:data.thumbnail_url /// data.videoImg
                         fullScreenMode:ZFFullScreenModeLandscape];
    };
}
/// 指定到某一行播放
-(jobsByNSIntegerBlock _Nonnull)playTheIndex{
    @jobs_weakify(self)
    return ^(NSInteger index){
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        [self.tableView scrollToRowAtIndexPath:JobsIndexPathForRow(0, index)
                              atScrollPosition:UITableViewScrollPositionNone
                                      animated:NO];
        [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
            @jobs_strongify(self)
            self.playTheVideoAtIndexPath(indexPath);
        }];
        /// 如果是最后一行，去请求新数据
        if (index == self.dataMutArr.count - 1) {
            /// 加载下一页数据
    //        [self requestData:YES];
            self.requestData();
        }
    };
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
- (BOOL)shouldAutorotate {
    return NO;
}
#pragma clang diagnostic pop
-(UIStatusBarStyle)preferredStatusBarStyle{
    JobsRetUIStatusBarStyleByVoidBlock action = ((JobsRetUIStatusBarStyleByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsPreferredStatusBarStyle)))(self, @selector(jobsPreferredStatusBarStyle));
    return action ? action() : (UIStatusBarStyle){0};
}

-(JobsRetUIStatusBarStyleByVoidBlock _Nonnull)jobsPreferredStatusBarStyle{
    @jobs_weakify(self)
    return ^UIStatusBarStyle{
        @jobs_strongify(self)
        if (!self) return (UIStatusBarStyle){0};
        return UIStatusBarStyleLightContent;
    };
}

-(BOOL)prefersStatusBarHidden{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsPrefersStatusBarHidden)))(self, @selector(jobsPrefersStatusBarHidden)))();
}

-(JobsRetBOOLByVoidBlock _Nonnull)jobsPrefersStatusBarHidden{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return NO;
    };
}
#pragma mark —— UIViewModelOthersProtocol
-(void)zf_douyinRotation{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsZf_douyinRotation)))(self, @selector(jobsZf_douyinRotation));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsZf_douyinRotation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIInterfaceOrientation orientation = UIInterfaceOrientationUnknown;
        if(self.player.isFullScreen){
            orientation = UIInterfaceOrientationPortrait;
        }else{
            orientation = UIInterfaceOrientationLandscapeRight;
        }
        [self.player rotateToOrientation:orientation
                                animated:YES
                              completion:nil];
    };
}
#pragma mark —— UIScrollViewDelegate 列表播放必须实现
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsScrollViewDidEndDecelerating)))(self, @selector(jobsScrollViewDidEndDecelerating));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidEndDecelerating{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        [scrollView zf_scrollViewDidEndDecelerating];
    };
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    [scrollView zf_scrollViewDidEndDraggingWillDecelerate:decelerate];
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsScrollViewDidScrollToTop)))(self, @selector(jobsScrollViewDidScrollToTop));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScrollToTop{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        [scrollView zf_scrollViewDidScrollToTop];
    };
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        [scrollView zf_scrollViewDidScroll];
    };
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsScrollViewWillBeginDragging)))(self, @selector(jobsScrollViewWillBeginDragging));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewWillBeginDragging{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        [scrollView zf_scrollViewWillBeginDragging];
    };
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsVideoTBVCell.cellHeightByModel(tableView);
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return self.dataMutArr.count;
}

-(__kindof UITableViewCell *)tableView:(UITableView *)tableView
                 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.byIndexPath(indexPath);
    return JobsVideoTBVCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .byIndex(indexPath.row)
        .byDelegate(self)
        .jobsRichElementsTableViewCellBy(self.dataMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {;
            });
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    (((jobsByIndexPathBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(playTheVideoAtIndexPath)))(self, @selector(playTheVideoAtIndexPath)))(indexPath);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    JobsRetNSIntegerByUITableViewBlock action = ((JobsRetNSIntegerByUITableViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(Douyin_ZFPlayerVC_2.class, @selector(jobsNumberOfSectionsInTableView)))(self, @selector(jobsNumberOfSectionsInTableView));
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
#pragma mark —— lazyLoad
-(JobsBitsMonitorSuspendLab *)bitsMonitorSuspendLab{
    if (!_bitsMonitorSuspendLab) {
        @jobs_weakify(self)
        _bitsMonitorSuspendLab = [JobsBitsMonitorSuspendLab.alloc initBy:JobsBitsMonitorDisplayStyleRichText]
            .byAllowDrag(YES)
            .byFont(UIFontWeightBoldSize(10))
            .byTextCor(JobsRedColor)
            .byVc(weak_self)
            .byBgColor(JobsLightGrayColor)
            .byFrame(JobsBitsMonitorSuspendLab.viewFrameByModel(nil))
            .addOn(self.view);
    };return _bitsMonitorSuspendLab;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
- (UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.dataLink(self)
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byPagingEnabled(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byScrollsToTop(NO)
                .byBgColor(JobsBlackColor);
            if (@available(iOS 11.0, *)) {
                tableView.byEstimatedRowHeight(0)
                    .byEstimatedSectionFooterHeight(0)
                    .byEstimatedSectionHeaderHeight(0)
                    .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            } else {
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }
            {
                tableView.byMJRefreshHeader(self.view.MJRefreshNormalHeaderBy(self.refreshHeaderDataBy(^id _Nullable(id  _Nullable data) {
                    @jobs_strongify(self )
                    JobsLog(@"下拉刷新");
                    self.byCurrentPage(@(1));
                    self.requestData();
                //    [self requestData:NO];
                //    [self playVideo];
                    return nil;
                })));
                tableView.byMJRefreshFooter(self.view.MJRefreshFooterBy(self.refreshFooterDataBy(^id _Nullable(id  _Nullable data) {
                    JobsLog(@"上拉加载更多");
                    self.byCurrentPage(@(self.currentPage.integerValue + 1));
                    self.requestData();
                //    JobsLog(@"currentPageNum = %ld",self.currentPage);
                //    [self requestData:YES];
                //    [self playVideo];
                    return nil;
                })));tableView.mj_footer.byHidden(NO);
            }
    //        {// 设置tabAnimated相关属性
    //            tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
    //                                                                  cellHeight:JobsBaseTableViewCell.cellHeightByModel(nil)];
    //            tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeBinAnimation;
    //            tableView.tabAnimated.canLoadAgain = YES;
    ////            _tableView.tabAnimated.animatedBackViewCornerRadius = JobsWidth(8);
    ////            _tableView.tabAnimated.animatedBackgroundColor = JobsRedColor;
    //            [tableView tab_startAnimation];   // 开启动画
    //        }
            tableView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }else{
                    make.top.equalTo(self.view.mas_top);
                }make.bottom.equalTo(self.view.mas_bottom);
            });
        });
    };return _tableView;
}

-(ZFPlayerController *)player{
    if (!_player) {
        /// player,tag值必须在cell里设置
        _player = [ZFPlayerController playerWithScrollView:self.tableView
                                             playerManager:jobsMakeZFAVPlayerManager(^(__kindof ZFAVPlayerManager * _Nullable data) {})
                                          containerViewTag:kPlayerViewTag];
        _player.byDisableGestureTypes(ZFPlayerDisableGestureTypesPan | ZFPlayerDisableGestureTypesPinch);
        _player.byControlView(self.controlView);
        _player.byAllowOrentitaionRotation(NO);
        _player.byWWANAutoPlay(YES);
        /// 1.0是完全消失时候
        _player.byPlayerDisapperaPercent(1.0);
        @jobs_weakify(self)
        _player.playerDidToEnd = ^(id _Nonnull asset) {
            @jobs_strongify(self)
            [self->_player.currentPlayerManager replay];
        };
        _player.orientationWillChange = ^(ZFPlayerController * _Nonnull player,
                                          BOOL isFullScreen) {
            AppDelegate.jobsSharedManager().allowOrentitaionRotation = isFullScreen;
            @jobs_strongify(self)
            self->_player.controlView.byHidden(YES);
        };
        _player.orientationDidChanged = ^(ZFPlayerController * _Nonnull player,
                                          BOOL isFullScreen) {
            @jobs_strongify(self)
            self->_player.controlView.byHidden(NO);
            self->_player.controlView = isFullScreen ? self.fullControlView : self.controlView;
        };
        /// 更新另一个控制层的时间
        _player.playerPlayTimeChanged = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset,
                                          NSTimeInterval currentTime,
                                          NSTimeInterval duration) {
            @jobs_strongify(self)
            if ([self->_player.controlView isEqual:self.fullControlView]) {
                [self.controlView videoPlayer:self->_player
                                  currentTime:currentTime
                                    totalTime:duration];
            } else if ([self->_player.controlView isEqual:self.controlView]) {
                [self.fullControlView videoPlayer:self->_player
                                      currentTime:currentTime
                                        totalTime:duration];
            }
        };
        /// 更新另一个控制层的缓冲时间
        _player.playerBufferTimeChanged = ^(id<ZFPlayerMediaPlayback>  _Nonnull asset,
                                            NSTimeInterval bufferTime) {
            @jobs_strongify(self)
            if ([self->_player.controlView isEqual:self.fullControlView]) {
                [self.controlView videoPlayer:self->_player
                                   bufferTime:bufferTime];
            } else if ([self->_player.controlView isEqual:self.controlView]) {
                [self.fullControlView videoPlayer:self->_player
                                       bufferTime:bufferTime];
            }else{}
        };
        /// 停止的时候找出最合适的播放
        _player.zf_scrollViewDidEndScrollingCallback = ^(NSIndexPath * _Nonnull indexPath) {
            @jobs_strongify(self)
            if (self->_player.playingIndexPath) return;
            if (indexPath.row == self.dataMutArr.count - 1) {
                /// 加载下一页数据
//                [self requestData:YES];
                self.requestData();
                self.tableView.reloadDatas();
            }self.playTheVideoAtIndexPath(indexPath);
        };
    };return _player;
}

-(NSMutableArray <VideoModel_Core *>*)dataMutArr{
    if (!_dataMutArr) {
        _dataMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <VideoModel_Core *>*_Nullable data) {
            /// 第1条视频
            data.add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-tpl-cc-us-20170912_1280x720h.mp4")
                    .byVideoTitle(@"第1条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第2条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/cn/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/bruce/mac-bruce-tpl-cn-2018_1280x720h.mp4")
                    .byVideoTitle(@"第2条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第3条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/peter/mac-peter-tpl-cc-us-2018_1280x720h.mp4")
                    .byVideoTitle(@"第3条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第4条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://www.apple.com/105/media/us/mac/family/2018/46c4b917_abfd_45a3_9b51_4e3054191797/films/grimes/mac-grimes-tpl-cc-us-2018_1280x720h.mp4")
                    .byVideoTitle(@"第4条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第5条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7194236f31b2e1e3da0fe06cfed4ba2b.mp4")
                    .byVideoTitle(@"第5条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第6条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
                    .byVideoTitle(@"第6条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第7条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"http://vjs.zencdn.net/v/oceans.mp4")
                    .byVideoTitle(@"第7条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第8条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://media.w3.org/2010/05/sintel/trailer.mp4")
                    .byVideoTitle(@"第8条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第9条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4")
                    .byVideoTitle(@"第9条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }))
            /// 第10条视频
            .add(jobsMakeVideoModelCore(^(__kindof VideoModel_Core * _Nullable data1) {
                data1
                    .byVideoIdcUrl(@"https://sample-videos.com/video123/mp4/480/big_buck_bunny_480p_2mb.mp4")
                    .byVideoTitle(@"第10条视频".jobsTr())
                    .byVideoImg(@"视频封面.jpg");
            }));
        });
    };return _dataMutArr;
}
@synthesize pageSize = _pageSize;
-(NSNumber *)pageSize{
    if(!_pageSize){
        _pageSize = @(6);
    };return _pageSize;
}

-(ZFDouYinControlView *)controlView{
    if (!_controlView){
        _controlView = jobsMakeZFDouYinControlView(^(__kindof ZFDouYinControlView * _Nullable label) {
        });
    };return _controlView;
}

-(ZFCustomControlView *)fullControlView{
    if (!_fullControlView) {
        _fullControlView = ZFCustomControlView.new;
    };return _fullControlView;
}
#pragma mark —— 暂时用不到的
-(jobsByBOOLBlock _Nonnull)requestDataBy{
    @jobs_weakify(self)
    return ^(BOOL isLoadMore){
        @jobs_strongify(self)
        /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
        [self.player stopCurrentPlayingCell];
        JobsLog(@"当前是否有网：%d 状态：%ld",ZBRequestManager.isNetworkReachable,ZBRequestManager.networkReachability);
        DataManager.jobsSharedManager().tag = ReuseIdentifier;
        /**
         公共配置
         插件机制
         证书设置
         */
        RequestTool.setupPublicParametersBy(jobsMakeRequestTool(^(__kindof RequestTool * _Nullable tool) {
            tool.languageType = HTTPRequestHeaderLanguageCN;
        }));
        @jobs_weakify(self)
        extern NSString *appInterfaceTesting;
        [JobsNetworkingAPI requestApi:This.jobs_appInterfaceTesting().funcName
                         parameters:@{@"pageSize":self.pageSize,
                                      @"pageNum":self.currentPage}
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
                    if (!isLoadMore && tempDataArr.count) [self.dataMutArr removeAllObjects];
                    if (isLoadMore) {
                        if (tempDataArr.count) {
                            self.dataMutArr.addBy(tempDataArr);
                            self->_tableView.endRefreshing(self.dataMutArr.count);//上拉加载更多
                        }else{
                            self->_tableView.endRefreshingWithNoMoreData(self.dataMutArr.count);//没有更多数据了
                        }
                    }
                }
                /// 找到可以播放的视频并播放
                @jobs_weakify(self)
                [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
                    @jobs_strongify(self)
                    self.playTheVideoAtIndexPath(indexPath);
                }];
            }
        }failureBlock:^(id data) {
            @jobs_strongify(self)
            if (self.currentPage.integerValue > 1) {
                self.byCurrentPage(@(self.currentPage.integerValue - 1));
            }
        }];
    };
}
//#pragma mark - ZFTableViewCellDelegate
//-(void)zf_playTheVideoAtIndexPath:(NSIndexPath *)indexPath{
//    [self playTheVideoAtIndexPath:indexPath];
//}
// 刷新加载最新数据（以前的数据全部清空）
//-(void)playVideo{
//    /// 下拉时候一定要停止当前播放，不然有新数据，播放位置会错位。
//    [self.player stopCurrentPlayingCell];
//    /// 找到可以播放的视频并播放
//    @jobs_weakify(self)
//    [self.player zf_filterShouldPlayCellWhileScrolled:^(NSIndexPath *indexPath) {
//        @jobs_strongify(self)
//        [self playTheVideoAtIndexPath:indexPath];
//    }];
//
//    [self endRefreshing:self.tableView];//上拉加载更多
//}

@end
