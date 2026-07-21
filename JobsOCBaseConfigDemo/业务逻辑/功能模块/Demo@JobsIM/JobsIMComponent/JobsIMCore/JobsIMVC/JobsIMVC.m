//
//  JobsIMVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMVC.h"

@interface JobsIMVC ()
/// UI
Prop_strong()JobsIMInputview *inputview;
Prop_strong()BaseButton *shareBtn;
Prop_strong()UIColor *bgColour;
/// data
Prop_strong()NSMutableArray <JobsIMChatInfoModel *>*chatInfoModelMutArr;//聊天信息
Prop_strong()JobsIMChatInfoModel *chatInfoModel;
Prop_assign()BOOL hasStartedInitialRefresh;

@end

@implementation JobsIMVC
- (void)dealloc {
    [JobsOCKeyboardMgr.shared clearConfigByOwner:self];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    self.isHiddenNavigationBar = YES;//禁用系统的导航栏
    [IQKeyboardManager.sharedManager.disabledDistanceHandlingClasses addObject:JobsIMVC.class];
    [IQKeyboardManager.sharedManager.disabledTouchResignedClasses addObject:JobsIMVC.class];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        self.chatInfoModel = (JobsIMChatInfoModel *)self.viewModel.data;
        self.chatInfoModelMutArr.add(self.chatInfoModel);
        self.viewModel
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(self.chatInfoModel.userNameStr)
                    .byTextCor(JobsLabelColor)
                    .byFont(UIFontWeightSemiboldSize(JobsWidth(20)));
            })
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"聊天列表".tr)
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    {
        @jobs_weakify(self)
        self.leftBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
            @jobs_strongify(self)
    //        data.add(UIBarButtonItem.initBy(self.shareBtn));
        });
        self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
            @jobs_strongify(self)
            data.add(UIBarButtonItem.initBy(self.shareBtn));
        });
        self.makeNavByAlpha(1);
    }
    self.inputview.byVisible(YES);
    self.tableView.byShow(self);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self jobs_configKeyboardMgr];
    if (!self.hasStartedInitialRefresh) {
        self.hasStartedInitialRefresh = YES;
        self.tableView.mj_beginRefreshing_header();
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.view.byEndEditing(YES);
    self.tableView.mj_endRefreshing_header();
    [JobsOCKeyboardMgr.shared clearConfigByOwner:self];
}
#pragma mark —— 一些私有方法
-(void)jobs_configKeyboardMgr{
    @jobs_weakify(self)
    JobsOCKeyboardMgr.shared.byConfig(jobsMakeOCKeyboardConfig(^(__kindof JobsOCKeyboardConfig * _Nullable data) {
        @jobs_strongify(self)
        data.byOwner(self)
            .byTargetView(self.inputview)
            .byTriggerScopeView(self.inputview)
            .byContainerView(self.view)
            .byInputFields(@[self.inputview.inputTextField])
            .byExtraSpacing(0)
            .byTopSpacing(JobsWidth(12))
            .byShouldFlowByReturnKey(NO)
            .byShouldResignOnTouchOutside(YES)
            .byAccessoryPolicy(JobsOCKeyboardAccessoryPolicyAuto);
    }));
}

