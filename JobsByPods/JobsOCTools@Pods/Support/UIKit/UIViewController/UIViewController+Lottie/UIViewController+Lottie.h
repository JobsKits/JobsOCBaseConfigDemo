//
//  UIViewController+Lottie.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LOTTIE_C0CD44E1C0
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LOTTIE_C0CD44E1C0

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/JobsByOCPods.h>

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Lottie)
/// 加盖一个Lottie播放器在本控制器view之上
/// @param lottieImage LottieName
-(jobsByStrBlock _Nonnull)addLottieImage;
/// 开始播放Lottie动画
-(jobsByVoidBlock _Nonnull)lottieImagePlay;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LOTTIE_C0CD44E1C0 */
