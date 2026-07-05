//
//  GKNavigationBarConfigure+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_GKNAVIGATIONBARCONFIGURE_DSL_A7D2E03F19
#define JOBS_HEADER_GUARD_GKNAVIGATIONBARCONFIGURE_DSL_A7D2E03F19

#import <UIKit/UIKit.h>

#if __has_include(<GKNavigationBar/GKNavigationBar.h>)
#import <GKNavigationBar/GKNavigationBar.h>
#else
#import "GKNavigationBar.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface GKNavigationBarConfigure (DSL)

+(__kindof GKNavigationBarConfigure *_Nonnull)bySetupDefault;
+(JobsRetGKNavConfigureByConfigureBlock _Nonnull)bySetup;
+(JobsRetGKNavConfigureByConfigureBlock _Nonnull)byUpdate;

-(JobsRetGKNavConfigureByConfigureBlock _Nonnull)dsl;
-(__kindof GKNavigationBarConfigure *_Nonnull)byCommit;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byBackground;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byBackgroundColor;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackgroundImage;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkBackgroundImage;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byLine;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byLineColor;
-(JobsRetGKNavConfigureByLineBlock _Nonnull)byLinePreset;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byLineImage;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkLineImage;
-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byLineHidden;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byTitleCor;
-(JobsRetGKNavConfigureByColorBlock _Nonnull)byTitleColor;
-(JobsRetGKNavConfigureByFontBlock _Nonnull)byTitleFont;
-(JobsRetGKNavConfigureByTitleBlock _Nonnull)byTitle;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBack;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackImage;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBackDarkImage;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byDarkBackImage;
-(JobsRetGKNavConfigureByBackImagesBlock _Nonnull)byBackImages;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byBlackBackImage;
-(JobsRetGKNavConfigureByImageBlock _Nonnull)byWhiteBackImage;
-(JobsRetGKNavConfigureByBackStyleBlock _Nonnull)byBackStyle;
-(JobsRetGKNavConfigureByBackPresetBlock _Nonnull)byBackPreset;
-(JobsRetGKNavConfigureByFixSpaceBlock _Nonnull)byFixSpace;
-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byDisableFixSpace;
-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byOpenSystemFixSpace;
-(JobsRetGKNavConfigureByNavItemSpacingBlock _Nonnull)byNavItemSpacing;
-(JobsRetGKNavConfigureByCGFloatBlock _Nonnull)byNavItemLeftSpace;
-(JobsRetGKNavConfigureByCGFloatBlock _Nonnull)byNavItemRightSpace;
-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byStatusBarHidden;
-(JobsRetGKNavConfigureByStatusBarStyleBlock _Nonnull)byStatusBarStyle;
-(JobsRetGKNavConfigureByBOOLBlock _Nonnull)byRestoreSystemNavBar;
-(JobsRetGKNavConfigureByPresetBlock _Nonnull)byPreset;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GKNAVIGATIONBARCONFIGURE_DSL_A7D2E03F19 */
