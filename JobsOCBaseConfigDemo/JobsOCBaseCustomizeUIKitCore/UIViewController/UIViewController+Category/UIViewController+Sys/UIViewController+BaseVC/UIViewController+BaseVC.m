//
//  UIViewController+BaseVC.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIViewController+BaseVC.h"

static NSString *JobsNavigationTitleFromRequestParams(id _Nullable requestParams) {
    if (![requestParams isKindOfClass:UIViewModel.class]) return nil;
    UIViewModel *viewModel = (UIViewModel *)requestParams;
    NSString *navigationTitle = viewModel.textModel.attributedTitle.string;
    return navigationTitle.length ? navigationTitle : viewModel.textModel.text;
}

static NSString *JobsTrimmedNavigationTitlePart(NSString *title) {
    return [title stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
}

static NSArray<NSString *> *JobsNavigationTitleParts(NSString *title) {
    NSArray<NSString *> *separators = @[@"｜",
                                        @"|",
                                        @"：",
                                        @":",
                                        @"@",
                                        @" / ",
                                        @"（",
                                        @"("];
    for (NSString *separator in separators) {
        NSRange separatorRange = [title rangeOfString:separator];
        if (separatorRange.location == NSNotFound ||
            !separatorRange.location ||
            NSMaxRange(separatorRange) >= title.length) continue;
        NSString *mainTitle = JobsTrimmedNavigationTitlePart([title substringToIndex:separatorRange.location]);
        NSString *subTitle = JobsTrimmedNavigationTitlePart([title substringFromIndex:NSMaxRange(separatorRange)]);
        if ([separator isEqualToString:@"（"] || [separator isEqualToString:@"("]) {
            subTitle = [separator stringByAppendingString:subTitle];
        }
        if (mainTitle.length && subTitle.length) return @[mainTitle, subTitle];
    }
    __block NSUInteger linguisticSplitIndex = NSNotFound;
    __block NSUInteger linguisticSplitDistance = NSUIntegerMax;
    NSUInteger titleMidpoint = title.length / 2;
    [title enumerateSubstringsInRange:NSMakeRange(0, title.length)
                              options:NSStringEnumerationByWords | NSStringEnumerationLocalized
                           usingBlock:^(__unused NSString *_Nullable substring,
                                        NSRange substringRange,
                                        __unused NSRange enclosingRange,
                                        __unused BOOL *stop) {
        NSUInteger candidateIndex = NSMaxRange(substringRange);
        CGFloat candidateRatio = (CGFloat)candidateIndex / title.length;
        if (!candidateIndex ||
            candidateIndex >= title.length ||
            candidateRatio < 0.25f ||
            candidateRatio > 0.75f) return;
        NSUInteger candidateDistance = candidateIndex > titleMidpoint ?
            candidateIndex - titleMidpoint :
            titleMidpoint - candidateIndex;
        if (candidateDistance < linguisticSplitDistance) {
            linguisticSplitDistance = candidateDistance;
            linguisticSplitIndex = candidateIndex;
        }
    }];
    if (linguisticSplitIndex != NSNotFound) {
        NSString *mainTitle = JobsTrimmedNavigationTitlePart([title substringToIndex:linguisticSplitIndex]);
        NSString *subTitle = JobsTrimmedNavigationTitlePart([title substringFromIndex:linguisticSplitIndex]);
        if (mainTitle.length && subTitle.length) return @[mainTitle, subTitle];
    }
    NSMutableArray<NSString *> *characters = NSMutableArray.array;
    [title enumerateSubstringsInRange:NSMakeRange(0, title.length)
                              options:NSStringEnumerationByComposedCharacterSequences
                           usingBlock:^(NSString *_Nullable substring,
                                        __unused NSRange substringRange,
                                        __unused NSRange enclosingRange,
                                        __unused BOOL *stop) {
        if (substring.length) [characters addObject:substring];
    }];
    if (characters.count < 2) return nil;
    NSUInteger splitIndex = characters.count / 2;
    NSString *mainTitle = JobsTrimmedNavigationTitlePart([[characters subarrayWithRange:NSMakeRange(0, splitIndex)]
                                                          componentsJoinedByString:@""]);
    NSString *subTitle = JobsTrimmedNavigationTitlePart([[characters subarrayWithRange:NSMakeRange(splitIndex,
                                                                                                    characters.count - splitIndex)]
                                                         componentsJoinedByString:@""]);
    return mainTitle.length && subTitle.length ? @[mainTitle, subTitle] : nil;
}

static UIViewModel *JobsAdaptiveNavigationTitleModel(id _Nullable requestParams) {
    NSString *navigationTitle = JobsNavigationTitleFromRequestParams(requestParams);
    if (!navigationTitle.length) return nil;
    UIFont *titleFont = UIFontWeightSemiboldSize(16);
    CGFloat availableWidth = MIN(JobsWidth(220),
                                 MAX(JobsWidth(150),
                                     JobsMainScreen_WIDTH() - JobsWidth(150)));
    if (navigationTitle.widthBy(titleFont) <= availableWidth) return nil;
    NSArray<NSString *> *titleParts = JobsNavigationTitleParts(navigationTitle);
    if (titleParts.count != 2) return nil;
    UIViewModel *sourceViewModel = (UIViewModel *)requestParams;
    return jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
        data
            .byTextModel(jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
                textModel
                    .byText(titleParts.firstObject)
                    .byTextCor(sourceViewModel.textModel.textCor ? : JobsLabelColor)
                    .byFont(UIFontWeightSemiboldSize(15));
            }))
            .bySubTextModel(jobsMakeTextModel(^(__kindof UITextModel * _Nullable textModel) {
                textModel
                    .byText(titleParts.lastObject)
                    .byTextCor(JobsSecondaryLabelColor)
                    .byFont(UIFontWeightRegularSize(11));
            }));
    });
}

