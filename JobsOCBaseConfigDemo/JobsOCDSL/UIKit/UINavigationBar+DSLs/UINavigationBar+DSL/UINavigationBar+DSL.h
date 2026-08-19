//
//  UINavigationBar+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONBAR_DSL_D3B8916A42
#define JOBS_HEADER_GUARD_UINAVIGATIONBAR_DSL_D3B8916A42

#import <UIKit/UIKit.h>
#import "UIBarAppearance+DSL.h"

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

@interface UINavigationBar (DSL)

-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byStandardAppearance API_AVAILABLE(ios(13.0));
-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byScrollEdgeAppearance API_AVAILABLE(ios(13.0));
-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byCompactAppearance API_AVAILABLE(ios(13.0));
-(JobsRetNavigationBarByAppearanceBlock _Nonnull)byCompactScrollEdgeAppearance API_AVAILABLE(ios(15.0));
-(JobsRetNavigationBarByColorBlock _Nonnull)byBarTintColor;
-(JobsRetNavigationBarByBOOLBlock _Nonnull)byTranslucent;
-(JobsRetNavigationBarByDictionaryBlock _Nonnull)byTitleTextAttributes;
-(JobsRetNavigationBarByBOOLBlock _Nonnull)byPrefersLargeTitles API_AVAILABLE(ios(11.0));
-(JobsRetNavigationBarByImageBlock _Nonnull)byShadowImage;
-(JobsRetNavigationBarByImageAndBarMetricsBlock _Nonnull)byBackgroundImageForBarMetrics;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONBAR_DSL_D3B8916A42 */
