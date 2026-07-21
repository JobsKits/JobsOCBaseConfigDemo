//
//  UITabBar+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UITABBAR_DSL_5A3C0E8F76
#define JOBS_HEADER_GUARD_UITABBAR_DSL_5A3C0E8F76

#import <UIKit/UIKit.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (DSL)

+(void)jobsApplyStandardAppearance:(UITabBarAppearance *_Nonnull)appearance API_AVAILABLE(ios(13.0));
+(void)jobsApplyScrollEdgeAppearance:(UITabBarAppearance *_Nullable)appearance API_AVAILABLE(ios(15.0));
-(JobsRetTabBarByAppearanceBlock _Nonnull)byStandardAppearance API_AVAILABLE(ios(13.0));
-(JobsRetTabBarByAppearanceBlock _Nonnull)byScrollEdgeAppearance API_AVAILABLE(ios(15.0));
-(JobsRetTabBarByColorBlock _Nonnull)byBarTintColor;
-(JobsRetTabBarByColorBlock _Nonnull)byUnselectedItemTintColor API_AVAILABLE(ios(10.0));

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITABBAR_DSL_5A3C0E8F76 */
