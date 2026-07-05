//
//  UIWindow+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303
#define JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303

#import <UIKit/UIKit.h>
#import "UIView+Measure.h"

#import "JobsModelDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (Extra)

+(JobsRetWindowByWindowSceneBlock _Nonnull)initByScene;
+(JobsRetWindowByFrameBlock _Nonnull)initByFrame;
/// 横屏模式下Window的宽高互换
-(JobsRetFrameByVoidBlock _Nonnull)landscapeWindowFrame;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIWINDOW_EXTRA_F99B0AE303 */
