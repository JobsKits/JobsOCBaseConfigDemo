//
//  UITabBar+Ex.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITABBAR_EX_E2F70A4057
#define JOBS_HEADER_GUARD_UITABBAR_EX_E2F70A4057

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#define LOTAnimationViewWidth 33
#define LOTAnimationViewHeight 33

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

@interface UITabBar (Ex)
/// 移除系统的 UITabBarButton
-(void)deleteUITabBarButton;
-(LOTAnimationView *_Nullable)addLottieImage:(NSUInteger)index lottieName:(NSString *_Nullable)lottieName;
-(jobsByNSIntegerBlock _Nonnull)animationLottieImageBy;
-(jobsByVoidBlock _Nonnull)stopAnimationAllLottieView;

@end
#endif /* JOBS_HEADER_GUARD_UITABBAR_EX_E2F70A4057 */
