//
//  GKGestureHandleConfigure+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#ifndef JOBS_HEADER_GUARD_GKGESTUREHANDLECONFIGURE_DSL_2C5E6A3F91
#define JOBS_HEADER_GUARD_GKGESTUREHANDLECONFIGURE_DSL_2C5E6A3F91

#import <UIKit/UIKit.h>
#import "JobsBlock.h"

#if __has_include(<GKNavigationBar/GKGestureHandleConfigure.h>)
#import <GKNavigationBar/GKGestureHandleConfigure.h>
#else
#import "GKGestureHandleConfigure.h"
#endif

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN


@interface GKGestureHandleConfigure (DSL)

+(__kindof GKGestureHandleConfigure *_Nonnull)bySetupDefault;
+(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)bySetup;
+(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)byUpdate;

-(JobsRetGKGestureConfigureByConfigureBlock _Nonnull)dsl;
-(JobsRetGKGestureConfigureByArrayBlock _Nonnull)byShieldGestureVCs;
-(JobsRetGKGestureConfigureByBOOLBlock _Nonnull)byOpenScrollViewGestureHandle;
-(JobsRetGKGestureConfigureByBOOLBlock _Nonnull)byHidesBottomBarWhenPushed;
-(JobsRetGKGestureConfigureByCGFloatBlock _Nonnull)bySnapSensitivity;
-(JobsRetGKGestureConfigureByCriticalBlock _Nonnull)byTransitionCritical;
-(JobsRetGKGestureConfigureByScaleBlock _Nonnull)byScale;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_GKGESTUREHANDLECONFIGURE_DSL_2C5E6A3F91 */