@implementation UIViewController (BaseVC)
#pragma mark —— 一些功能性
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView{
    @jobs_weakify(self)
    return ^(UIView *_Nullable superview,
             UIView *_Nullable view) {
        @jobs_strongify(self)
        self.view.navigator.byFrame(view.bounds);
        view.navigator = superview.navigator;
        superview.addSubview(self.view.navigator);
    };
}

-(void)showUserInfo{
    if (JobsDebug) {
        UIViewModel *viewModel = [self configViewModelWithTitle:@"用户信息展示(开发测试专用)".tr subTitle:nil];
        viewModel.byCls(JobsShowObjInfoVC.class)
                 .byRequestParams(self.readUserInfo);
        [self forceComingToPushVC:viewModel.cls.new
                    requestParams:viewModel];// 测试专用
    }
}
/// 配置GKNavigationBar（不包括返回键的设定）
-(jobsByViewModelBlock)setGKNav{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable data) {
        @jobs_strongify(self)
        UIViewModel *viewModel = data ? : self.viewModel;
        self
            .byGKNavTitle(viewModel.textModel.text)
            .byGKNavTitleColor(viewModel.textModel.textCor ? : HEXCOLOR(0xD3B698))
            .byGKNavTitleFont(viewModel.textModel.font ? : UIFontWeightRegularSize(18))
            .byGKNavBackgroundColor(viewModel.navBgCor)
            .byGKNavBackgroundImage(viewModel.navBgImage)
            .byGKNavLineHidden(YES)
            .byGKNavItemLeftSpace(JobsWidth(20))
            .byGKHideNavLine();
    };
}
/// 配置GKNavigationBar的返回按钮（从上个页面推过来才有返回键）
-(jobsByBtnBlock _Nonnull)setGKNavBackBtn{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable btn) {
        @jobs_strongify(self)
        if (self.navigationController.viewControllers.count - 1) {/// 从上个页面推过来才有返回键
            self.setGKNavBackBtnBy(btn);
        }
    };
}
/// 配置GKNavigationBar的返回按钮
-(jobsByBtnBlock _Nonnull)setGKNavBackBtnBy{
    @jobs_weakify(self)
    return ^(__kindof UIButton *_Nullable btn) {
        @jobs_strongify(self)
        UIButton *backButton = btn ? : self.backBtnCategory;
        UIColor *backButtonColor = self.viewModel.backBtnTitleModel.textCor ? : JobsLabelColor;
        UIImage *backButtonImage = [backButton imageForState:UIControlStateNormal];
        if (backButtonImage) {
            backButton.jobsResetBtnImage([backButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]);
        }
        backButton
            .jobsResetBtnTitleCor(backButtonColor)
            .byTintColor(backButtonColor);
        self.byGKNavLeftBarButtonItem(UIBarButtonItem.initBy(backButton));
    };
}
/// 配置GKNavigationBar的标题（按钮）
-(jobsByButtonModelBlock _Nonnull)setGKNavTitleBtnBy{
    @jobs_weakify(self)
    return ^(__kindof UIButtonModel *_Nullable model) {
        @jobs_strongify(self)
        self.gk_navTitleBtnBy(model);
    };
}
/// 铺满全屏展示的策略
-(void)fullScreenConstraintTargetView:(__kindof UIView *_Nonnull)view
                        topViewOffset:(CGFloat)topViewOffset{
    /// 防止调用崩溃
    if (![self.view.subviews containsObject:view]) {
        [self.view addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (self.setupNavigationBarHidden &&
            (!self.gk_navBarAlpha || self.gk_navigationBar.hidden || !self.gk_navigationBar.alpha)) {// 系统、GK均隐藏
            make.top.equalTo(self.view).offset(topViewOffset);
        }else{
            if (!self.setupNavigationBarHidden && (!self.gk_navBarAlpha || self.gk_navigationBar.hidden || !self.gk_navigationBar.alpha) ) {// 用系统的导航栏
                make.top.equalTo(self.view).offset(JobsNavigationBarAndStatusBarHeight(nil) + topViewOffset);
            }else if (self.setupNavigationBarHidden && (self.gk_navBarAlpha || !self.gk_navigationBar.hidden || self.gk_navigationBar.alpha)) {// 用GK的导航栏
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(topViewOffset);
            }else{
                make.top.equalTo(self.view).offset(topViewOffset);
            }
        }make.left.right.bottom.equalTo(self.view);
    }];
}
/**
 ❤️【强制推控制器】❤️
 1、自定义是PUSH还是PRESENT展现控制器，如果自定义PUSH但是navigationController不存在，则换用PRESENT展现控制器
 2、定位于@implementation UINavigationController (SafeTransition)，交换系统的push方法，防止某些情况下系统资源紧张导致的多次推控制器
 @param fromVC 从A控制器（上一个页面）
 @param toVC  推到B控制器 （下一个页面）
 @param comingStyle 自定义展现的方式
 @param presentationStyle  如果是PRESENT情况下的一个系统参数设定
 @param requestParams  A控制器—>B控制器，正向传值
 @param hidesBottomBarWhenPushed 跳转子页面的时候隐藏tabbar
 @param animated  是否动画展现
 @param successBlock 在推控制器之前，反向block(B控制器），以便对B控制器的一些自定义修改
 */
