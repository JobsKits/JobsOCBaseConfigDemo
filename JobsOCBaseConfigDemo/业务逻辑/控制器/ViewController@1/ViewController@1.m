//
//  ViewController@1.m
//  JobsOCBaseConfig
//
//  Created by Jobs on 2022/1/8.
//

#import "ViewController@1.h"

BOOL ISLogin;
#import "DefineProperty.h"

@interface ViewController_1 ()
/// UI
Prop_strong()BaseButton *userHeadBtn;
/// Data
Prop_strong()NSMutableArray <__kindof UITableViewCell *>*tbvCellMutArr;
Prop_strong()NSMutableArray <UIViewModel *>*dataMutArr;

@end

@implementation ViewController_1

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    }return self;
}

-(void)loadView{
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel.backBtnTitleModel.text = @"返回".tr;
        self.viewModel.textModel.textCor = HEXCOLOR(0x3D4A58);
        self.viewModel.textModel.text = @"相关功能列表".tr;
        self.viewModel.textModel.font = UIFontWeightRegularSize(16);
        
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        self.viewModel.bgCor = RGBA_COLOR(255, 238, 221, 1);
    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        self.viewModel.navBgCor = RGBA_COLOR(255, 238, 221, 1);
        self.viewModel.navBgImage = @"导航栏左侧底图".img;
    }
    /// 装填用户信息数据
    /// json生成器 ： https://www.site24x7.com/zhcn/tools/json-generator.html
    self.saveUserInfo(JobsUserModel.byData(@"UserData".readLocalFileWithName));// 保存全局唯一的一份用户档案
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JobsWhiteColor;
    if (@available(iOS 11.0, *)) {
        self.view.backgroundColor = @"TextColor0".namedCor;
    }else{
        self.view.backgroundColor = JobsWhiteColor;
    }
    @jobs_weakify(self)
    self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        @jobs_strongify(self)
        data.add(UIBarButtonItem.initBy(self.userHeadBtn));
    });
    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
//        @jobs_strongify(self)
//        data.add(UIBarButtonItem.initBy(self.deleteBtn));
    });
    self.makeNavByAlpha(1);
    self.navBar.backBtn.jobsVisible = NO;
    self.navBar.titleLab.text = self.viewModel.textModel.text;
    
    self.tableView.byShow(self);
    self.suspendBtn.alpha = 1;
    self.objBlock = ^(id data) {
        @jobs_strongify(self)
        if ([data isKindOfClass:JobsSuspendBtn.class]) {
            JobsSuspendBtn *suspendBtn = (JobsSuspendBtn *)data;
            if (suspendBtn.selected) {
                NSInteger s = self.tableView.numberOfSections; // 有多少组
                if (s < 1) return;
                NSInteger r = [self.tableView numberOfRowsInSection:s - 1]; // 最后一组有多少行
                if (r < 1) return;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:r - 1 inSection:s - 1]; // 取最后一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionBottom
                                              animated:YES]; // 滚动到最后一行
            }else{
                NSIndexPath *indexPath = jobsMakeIndexPathZero(); // 取第一行数据
                [self.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionTop
                                              animated:YES]; // 滚动到第一行
            }
        }
    };
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_dataMutArr.count) {
        [self.dataMutArr removeAllObjects];
        _dataMutArr = nil;
    }
    [self.tableView.mj_header beginRefreshing];
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
    JobsLog(@"");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    UIDeviceOrientation f = UIDevice.currentDevice.orientation;
//    UIInterfaceOrientation s = self.getInterfaceOrientation;
//    DeviceOrientation d = self.getDeviceOrientation;
//    self.menuView.alpha = JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsBaseTableViewCell.cellHeightByModel(self.dataMutArr[indexPath.row]) * 3;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataMutArr[indexPath.row].cls) {
        self.comingToPushVCByRequestParams(self.dataMutArr[indexPath.row].cls.new,
                                           self.dataMutArr[indexPath.row]);
    }else @"尚未接入此功能".tr.toast();
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.dataMutArr.count;
}

