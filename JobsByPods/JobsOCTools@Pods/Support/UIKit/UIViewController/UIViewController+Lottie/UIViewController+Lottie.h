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

#import <JobsByOCPods/JobsString.h>

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Lottie)
/// 加盖一个Lottie播放器在本控制器view之上
/// @param lottieImage LottieName
-(void)addLottieImage:(NSString *)lottieImage;
/// 开始播放Lottie动画
-(void)lottieImagePlay;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LOTTIE_C0CD44E1C0 */