+(instancetype _Nullable)comingFromVC:(UIViewController *_Nonnull)fromVC // 上一个页面
                                 toVC:(UIViewController *_Nonnull)toVC // 下一个页面
                          comingStyle:(ComingStyle)comingStyle
                    presentationStyle:(UIModalPresentationStyle)presentationStyle
                        requestParams:(id _Nullable)requestParams
             hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed
                             animated:(BOOL)animated
                              success:(jobsByIDBlock _Nullable)successBlock{
    if (toVC) {
        UIViewController *navigationTargetVC = toVC;
        if ([toVC isKindOfClass:UINavigationController.class]) {
            navigationTargetVC = ((UINavigationController *)toVC).viewControllers.firstObject;
        }
        if([toVC isKindOfClass:UINavigationController.class]){
            UINavigationController *navVC = (UINavigationController *)toVC;
            navVC.rootViewController.requestParams = requestParams;
            navVC.rootViewController.fromVC = fromVC;// 【承上启下】下一个页面记录是从哪里来的
        }else{
            toVC.requestParams = requestParams;
            JobsLog(@"%@",toVC.requestParams);
            toVC.fromVC = fromVC;// 【承上启下】下一个页面记录是从哪里来的
        }
        NSString *navigationTitle = JobsNavigationTitleFromRequestParams(requestParams);
        if (!navigationTargetVC.title.length && navigationTitle.length) {
            navigationTargetVC.title = navigationTitle;
        }
        BOOL shouldKeepCustomTitleView = navigationTargetVC.navigationItem.titleView ||
                                         navigationTargetVC.gk_navTitleView;
        BOOL shouldKeepSystemNavigationDemo = [NSStringFromClass(navigationTargetVC.class)
                                               isEqualToString:@"JobsNavigationDemoVC"];
        if (!shouldKeepCustomTitleView && !shouldKeepSystemNavigationDemo) {
            UIViewModel *adaptiveTitleModel = JobsAdaptiveNavigationTitleModel(requestParams);
            if (adaptiveTitleModel) navigationTargetVC.gk_navTitleViewBy(adaptiveTitleModel);
        }
        @jobs_weakify(fromVC)
        jobsByVoidBlock presentViewControllerBlock = ^(){
            /// 防止多次present控制器
            if(!fromVC.presentedViewController){
                toVC.pushOrPresent = ComingStyle_PRESENT;
                /// iOS_13中modalPresentationStyle的默认改为UIModalPresentationAutomatic,而在之前默认是UIModalPresentationFullScreen
                toVC.modalPresentationStyle = presentationStyle;
                [weak_fromVC presentViewController:toVC
                                          animated:animated
                                        completion:^{
                    if (successBlock) successBlock(toVC);
                }];
            }
        };
        switch (comingStyle) {
            /// 处理 ComingStyle_PUSH 分支
            case ComingStyle_PUSH:{
                if (fromVC.navigationController) {
                    toVC.pushOrPresent = ComingStyle_PUSH;
                    toVC.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed;/// 下面有黑条
                    [weak_fromVC.navigationController pushViewController:toVC animated:animated];
                    if (successBlock) successBlock(toVC);
                }else if(presentViewControllerBlock) presentViewControllerBlock();
            }break;
            /// 处理 ComingStyle_PRESENT 分支
            case ComingStyle_PRESENT:{
                if(presentViewControllerBlock) presentViewControllerBlock();
            }break;
            /// 未匹配已知分支时执行兜底处理
            default:
                JobsLog(@"错误的推进方式");
                break;
        };return toVC;
    }else return nil;// 为了防止多次推VC
}
#pragma mark —— <BaseViewControllerProtocol> @property(nonatomic,weak)UIViewController *fromVC;
JobsKey(_fromVC)
@dynamic fromVC;
-(UIViewController *)fromVC{
    return Jobs_getAssociatedObject(_fromVC);
}