- (__kindof UITableViewCell *)tableView:(UITableView *)tableView
                  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsBaseTableViewCell *cell = (JobsBaseTableViewCell *)self.tbvCellMutArr[indexPath.row];
    cell.JobsRichViewByModel2(self.dataMutArr[indexPath.row]);
    return cell;
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView hideSeparatorLineAtLast:indexPath
                                  cell:cell];
}
#pragma mark —— lazyLoad
-(BaseButton *)userHeadBtn{
    if (!_userHeadBtn) {
        @jobs_weakify(self)
        _userHeadBtn = BaseButton
            .initByNormalImage(@"首页_头像".img)
            .bgColorBy(JobsClearColor.colorWithAlphaComponentBy(0))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                UIViewModel *viewModel = self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                    model.byTitle(@"用户信息展示(开发测试专用)".tr)
                        .bySubTitle(@"")
                        .byCls(JobsShowObjInfoVC.class)
                        .byRequestParams(self.readUserInfo);
                }));
                [self forceComingToPushVC:viewModel.cls.new
                            requestParams:viewModel]; // 测试专用
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bySize(CGSizeMake(JobsWidth(32), JobsWidth(32)));
    }return _userHeadBtn;
}
/// self.tableView.dataLink(self);不要写在Block里面，会引起循环调用。用它进行唤起
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        /// 一般用 initWithStylePlain。initWithStyleGrouped会自己预留一块空间
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByInsetGrouped(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            tableView.bySeparatorStyle(UITableViewCellSeparatorStyleSingleLine)
                .bySeparatorColor(HEXCOLOR(0xEEE2C8))
                .registerHeaderFooterViewClass(MSCommentTableHeaderFooterView.class,nil)
                .byContentInset(UIEdgeInsetsMake(0, 0, JobsBottomSafeAreaHeight(), 0))
                .byTableHeaderView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    /// TODO
                })) // 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .byTableFooterView(jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
                    label.byText(@"- 没有更多的内容了 -".tr)
                        .byFont(UIFontWeightRegularSize(12))
                        .byTextAlignment(NSTextAlignmentCenter)
                        .byTextCor(HEXCOLOR(0xB0B0B0))
                        .makeLabelByShowingType(UILabelShowingType_03);
                }))/// 这里接入的就是一个UIView的派生类。只需要赋值Frame，不需要addSubview
                .emptyDataByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
                    data.title = @"NO MESSAGES FOUND".tr;
                    data.titleCor = JobsWhiteColor;
                    data.titleFont = bayonRegular(JobsWidth(30));
                    data.normalImage = @"小狮子".img;
                }))
                /// 普通的MJRefreshHeader（触发事件）@二选一
                .byMJRefreshHeader([MJRefreshNormalHeader headerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshHeaderConfigModel(self.mjHeaderDefaultConfig))
                /// MJRefreshHeader的拓展：下拉刷新Lottie动画@二选一
                //.byMJRefreshHeader(self.lotAnimMJRefreshHeader.byRefreshConfigModel(jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {})))
                /// 普通的MJRefreshFooter（触发事件）
                .byMJRefreshFooter([MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                    @jobs_strongify(self)
                    NSObject.feedbackGenerator(nil);/// 震动反馈
                    self->_tableView.endRefreshing(YES);
                }].byMJRefreshFooterConfigModel(self.mjFooterDefaultConfig))

                .byShowsVerticalScrollIndicator(NO)
                .byShowsHorizontalScrollIndicator(NO)
                .byScrollEnabled(YES)
                .byBgColor(JobsClearColor);

            if(@available(iOS 11.0, *)) {
                tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }else{
                SuppressWdeprecatedDeclarationsWarning(self.automaticallyAdjustsScrollViewInsets = NO);
            }

