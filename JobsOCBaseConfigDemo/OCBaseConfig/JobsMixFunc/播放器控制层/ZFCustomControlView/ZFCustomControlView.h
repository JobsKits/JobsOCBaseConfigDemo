//
//  ZFCustomControlView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

#define JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5

#pragma once

#import <UIKit/UIKit.h>

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

#if __has_include(<ZFPlayer/ZFSliderView.h>)
#import <ZFPlayer/ZFSliderView.h>
#else
#import "ZFSliderView.h"
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

#import "JobsLanMgr.h"
#import "JobsDefines.h"
#import "JobsBlock.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFSliderView (JobsCustomControlDSL)
-(JobsRetZFSliderViewByFloatBlock _Nonnull)byValue;
-(JobsRetZFSliderViewByFloatBlock _Nonnull)byBufferValue;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byMaximumTrackTintColor;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byMinimumTrackTintColor;
-(JobsRetZFSliderViewByCorBlock _Nonnull)byBufferTrackTintColor;
-(JobsRetZFSliderViewByCGFloatBlock _Nonnull)bySliderHeight;
-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byIsHideSliderBlock;
-(JobsRetZFSliderViewByDelegateBlock _Nonnull)byDelegate;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ZFSliderView
-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byHideSliderBlock;
-(JobsRetZFSliderViewByBOOLBlock _Nonnull)byIsdragging;
-(JobsRetZFSliderViewByCGFloatBlock _Nonnull)byZf_centerY;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END ZFSliderView
@end

@interface ZFPlayerController (JobsCustomControlDSL)
-(JobsRetZFPlayerControllerByBOOLBlock _Nonnull)byStatusBarHidden;
@end

@interface NSObject (JobsZFPlayerMediaPlaybackDSL)
-(JobsRetZFPlayerMediaPlaybackByScalingModeBlock _Nonnull)byScalingMode;
-(JobsRetZFPlayerMediaPlaybackByBOOLBlock _Nonnull)byMuted;
-(JobsRetZFPlayerMediaPlaybackByFloatBlock _Nonnull)byVolume;
@end

@interface ZFCustomControlView : UIView <ZFPlayerMediaControl,ZFSliderViewDelegate>
/// 控制层自动隐藏的时间，默认2.5秒
Prop_assign()NSTimeInterval autoHiddenTimeInterval;
/// 控制层显示、隐藏动画的时长，默认0.25秒
Prop_assign()NSTimeInterval autoFadeTimeInterval;
/**
 设置标题、封面、全屏模式
 
 @param title 视频的标题
 @param coverUrl 视频的封面，占位图默认是灰色的
 @param fullScreenMode 全屏模式
 */
- (void)showTitle:(NSString *)title
   coverURLString:(NSString *)coverUrl
   fullScreenMode:(ZFFullScreenMode)fullScreenMode;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN ZFCustomControlView
-(JobsRetZFCustomControlViewByBOOLBlock _Nonnull)byControlViewAppeared;
-(JobsRetZFCustomControlViewBydispatch_block_tBlock _Nonnull)byAfterBlock;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END ZFCustomControlView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5 */
