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

#import "JobsBlock.h"
#import "JobsDefines.h"

#define LOTAnimationViewWidth 33
#define LOTAnimationViewHeight 33

#import "JobsOCDSL.h"
#import "JobsStringUtilsHeader.h"

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