//            {
//                tableView.MJRefreshNormalHeaderBy([self refreshHeaderDataBy:^id _Nullable(id  _Nullable data) {
//                    @jobs_strongify(self)
//                    self.feedbackGenerator(nil);//震动反馈
//                    self->_tableView.endRefreshing(YES);
//                    return nil;
//                }]);
//                tableView.mj_header.automaticallyChangeAlpha = YES;//根据拖拽比例自动切换透明度
//            }

//            {/// 设置tabAnimated相关属性
//                // 可以不进行手动初始化，将使用默认属性
//                tableView.tabAnimated = [TABTableAnimated animatedWithCellClass:JobsBaseTableViewCell.class
//                                                                      cellHeight:[JobsBaseTableViewCell cellHeightWithModel:nil]];
//                tableView.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;
//                [tableView tab_startAnimation];   // 开启动画
//            }

//            {
//              [tableView xzm_addNormalHeaderWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//
//              [tableView xzm_addNormalFooterWithTarget:self
//                                                 action:selectorBlocks(^id _Nullable(id _Nullable weakSelf,
//                                                                                     id _Nullable arg) {
//                  NSLog(@"SSSS加载新的数据，参数: %@", arg);
//                  @jobs_strongify(self)
//                  /// 在需要结束刷新的时候调用（只能调用一次）
//                  /// _tableView.endRefreshing();
//                  return nil;
//              }, MethodName(self), self)];
//              [tableView.xzm_header beginRefreshing];
//          }
        })
        .addOn(self.view)
        .byAdd(^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.left.right.bottom.equalTo(self.view);
            [self make:make topOffset:10];
        });
    }return _tableView;
}

-(NSMutableArray<__kindof UITableViewCell *> *)tbvCellMutArr{
    if (!_tbvCellMutArr) {
        @jobs_weakify(self)
        _tbvCellMutArr = jobsMakeMutArr(^(NSMutableArray <__kindof UITableViewCell *>*_Nullable data) {
            @jobs_strongify(self)
            [self.dataMutArr enumerateObjectsUsingBlock:^(UIViewModel * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
                @jobs_strongify(self)
                data.add(JobsBaseTableViewCell.cellStyleValue1WithTableView(self.tableView));
            }];
        });
    }return _tbvCellMutArr;
}

