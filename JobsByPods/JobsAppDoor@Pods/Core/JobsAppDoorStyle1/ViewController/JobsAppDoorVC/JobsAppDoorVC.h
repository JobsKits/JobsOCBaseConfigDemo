//
//  JobsAppDoorVC.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORVC_EB363B5645
#define JOBS_HEADER_GUARD_JOBSAPPDOORVC_EB363B5645

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsAppDoor/JobsAppDoorForgotCodeContentView.h>// 忘记密码
#import <JobsAppDoor/JobsAppDoorLogoContentView.h>
#import <JobsAppDoor/JobsAppDoorContentView.h>
#import <JobsAppDoor/JobsAppDoorConfig.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#pragma mark —— ZFPlayer 播放器相关
//Core

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif
//AVPlayer

#if __has_include(<ZFPlayer/ZFAVPlayerManager.h>)
#import <ZFPlayer/ZFAVPlayerManager.h>
#else
#import "ZFAVPlayerManager.h"
#endif
//ijkplayer

#if __has_include(<ZFPlayer/ZFIJKPlayerManager.h>)
#import <ZFPlayer/ZFIJKPlayerManager.h>
#else
#import "ZFIJKPlayerManager.h"
#endif
//ControlView

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>)
#import <JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>
#else
#import "JobsOCKeyboardMgr.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsFuseAnimation/JobsFuseAnimation.h>)
#import <JobsFuseAnimation/JobsFuseAnimation.h>
#else
#import "JobsFuseAnimation.h"
#endif

#if __has_include(<JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlHeader.h>)
#import <JobsOCCountryCodeCtrl/JobsOCCountryCodeCtrlHeader.h>
#else
#import "JobsOCCountryCodeCtrlHeader.h"
#endif

NS_ASSUME_NONNULL_BEGIN
#pragma mark —— 高仿蜜柚
@interface JobsAppDoorVC : BaseViewController

Prop_strong()JobsAppDoorConfig *configuration;
-(JobsRetJobsAppDoorVCByConfigBlock _Nonnull)byConfiguration;

-(instancetype)initWithConfiguration:(JobsAppDoorConfig *)configuration;
/// 进此页面先自动跳转到注册页面
-(jobsByVoidBlock _Nonnull)toRegister;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorVC
-(JobsRetJobsAppDoorVCByBOOLBlock _Nonnull)byHiddenNavigationBar;
-(JobsRetJobsAppDoorVCByBOOLBlock _Nonnull)byVideoPausedByApplicationState;
-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byCustomerServiceBtnY;
-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byForgotCodeContentViewY;
-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byJobsAppDoorContentViewY;
-(JobsRetJobsAppDoorVCByCGFloatBlock _Nonnull)byLogoContentViewY;
-(JobsRetJobsAppDoorVCByJobsAppDoorModelBlock _Nonnull)byAppDoorModel;
-(JobsRetJobsAppDoorVCByNSIntegerBlock _Nonnull)byCurrentActivateTFIndex;
-(JobsRetJobsAppDoorVCByNSIntegerBlock _Nonnull)byLastTimeActivateTFIndex;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorVC
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORVC_EB363B5645 */
