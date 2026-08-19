//
//  JobsTabBarVC.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTABBARVC_5B51D625DE

#if __has_include(<PPBadgeView/PPBadgeView.h>)
#import <PPBadgeView/PPBadgeView.h>
#else
#import "PPBadgeView.h"
#endif

#define JOBS_HEADER_GUARD_JOBSTABBARVC_5B51D625DE

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import <UIKit/UIKit.h>
#import "UITabBar+Ex.h"
#import "TLTabBarAnimation.h"
#import "UITabBar+TLAnimation.h"
#import "UITabBarItem+TLAnimation.h"
#import "TransitionController.h"
#import "TransitionAnimation.h"
#import "JobsPullListAutoSizeView.h"
#import "JobsTabBarItemConfig.h"
#import "JobsTabBarItem.h"
#import "JobsTabBar.h"

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#import "JobsBaseProtocolHeader.h"
#import "JobsLanMgr.h"
#import "JobsBaseUI.h"
#import "JobsByOCPods.h"
#import "JobsMakes.h"
#import "JobsSuspend.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

/*
 * 1、如果用系统的 UITabBarController —— UITabBar 当关联VC ＞ 6 个的时候，最后一个会变成more按钮，其余的VC会在more按钮里面形成一个TableView来进行展现
 * 2、如果希望下方是可以滑动的效果，只能用UIView系列来实现，这里推崇第三方工具库 pod 'JXCategoryView'  # https://github.com/pujiaxin33/JXCategoryView A powerful and easy to use category view (segmentedcontrol, segmentview, pagingview, pagerview, pagecontrol) (腾讯新闻、今日头条、QQ音乐、网易云音乐、京东、爱奇艺、腾讯视频、淘宝、天猫、简书、微博等所有主流App分类切换滚动视图)
 */
/// 此类仅仅对系统给出的 UITabBarController —— UITabBar做最大程度上的增加功能，并且解耦
#import "JobsOCDSL.h"

@interface JobsTabBarVC : UITabBarController
<
UITabBarControllerDelegate,
UIGestureRecognizerDelegate,
BaseProtocol
>
/// UI
Prop_strong(readonly)JobsTabBar * _Nonnull myTabBar; // myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
/// Data
Prop_assign()BOOL isOpenScrollTabbar; // 是否开启手势横向滚动子VC联动Tabbar切换，默认开启
-(JobsRetJobsTabBarVCByDelegateBlock _Nonnull)byDelegate;
Prop_assign()BOOL isAnimationAlert; // 图片从小放大
Prop_assign()BOOL isShakerAnimation; // 重力弹跳动画效果
Prop_assign()BOOL isPlaySound; // 点击声
Prop_assign()BOOL isFeedbackGenerator; // 振动反馈
Prop_assign()BOOL isJumpToNextVC; // 当需要跳开的item,是否是需要直接跳到下一个VC？默认NO
#pragma mark —— 初始化方法
///【单例模式】使用外界自定义的JobsTabBar
+(JobsRetIDByJobsTabBarBlock _Nonnull)sharedInstanceWithJobsTabBar;
/// 一般的初始化模式
-(instancetype _Nonnull)initWithJobsTabBar:(JobsTabBar *_Nonnull)tabBar;
#pragma mark —— 一些公有方法
/// 需要强制跳转登录的index。点击和手势滑动都需要共同调用
-(JobsRetBOOLByNSUIntegerBlock _Nonnull)forcedLoginIndex;
/// 关闭手势
-(jobsByVoidBlock _Nonnull)closePan;
/// 打开手势
-(jobsByVoidBlock _Nonnull)openPan;
/// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(jobsByBOOLBlock _Nonnull)ppBadge;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsTabBarVC
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byAnimationAlert;
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byFeedbackGenerator;
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byOpenPPBadge;
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byOpenScrollTabbar;
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byPlaySound;
-(JobsRetJobsTabBarVCByJobsTabBarBlock _Nonnull)byMyTabBar;
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byHiddenNavigationBar;
-(JobsRetJobsTabBarVCByNSArrayUIViewControllerBlock _Nonnull)byViewControllers;
-(JobsRetJobsTabBarVCByNSUIntegerBlock _Nonnull)bySelectedIndex;
-(void)setSelectedIndex:(NSUInteger)data;
-(void)setViewControllers:(NSArray<__kindof UIViewController *> * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsTabBarVC
@end

NS_INLINE __kindof JobsTabBarVC *_Nonnull jobsMakeSharedManagerTabBarVC(jobsByTabBarVCBlock _Nonnull block){
    JobsTabBarVC *data = JobsTabBarVC.jobsSharedManager();
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JobsTabBarVC *_Nonnull jobsMakeNormalTabBarVC(jobsByTabBarVCBlock _Nonnull block){
    JobsTabBarVC *data = JobsTabBarVC.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSTABBARVC_5B51D625DE */