-(NSMutableArray<UIViewModel *> *)dataMutArr{
    if (!_dataMutArr) {
        @jobs_weakify(self)
        _dataMutArr = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
            @jobs_strongify(self)
            data.add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"模拟时钟".tr;
                model.subTitle = @"模拟时钟".tr;
                model.cls = JobsClockDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTabBarCtr".tr;
                model.subTitle = @"JobsTabBarCtr".tr;
                model.cls = JobsTabBarCtrlDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"苹果滑动开锁".tr;
                model.subTitle = @"苹果滑动开锁".tr;
                model.cls = SlideToUnlockDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsNavigationDemoVC".tr;
                model.subTitle = @"系统导航栏".tr;
                model.cls = JobsNavigationDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsScrollLabelVC".tr;
                model.subTitle = @"当文本超出的时候，滚动展现文字的Label".tr;
                model.cls = JobsScrollLabelVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTimer".tr;
                model.subTitle = @"☀️时间模块".tr;
                model.cls = JobsTimerVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CalendarVC".tr;
                model.subTitle = @"日历功能".tr;
                model.cls = CalendarVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsVerticalMenuMainVC".tr;
                model.subTitle = @"竖形菜单选择功能".tr;
                model.cls = JobsVerticalMenuMainVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsViewNavigatorTestVC".tr;
                model.subTitle = @"让 UIView 像 UINavigationController 一样支持 push 和 pop".tr;
                model.cls = JobsViewNavigatorTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Excel".tr;
                model.subTitle = @"Excel".tr;
                model.cls = ExcelVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryViewVerticalShowVC".tr;
                model.subTitle = @"JXCategoryView垂直表达".tr;
                model.cls = JXCategoryViewVerticalShowVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"发帖（图文）功能".tr;
                model.subTitle = @"相册获取资源+存/取未完成字符串".tr;
                model.cls = JobsPostVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"将图片用字符串（加盐）进行存取".tr;
                model.subTitle = @"一种图片加密的手段，简单而粗暴.".tr;
                model.cls = PicToStrStoreVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS 热更新".tr;
                model.subTitle = @"".tr;
                model.cls = HotRefreshVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS 多语言切换".tr;
                model.subTitle = @"".tr;
                model.cls = AppLanguageVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"FMDB示例".tr;
                model.subTitle = @"增删查改".tr;
                model.cls = FMDB_VC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Realm示例".tr;
                model.subTitle = @"增删查改".tr;
                model.cls = Realm_VC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"幸运轮盘".tr;
                model.subTitle = @"中间有抽奖按钮".tr;
                model.cls = LotteryVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"文本前有小圆点".tr;
                model.subTitle = @"包括对齐".tr;
                model.cls = PointLabTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"iOS Widget".tr;
                model.subTitle = @"".tr;
                model.cls = WidgetVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"手机横屏".tr;
                model.subTitle = @"全局设定".tr;
                model.cls = LandscapeSwitchVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Texture".tr;
                model.subTitle = @"byFaceBook".tr;
                model.cls = TextureDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"本地推送通知".tr;
                model.subTitle = @"本地推送通知".tr;
                model.cls = LocalNotificationsVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"字符串解压缩".tr;
                model.subTitle = @"字符串解压缩".tr;
                model.cls = CompressStrVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"动态切换App图标".tr;
                model.subTitle = @"只能跑真机，模拟器编译报错，且iOS 10.3 或更高版本".tr;
                model.cls = AppIconSwitchingVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"长按Cell出3D-Touch的菜单".tr;
                model.subTitle = @"PeekAndPop".tr;
                model.cls = PeekAndPopVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"系统剪切板测试".tr;
                model.subTitle = @"尝试控制粘贴提示".tr;
                model.cls = CtrlClipboardCueVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsAppDoor-1".tr;
                model.subTitle = @"登录注册的第一种表现形式".tr;
                model.cls = JobsAppDoorVC.class;
                model.requestParams = @(JobsAppDoorBgType_Video);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsAppDoor-2".tr;
                model.subTitle = @"登录注册的第二种表现形式".tr;
                model.cls = JobsAppDoorVC_Style2.class;
                model.requestParams = @(JobsAppDoorBgType_Video);
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Douyin_ZFPlayer_1".tr;
                model.subTitle = @"播放效果 1".tr;
                model.cls = Douyin_ZFPlayerVC_1.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Douyin_ZFPlayer_2".tr;
                model.subTitle = @"播放效果 2".tr;
                model.cls = Douyin_ZFPlayerVC_2.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TransparentRegion".tr;
                model.subTitle = @"镂空特效".tr;
                model.cls = TransparentRegionVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsComment".tr;
                model.subTitle = @"📃评论功能".tr;
                model.cls = JobsCommentVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsSearch".tr;
                model.subTitle = @"🔍搜索功能".tr;
                model.cls = JobsSearchVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"ShadowTBVCell".tr;
                model.subTitle = @"";
                // model.cls = nil;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"相册选取图片和视频".tr;
                model.subTitle = @"".tr;
                model.cls = JobsShootingVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"DynamicView".tr;
                model.subTitle = @"Gif图片读取".tr;
                model.cls = DynamicViewTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Progress".tr;
                model.subTitle = @"进度条".tr;
                model.cls = JobsProgressVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"IrregularView".tr;
                model.subTitle = @"不规则的按钮".tr;
                model.cls = TestIrregularViewTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTimerTestVC".tr;
                model.subTitle = @"🌛JobsTimer模块测试".tr;
                model.cls = NSTimerManagerTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsIMShowVC".tr;
                model.subTitle = @"IM模块".tr;
                model.cls = JobsIMShowVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TestLabelVC".tr;
                model.subTitle = @"Label的科学管理".tr;
                model.cls = TestLabelVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsDropDownListVC".tr;
                model.subTitle = @"👇🏻下拉列表".tr;
                model.cls = JobsDropDownListVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"YTKNetworkStudyVC".tr;
                model.subTitle = @"探究猿题库网络框架（YTKNetwork）".tr;
                model.cls = YTKNetworkStudyVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CoreTextLearningVC".tr;
                model.subTitle = @"探究CoreText".tr;
                model.cls = CoreTextLearningVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryPopupVC".tr;
                model.subTitle = @"JXCategoryView+PopupView".tr;
                model.cls = JXCategoryPopupVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UITableViewCellEditorVC".tr;
                model.subTitle = @"替换系统UITableViewCell编辑状态下前面的按钮UI样式，及其一部分逻辑".tr;
                model.cls = UITableViewCellEditorVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsSettingGestureVC".tr;
                model.subTitle = @"设置手势密码".tr;
                model.cls = JobsSettingGestureVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsTestVC".tr;
                model.subTitle = @"进行测试的一个控制器".tr;
                model.cls = JobsTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CXBVC".tr;
                model.subTitle = @"CXB自研科技".tr;
                model.cls = CXBVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"OCDynamicRegisterVC".tr;
                model.subTitle = @"OC动态添加类、方法列表、属性列表".tr;
                model.cls = OCDynamicRegisterVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JXCategoryViewWithHeaderViewVC".tr;
                model.subTitle = @"JXCategoryView下拉放大头部视图".tr;
                model.cls = JXCategoryViewWithHeaderViewVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UILabelWordRotatingVC".tr;
                model.subTitle = @"UILabel文字旋转".tr;
                model.cls = UILabelWordRotatingVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"TestBaseLabelVC".tr;
                model.subTitle = @"测试 -BaseLabel-".tr;
                model.cls = TestBaseLabelVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"RandomTestVC".tr;
                model.subTitle = @"随机数测试模块".tr;
                model.cls = RandomTestVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CustomTableViewCellVC".tr;
                model.subTitle = @"自定义UITableViewCell内置控件距离并添加复制按钮".tr;
                model.cls = CustomTableViewCellVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"CustomBtnVC".tr;
                model.subTitle = @"自定义UIButton子控件的排布".tr;
                model.cls = CustomBtnVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"GXCardViewDemoVC".tr;
                model.subTitle = @"卡片式布局(探探附近/QQ配对)，可以设置卡片堆叠效果，可以设置循环效果".tr;
                model.cls = GXCardViewDemoVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsWalletVC".tr;
                model.subTitle = @"UICollectionView实现重叠的卡包效果".tr;
                model.cls = JobsWalletVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"JobsScrollViewVC".tr;
                model.subTitle = @"在指定的y区间内滑动视图(带吸边效果)".tr;
                model.cls = JobsScrollViewVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"转场动画探究".tr;
                model.subTitle = @"UIPresentationController的使用".tr;
                model.cls = JobsPresentingVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"Masonry的应用与实践".tr;
                model.subTitle = @"UIPresentationController的使用".tr;
                model.cls = MasonryVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"UITBVCellFoldVC";
                model.subTitle = @"UITableViewCell的折叠效果".tr;
                model.cls = UITBVCellFoldVC.class;
            })))
            .add(self.makeDatas(jobsMakeDecorationModel(^(__kindof JobsDecorationModel * _Nullable model) {
                model.title = @"ProtocolKitVC";
                model.subTitle = @"Objective-C中实现协议扩展".tr;
                model.cls = ProtocolKitVC.class;
            })));
        });
    }return _dataMutArr;
}

@end