-(void)setFromVC:(UIViewController *)fromVC{
    Jobs_setAssociatedASSIGN(_fromVC, fromVC)
}
#pragma mark —— <BaseViewControllerProtocol> Prop_assign()ComingStyle pushOrPresent;
JobsKey(_pushOrPresent)
@dynamic pushOrPresent;
-(ComingStyle)pushOrPresent{
    return [Jobs_getAssociatedObject(_pushOrPresent) integerValue];
}

-(void)setPushOrPresent:(ComingStyle)pushOrPresent{
    Jobs_setAssociatedRETAIN_NONATOMIC(_pushOrPresent, @(pushOrPresent))
}
#pragma mark —— <UIViewModelProtocol> Prop_strong()id requestParams;
JobsKey(_requestParams)
@dynamic requestParams;
-(id)requestParams{
    return Jobs_getAssociatedObject(_requestParams);
}

-(void)setRequestParams:(id)requestParams{
    Jobs_setAssociatedRETAIN_NONATOMIC(_requestParams, requestParams)
}
#pragma mark —— <UIViewModelProtocol> Prop_strong()UIImage *bgImage;
JobsKey(_bgImage)
@dynamic bgImage;
-(UIImage *)bgImage{
    UIImage *BgImage = Jobs_getAssociatedObject(_bgImage);
    if (!BgImage) {
        BgImage = @"启动页SLOGAN".img;
        Jobs_setAssociatedRETAIN_NONATOMIC(_bgImage, BgImage)
    };return BgImage;
}

