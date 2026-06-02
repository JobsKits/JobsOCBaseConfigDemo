//
//  CALayer+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CALAYER_EXTRA_3A40B2B0E5
#define JOBS_HEADER_GUARD_CALAYER_EXTRA_3A40B2B0E5

#pragma once

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

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

@interface CALayer (Extra)

-(JobsRetCALayerByCGFloatBlock _Nonnull)cornerRadiusBy;
-(JobsRetCALayerByCGFloatBlock _Nonnull)borderWidthBy;
-(JobsRetCALayerByCorBlock _Nonnull)borderColorBy;
-(JobsRetCALayerByBOOLBlock _Nonnull)masksToBoundsBy;
/// 添加Layer
-(JobsRetCALayerByCALayerBlock _Nonnull)addSublayer;
/// 删除Layer
-(jobsByVoidBlock _Nonnull)remove;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CALAYER_EXTRA_3A40B2B0E5 */
