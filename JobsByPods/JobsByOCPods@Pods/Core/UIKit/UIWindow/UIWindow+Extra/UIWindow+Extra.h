//
//  UIWindow+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303
#define JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303

#import <UIKit/UIKit.h>
#import <JobsByOCPods/UIView+Measure.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface UIWindow (Extra)

+(JobsRetWindowByWindowSceneBlock _Nonnull)initByScene;
+(JobsRetWindowByFrameBlock _Nonnull)initByFrame;
/// 横屏模式下Window的宽高互换
-(JobsRetFrameByVoidBlock _Nonnull)landscapeWindowFrame;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303 */