-(void)setBgImage:(UIImage *)bgImage{
    Jobs_setAssociatedRETAIN_NONATOMIC(_bgImage, bgImage)
}
#pragma mark —— Prop_assign()BOOL setupNavigationBarHidden;
JobsKey(_setupNavigationBarHidden)
@dynamic setupNavigationBarHidden;
-(BOOL)setupNavigationBarHidden{
    return Jobs_getAssociatedObject(_setupNavigationBarHidden);
}

-(void)setSetupNavigationBarHidden:(BOOL)setupNavigationBarHidden{
    Jobs_setAssociatedRETAIN_NONATOMIC(_setupNavigationBarHidden, @(setupNavigationBarHidden));
}
#pragma mark —— Prop_assign()NSUInteger __block jobsTag;
JobsKey(_jobsTag)
@dynamic jobsTag;
-(NSUInteger)jobsTag{
    return [Jobs_getAssociatedObject(_jobsTag) unsignedIntegerValue];
}

-(void)setJobsTag:(NSUInteger)jobsTag{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobsTag, @(jobsTag))
}
#pragma mark —— Prop_strong()JobsNavBarConfig *navBarConfig;
JobsKey(_navBarConfig)
@dynamic navBarConfig;
-(void)setNavBarConfig:(JobsNavBarConfig *)navBarConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navBarConfig, navBarConfig)
}

-(JobsNavBarConfig *)navBarConfig{
    JobsNavBarConfig *NavBarConfig = Jobs_getAssociatedObject(_navBarConfig);
    if(!NavBarConfig){
        NavBarConfig = jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_navBarConfig, NavBarConfig)
    };return NavBarConfig;
}
#pragma mark —— Prop_strong()JobsNavBar *navBar;
JobsKey(_navBar)
@dynamic navBar;
-(void)setNavBar:(JobsNavBar *)navBar{
    Jobs_setAssociatedRETAIN_NONATOMIC(_navBar, navBar)
}

-(JobsNavBar *)navBar{
    JobsNavBar *NavBar = Jobs_getAssociatedObject(_navBar);
    if(!NavBar){
        @jobs_weakify(self)
        NavBar = jobsMakeNavBar(^(__kindof JobsNavBar * _Nullable data) {
            @jobs_strongify(self)
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                self.navBarConfig.backBtnModel.jobsOffsetX = self.navBarConfig.backBtnModel.jobsOffsetX ? : JobsWidth(40);
                self.navBarConfig.closeBtnModel.jobsOffsetX = self.navBarConfig.closeBtnModel.jobsOffsetX ? : JobsWidth(40);
            }
//            JobsLog(@"%f",self.navBarConfig.backBtnModel.jobsOffsetX);
//            JobsLog(@"%f",self.navBarConfig.closeBtnModel.jobsOffsetX);
//            if(!self.navBarConfig.title) self.navBarConfig.title = self.viewModel.textModel.text;
            data.navBarConfig = self.navBarConfig;
            self.view.addSubview(data.JobsRichViewByModel2(nil)
                                 .JobsNavBarBackBtnClickBlock(^(__kindof UIButton *_Nullable x){
                                     @jobs_strongify(self)
                                     self.backBtnClickEvent(x);
                                 }).JobsNavBarCloseBtnClickBlock(^(__kindof UIButton *_Nullable x){
                                 })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                                     @jobs_strongify(self)
                                     make.left.right.equalTo(self.view);
                                     make.height.mas_equalTo(JobsWidth(40));
                                     if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                                         make.top.equalTo(self.view);
                                     }else{
                                         make.top.equalTo(self.view).offset(JobsStatusBarHeight());
                                     }
                                 }).on();
        });
        Jobs_setAssociatedRETAIN_NONATOMIC(_navBar, NavBar)
    };return NavBar;
}

@end
