//
//  JobsAppDoorVC_Style2.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorConfig.h"
#import "JobsAppDoorLogoContentView.h"
#import "../../View/ContentView/JobsAppDoorLoginContentView/JobsAppDoorLoginContentView.h"      // 登录
#import "../../View/ContentView/JobsAppDoorRegisterContentView/JobsAppDoorRegisterContentView.h"   // 注册
#import "JobsAppDoorForgotCodeContentView.h" // 忘记密码

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#pragma mark —— ZFPlayer 播放器相关
/// ZFPlayer@Core

/// ZFPlayer@AVPlayer

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif
/// ZFPlayer@ijkplayer

#if __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#import "ZFIJKPlayerManager.h"
#endif
/// ZFPlayer@ControlView

#if __has_include(<ZFPlayer/UIImageView+ZFCache.h>)
#import <ZFPlayer/UIImageView+ZFCache.h>
#else
#import "UIImageView+ZFCache.h"
#endif

#if __has_include(<ZFPlayer/UIView+ZFFrame.h>)
#import <ZFPlayer/UIView+ZFFrame.h>
#else
#import "UIView+ZFFrame.h"
#endif

#if __has_include(<ZFPlayer/ZFLandScapeControlView.h>)
#import <ZFPlayer/ZFLandScapeControlView.h>
#else
#import "ZFLandScapeControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFLoadingView.h>)
#import <ZFPlayer/ZFLoadingView.h>
#else
#import "ZFLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFNetworkSpeedMonitor.h>)
#import <ZFPlayer/ZFNetworkSpeedMonitor.h>
#else
#import "ZFNetworkSpeedMonitor.h"
#endif

#if __has_include(<ZFPlayer/ZFPlayerControlView.h>)
#import <ZFPlayer/ZFPlayerControlView.h>
#else
#import "ZFPlayerControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFPortraitControlView.h>)
#import <ZFPlayer/ZFPortraitControlView.h>
#else
#import "ZFPortraitControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSliderView.h>)
#import <ZFPlayer/ZFSliderView.h>
#else
#import "ZFSliderView.h"
#endif

#if __has_include(<ZFPlayer/ZFSmallFloatControlView.h>)
#import <ZFPlayer/ZFSmallFloatControlView.h>
#else
#import "ZFSmallFloatControlView.h"
#endif

#if __has_include(<ZFPlayer/ZFSpeedLoadingView.h>)
#import <ZFPlayer/ZFSpeedLoadingView.h>
#else
#import "ZFSpeedLoadingView.h"
#endif

#if __has_include(<ZFPlayer/ZFUtilities.h>)
#import <ZFPlayer/ZFUtilities.h>
#else
#import "ZFUtilities.h"
#endif

#if __has_include(<ZFPlayer/ZFVolumeBrightnessView.h>)
#import <ZFPlayer/ZFVolumeBrightnessView.h>
#else
#import "ZFVolumeBrightnessView.h"
#endif

#pragma mark —— By Jobs

#if __has_include(<ZFPlayerExtra/ZFPlayerExtra.h>)
#import <ZFPlayerExtra/ZFPlayerExtra.h>
#else
#import "ZFPlayerExtra.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import "JobsBaseUI.h"
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import "JobsMakes.h"
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>)
#import "JobsOCKeyboardMgr.h"
#else
#import "JobsOCKeyboardMgr.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsFuseAnimation.h>)
#import "JobsFuseAnimation.h"
#else
#import "JobsFuseAnimation.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 注册和登录共用一个控制器DoorVC；忘记密码单独一个控制器
@interface JobsAppDoorVC_Style2 : BaseViewController

Prop_strong()JobsAppDoorConfig *configuration;
-(JobsRetJobsAppDoorVCStyle2ByConfigBlock _Nonnull)byConfiguration;

-(instancetype)initWithConfiguration:(JobsAppDoorConfig *)configuration;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorVC_Style2
-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byHiddenNavigationBar;
-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byLoginDoorInputEditing;
-(JobsRetJobsAppDoorVC_Style2ByBOOLBlock _Nonnull)byVideoPausedByApplicationState;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byForgotCodeContentViewY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLoginContentViewY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLoginCustomerServiceBtnY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byLogoContentViewY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byRegisterContentViewY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byRegisterCustomerServiceBtnY;
-(JobsRetJobsAppDoorVC_Style2ByCGFloatBlock _Nonnull)byGk_navBarAlpha;
-(JobsRetJobsAppDoorVC_Style2ByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navLeftBarButtonItems;
-(JobsRetJobsAppDoorVC_Style2ByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItems;
-(JobsRetJobsAppDoorVC_Style2ByNSStringBlock _Nonnull)byGk_navTitle;
-(JobsRetJobsAppDoorVC_Style2ByUIBarButtonItemBlock _Nonnull)byGk_navLeftBarButtonItem;
-(JobsRetJobsAppDoorVC_Style2ByUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItem;
-(JobsRetJobsAppDoorVC_Style2ByUIViewBlock _Nonnull)byGk_navTitleView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorVC_Style2
@end

NS_ASSUME_NONNULL_END
