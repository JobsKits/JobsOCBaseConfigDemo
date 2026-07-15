//
//  BaseViewControllerProtocol.h
//  JobsOCProtocols
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEWCONTROLLERPROTOCOL_C02492A06E
#define JOBS_HEADER_GUARD_BASEVIEWCONTROLLERPROTOCOL_C02492A06E

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>                         // 用于嵌入和管理网页内容，例如加载和显示网页。
#import "BaseViewProtocol.h"

#if __has_include(<SPAlertController/SPAlertController.h>)
#import <SPAlertController/SPAlertController.h>
#else
#import "SPAlertController.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

@class JobsBasePopupView;
@class JobsNavBar;

NS_ASSUME_NONNULL_BEGIN

@protocol BaseViewControllerProtocol <BaseViewProtocol>
@optional
/// 生命周期监控
Prop_assign()BOOL LoadView;
Prop_assign()BOOL ViewDidLoad;
Prop_assign()BOOL ViewWillAppear;
Prop_assign()BOOL ViewDidAppear;
Prop_assign()BOOL ViewWillDisappear;
Prop_assign()BOOL ViewDidDisappear;
/// UI
Prop_weak()UIViewController *fromVC;
Prop_strong(nullable)SPAlertController *alertController;
Prop_assign()ComingStyle pushOrPresent;
Prop_assign()BOOL setupNavigationBarHidden;
Prop_strong(nullable)__kindof UIView *statusBar;
Prop_strong(nullable)JobsNavBarConfig *navBarConfig;
Prop_strong(nullable)JobsNavBar *navBar;
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIBarButtonItem *>*leftBarButtonItems;// 左边UIBarButtonItem 数组
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIBarButtonItem *>*rightBarButtonItems;// 右边UIBarButtonItem 数组
Prop_copy(nullable)__kindof NSMutableArray <__kindof UIViewController *>*vcs;// 子视图控制器 数组
Prop_strong(nullable)UIBarButtonItem *barButtonItem;
/// 更新状态栏颜色为自定义的颜色
-(jobsByCorBlock _Nonnull)updateStatusBarCor;
/// 恢复状态栏颜色
-(jobsByCorBlock _Nonnull)restoreStatusBarCor;
/// 让 UIView 像 UINavigationController 一样支持 push 和 pop
-(jobsByView2Block _Nonnull)configViewNavigatorBySuperviewAndView;
/// 查看用户数据
-(void)showUserInfo;
/// 铺满全屏展示的策略
-(void)fullScreenConstraintTargetView:(__kindof UIView *_Nonnull)view
                        topViewOffset:(CGFloat)topViewOffset;

@end

NS_ASSUME_NONNULL_END
/// 在 @implementation UIViewController (BaseVC) 实现。
#endif /* JOBS_HEADER_GUARD_BASEVIEWCONTROLLERPROTOCOL_C02492A06E */