-(void)simulateLocalTransportEcho{
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        UIViewModel *viewModel = (UIViewModel *)self.requestParams;
        if ([viewModel.data isKindOfClass:JobsIMChatInfoModel.class]) {
            JobsIMChatInfoModel *requestParamsChatInfoModel = (JobsIMChatInfoModel *)viewModel.data;
            self.chatInfoModelMutArr.add(jobsMakeIMChatInfoModel(^(JobsIMChatInfoModel * _Nullable chatInfoModel) {
                chatInfoModel.messageID = NSUUID.UUID.UUIDString;
                chatInfoModel.conversationID = requestParamsChatInfoModel.conversationID;
                chatInfoModel.fromUserID = requestParamsChatInfoModel.fromUserID;
                chatInfoModel.toUserID = JobsIMLocalDemoUserID();
                chatInfoModel.userID = requestParamsChatInfoModel.userID;
                chatInfoModel.chatTextStr = @"有内鬼，取消交易";
                JobsTimeModel *timeModel = self.makeSpecificTime;
                chatInfoModel.chatTextTimeStr = [NSString stringWithFormat:@"%ld:%ld:%ld",timeModel.currentHour,timeModel.currentMin,timeModel.currentSec];
                chatInfoModel.userIconIMG = requestParamsChatInfoModel.userIconIMG;
                chatInfoModel.userIconURLStr = requestParamsChatInfoModel.userIconURLStr;
                chatInfoModel.identification = JobsIMStringFromTransportKind(requestParamsChatInfoModel.transportKind);
                chatInfoModel.userNameStr = requestParamsChatInfoModel.userNameStr;
                chatInfoModel.messageType = JobsIMChatMessageType_Text;
                chatInfoModel.chatInfoDirection = JobsIMChatInfoDirection_Send;
                chatInfoModel.packetType = JobsIMPacketTypeText;
                chatInfoModel.deliveryState = JobsIMDeliveryStateReceived;
                chatInfoModel.transportKind = requestParamsChatInfoModel.transportKind;
                chatInfoModel.rawPacket = JobsIMPacketMake(JobsIMPacketTypeText,
                                                           chatInfoModel.messageID,
                                                           chatInfoModel.fromUserID,
                                                           chatInfoModel.toUserID,
                                                           @{
                                                               @"text": chatInfoModel.chatTextStr ?: @"",
                                                               @"transport": JobsIMStringFromTransportKind(chatInfoModel.transportKind),
                                                               @"demo": @"local_transport_echo"
                                                           });
            }));self.tableView.reloadDatas();
        }
    }
}
#pragma mark —— UITableViewDelegate,UITableViewDataSource ——————————
-(CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return JobsIMChatInfoTBVCell.cellHeightByModel(self.chatInfoModelMutArr[indexPath.row]);
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.chatInfoModelMutArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JobsIMChatInfoTBVCell *cell = JobsIMChatInfoTBVCell.cellStyleValue1ByTableView(tableView)
        .byAccessoryType(UITableViewCellAccessoryNone)
        .byIndexPath(indexPath)
        .byDelegate(self)
        .jobsRichElementsTableViewCellBy(self.chatInfoModelMutArr[indexPath.row])
            .JobsBlock1(^(id _Nullable data) {;
            });
    return cell.byShowChatUserName(YES).byAllowsMultipleSwipe(YES);;
}
#if isAllowSysEdit
/// 右划
-(nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
 leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (@available(iOS 11.0, *)) {
        UIContextualAction *deleteRowAction = jobsMakeContextualAction(UIContextualActionStyleNormal,
                                                                      @"删除",
                                                                      ^(UIContextualAction * _Nonnull action,
                                                                        __kindof UIView * _Nonnull sourceView,
                                                                        void (^ _Nonnull completionHandler)(BOOL)) {
            [WHToast showErrorWithMessage:@"删除"
                                 duration:2
                            finishHandler:^{
            }];
        }, ^(__kindof UIContextualAction * _Nullable action) {});
        //设置图片，但是设置不了原图，都是被默认为白色了，字体也是
        UIImage *image = [JobsLoadBundleImage(@"⚽️PicResource", @"Others", nil, @"分享") imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        deleteRowAction
            .byImage(image)
            .byBgColor([UIColor redColor]);
        UIContextualAction *editRowAction = jobsMakeContextualAction(UIContextualActionStyleNormal,
                                                                    @"编辑",
                                                                    ^(UIContextualAction * _Nonnull action,
                                                                      __kindof UIView * _Nonnull sourceView,
                                                                      void (^ _Nonnull completionHandler)(BOOL)) {
            [WHToast showErrorWithMessage:@"编辑"
                                 duration:2
                            finishHandler:^{
            }];
        }, ^(__kindof UIContextualAction * _Nullable action) {
            action
                .byImage(JobsLoadBundleImage(@"⚽️PicResource", @"Others", nil, @"删除"))
                .byBgColor([UIColor blueColor]);
        });
        UISwipeActionsConfiguration *config = jobsMakeSwipeActionsConfiguration(@[deleteRowAction,editRowAction], ^(__kindof UISwipeActionsConfiguration * _Nullable config) {
            //设置全屏滑动时不自定响应事件
            config.byPerformsFirstActionWithFullSwipe(NO);
        });
        return config;
    }else{
        return nil;
    }
}
/// 左划
-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView
trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (@available(iOS 11.0, *)) {
        UIContextualAction *deleteRowAction = jobsMakeContextualAction(UIContextualActionStyleNormal,
                                                                      @"删除",
                                                                      ^(UIContextualAction * _Nonnull action,
                                                                        __kindof UIView * _Nonnull sourceView,
                                                                        void (^ _Nonnull completionHandler)(BOOL)) {
        }, ^(__kindof UIContextualAction * _Nullable action) {});
        UIImage *image = [JobsLoadBundleImage(@"⚽️PicResource", @"Others", nil, @"分享")  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        deleteRowAction
            .byImage(image)
            .byBgColor([UIColor redColor]);
        UIContextualAction *editRowAction = jobsMakeContextualAction(UIContextualActionStyleNormal,
                                                                    @"编辑",
                                                                    ^(UIContextualAction * _Nonnull action,
                                                                      __kindof UIView * _Nonnull sourceView,
                                                                      void (^ _Nonnull completionHandler)(BOOL)) {
        }, ^(__kindof UIContextualAction * _Nullable action) {
            action
                .byImage(JobsLoadBundleImage(@"⚽️PicResource", @"Others", nil, @"删除"))
                .byBgColor([UIColor blueColor]);
        });
        UISwipeActionsConfiguration *config = jobsMakeSwipeActionsConfiguration(@[deleteRowAction,editRowAction], ^(__kindof UISwipeActionsConfiguration * _Nullable config) {
            config.byPerformsFirstActionWithFullSwipe(NO);
        });
        return config;
    }else{
        return nil;
    }
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView
                 editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (@available(iOS 13.0, *)) {
        //UITableViewRowAction' is deprecated: first deprecated in iOS 13.0 - Use UIContextualAction and related APIs instead.
        return nil;
    }else{
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal
                                                                          title:@"删除"
                                                                        handler:^(UITableViewRowAction * _Nonnull action,
                                                                                  NSIndexPath * _Nonnull indexPath) {
            [WHToast showErrorWithMessage:@"删除"
                                 duration:2
                            finishHandler:nil];
            // 点击删除按钮需要执行的方法
            [tableView setEditing:NO
                         animated:YES];
        }];
        // 修改背景颜色
        action.byBgColor(HEXCOLOR(0xEB1163));
        return @[action];
    }
}
#pragma clang diagnostic pop
-(void)tableView:(UITableView *)tableView
willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在 iOS11 以下系统,因为方法线程问题,需要放到主线程执行, 不然没有效果
    @jobs_weakify(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        @jobs_strongify(self)
        [self setupSlideBtnWithEditingIndexPath:indexPath];
    });
}
//MARK: 设置左滑按钮的样式
-(void)setupSlideBtnWithEditingIndexPath:(NSIndexPath *)editingIndexPath{
    // 判断系统是否是 iOS13 及以上版本
    if (@available(iOS 13.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(UITableViewCellSwipeContainerView)] &&
                [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView.subviews.firstObject;
                [self setupRowActionView:remarkContentView];
            }
        };return;
    }
    // 判断系统是否是 iOS11 及以上版本
    if (@available(iOS 11.0, *)) {
        for (UIView *subView in self.tableView.subviews) {
            if ([subView isKindOfClass:NSClassFromString(UISwipeActionPullView)] &&
                [subView.subviews count] >= 1) {
                // 修改图片
                UIView *remarkContentView = subView;
                [self setupRowActionView:remarkContentView];
            }
        };return;
    }
    // iOS11 以下的版本
    JobsIMChatInfoTBVCell *cell = [self.tableView cellForRowAtIndexPath:editingIndexPath];
    for (UIView *subView in cell.subviews) {
        if ([subView isKindOfClass:NSClassFromString(UITableViewCellDeleteConfirmationView)] &&
            [subView.subviews count] >= 1) {
            // 修改图片
            UIView *remarkContentView = subView;
            [self setupRowActionView:remarkContentView];
        }
    }
}

