//
//  ZFCustomControlView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5
#define JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<ZFPlayer/ZFPlayer.h>)
#import <ZFPlayer/ZFPlayer.h>
#else
#import "ZFPlayer.h"
#endif

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

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ZFCUSTOMCONTROLVIEW_F8017ADDA5 */