-(void)setupRowActionView:(UIView *)rowActionView{
    // 切割圆角
    rowActionView.cornerCutToCircleWithCornerRadius(20);
    // 改变父 View 的frame，这句话是因为我在 contentView 里加了另一个 View，为了使划出的按钮能与其达到同一高度
    CGRect frame = rowActionView.frame;
    frame.origin.y += 7;
    frame.size.height -= 13;
    rowActionView.byFrame(frame);
    // 拿到按钮,设置图片
    UIButton *button = rowActionView.subviews.firstObject;
    button.byBgColor(JobsRedColor);
    [button jobsResetBtnTitle:@"删除"];
    [button jobsResetBtnImage:JobsLoadBundleImage(@"⚽️PicResource", @"Others", nil, @"删除")];
}
#endif

// USE_MG_DELEGATE
//-(NSArray *)swipeTableCell:(JobsIMChatInfoTBVCell *)cell
//  swipeButtonsForDirection:(MGSwipeDirection)direction
//             swipeSettings:(MGSwipeSettings *)swipeSettings
//         expansionSettings:(MGSwipeExpansionSettings *)expansionSettings{
//    if (direction == MGSwipeDirectionLeftToRight) {
//        return [cell createLeftButtons];
//    }else {
//        return [cell createRightButtons];
//    }
//}

-(void)swipeTableCellWillBeginSwiping:(nonnull MGSwipeTableCell *)cell{
    NSObject.feedbackGenerator(nil);//震动反馈
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
-(JobsIMInputview *)inputview{
    if (!_inputview) {
        _inputview = JobsIMInputview.new;
        @jobs_weakify(self)
        [_inputview actionObjBlock:^(id data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:ZYTextField.class]){
                ZYTextField *tf = (ZYTextField *)data;
                {/// 装填我方数据并刷新UI
                    JobsTimeModel *timeModel = self.makeSpecificTime;
                    self.chatInfoModelMutArr.add(jobsMakeIMChatInfoModel(^(JobsIMChatInfoModel * _Nullable data) {
                        data.messageID = NSUUID.UUID.UUIDString;
                        data.conversationID = self.chatInfoModel.conversationID;
                        data.fromUserID = JobsIMLocalDemoUserID();
                        data.toUserID = self.chatInfoModel.fromUserID;
                        data.userID = JobsIMLocalDemoUserID();
                        data.chatTextStr = tf.text;
                        data.chatTextTimeStr = toStringByNSInteger(timeModel.currentHour)
                            .add(@":")
                            .add(toStringByNSInteger(timeModel.currentMin))
                            .add(@":")
                            .add(toStringByNSInteger(timeModel.currentSec));
                        data.userIconIMG = JobsLoadBundleImage(@"bundle", @"头像", nil, @"头像_1"); // 我自己的头像
                        data.userIconURLStr = @"https://picsum.photos/126";
                        data.identification = JobsIMStringFromTransportKind(self.chatInfoModel.transportKind);
                        data.userNameStr = JobsIMLocalDemoUserName();
                        data.messageType = JobsIMChatMessageType_Text;
                        data.chatInfoDirection = JobsIMChatInfoDirection_Receive;
                        data.packetType = JobsIMPacketTypeText;
                        data.deliveryState = JobsIMDeliveryStateSent;
                        data.transportKind = self.chatInfoModel.transportKind;
                        data.rawPacket = JobsIMPacketMake(JobsIMPacketTypeText,
                                                          data.messageID,
                                                          data.fromUserID,
                                                          data.toUserID,
                                                          @{
                                                              @"text": data.chatTextStr ?: @"",
                                                              @"transport": JobsIMStringFromTransportKind(data.transportKind)
                                                          });
                    }));self.tableView.reloadDatas();
                }
                /// 本地传输占位：后续这里接 Bonjour / Network.framework 或 MultipeerConnectivity
                @jobs_weakify(self)
                [self delayByMainQueue:1 block:^{
                    @jobs_strongify(self)
                    [self simulateLocalTransportEcho];
                }];
            }else{}
        }];
        _inputview.addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.height.mas_equalTo(JobsIMInputviewHeight());
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            });
        _inputview.jobsRichViewByModel(nil);
    };return _inputview;
}
/// BaseViewProtocol
@synthesize tableView = _tableView;
-(UITableView *)tableView{
    if (!_tableView) {
        @jobs_weakify(self)
        _tableView = jobsMakeTableViewByPlain(^(__kindof UITableView * _Nullable tableView) {
            @jobs_strongify(self)
            MJRefreshConfigModel *headerConfig = jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                model.byStateIdleTitle(@"下拉刷新数据".tr)
                    .byPullingTitle(@"下拉刷新数据".tr)
                    .byRefreshingTitle(@"正在刷新数据".tr)
                    .byWillRefreshTitle(@"刷新数据中".tr)
                    .byNoMoreDataTitle(@"下拉刷新数据".tr)
                    .byTextColor(JobsSecondaryLabelColor)
                    .byLoadBlock(^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        [self delayByMainQueue:0.35 block:^{
                            @jobs_strongify(self)
                            self.tableView.reloadDatas();
                            self.tableView.mj_endRefreshing_header();
                        }];
                        return nil;
                    });
            });
            MJRefreshConfigModel *footerConfig = jobsMakeRefreshConfigModel(^(__kindof MJRefreshConfigModel * _Nullable model) {
                model.byStateIdleTitle(@"".tr)
                    .byPullingTitle(@"".tr)
                    .byRefreshingTitle(@"".tr)
                    .byWillRefreshTitle(@"".tr)
                    .byNoMoreDataTitle(@"".tr)
                    .byTextColor(JobsSecondaryLabelColor)
                    .byLoadBlock(^id _Nullable(id _Nullable data) {
                        @jobs_strongify(self)
                        JobsLog(@"上拉加载更多");
                        self.tableView.byPagingEnabled(NO);
                        self.tableView.mj_footer.byHidden(YES);
                        self.tableView.byPagingEnabled(YES);
                        self.tableView.endRefreshingWithNoMoreData(NO);
                        return nil;
                    });
            });
            tableView
                .bySeparatorStyle(UITableViewCellSeparatorStyleNone)
                .byMJRefreshHeader(tableView.LOTAnimationMJRefreshHeaderBy(headerConfig))
                .byMJRefreshFooter(tableView.MJRefreshAutoGifFooterBy(footerConfig))
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byShowsVerticalScrollIndicator(NO)
                .byPagingEnabled(YES) // 这个属性为YES会使得Tableview一格一格的翻动
                .byBgColor(self.bgColour);
            [self.view insertSubview:tableView belowSubview:self.inputview];
            [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (self.gk_navBarAlpha && !self.gk_navigationBar.hidden) {//显示
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                }else{
                    make.top.equalTo(self.view.mas_top);
                }
                make.left.right.equalTo(self.view);
                make.bottom.equalTo(self.inputview.mas_top);
            }];
            self.view.refresh();
            tableView.mj_footer.byBgColor(JobsSystemBackgroundColor);
            tableView.mj_footer.byHidden(YES);
            self.view.mjRefreshTargetView = tableView;
        });
    };return _tableView;
}

-(BaseButton *)shareBtn{
    if (!_shareBtn) {
        @jobs_weakify(self)
        _shareBtn = BaseButton.jobsInit()
            .bgColorBy(JobsSystemBackgroundColor)
            .jobsResetBtnCornerRadiusValue(JobsWidth(23 / 2))
            .jobsResetBtnTitle(@"+")
            .jobsResetBtnTitleCor(JobsLabelColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(24)))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                toastBy(@"正在研发中...敬请期待".tr);
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .bySize(CGSizeMake(JobsWidth(23), JobsWidth(23)));
    };return _shareBtn;
}

-(UIColor *)bgColour{
    if (!_bgColour) {
        _bgColour = JobsSystemBackgroundColor;
    };return _bgColour;
}

-(NSMutableArray<JobsIMChatInfoModel *> *)chatInfoModelMutArr{
    if (!_chatInfoModelMutArr) {
        _chatInfoModelMutArr = NSMutableArray.array;
    };return _chatInfoModelMutArr;
}

@end
