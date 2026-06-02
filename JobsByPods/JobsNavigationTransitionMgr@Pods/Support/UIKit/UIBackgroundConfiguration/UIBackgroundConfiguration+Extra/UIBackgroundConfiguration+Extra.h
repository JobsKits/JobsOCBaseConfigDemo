//
//  UIBackgroundConfiguration+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_EXTRA_E2D3E6D4AE
#define JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_EXTRA_E2D3E6D4AE

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
API_AVAILABLE(ios(14.0))
@interface UIBackgroundConfiguration (Extra)
/// 背景色
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCorBlock byBackgroundColor;
/// 圆角
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCGFloatBlock byCornerRadius;
/// 背景 Insets
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByInsetsBlock byBackgroundInsets;
/// 自定义 View
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByViewBlock byCustomView;
/// 边框颜色
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCorBlock byStrokeColor;
/// 边框宽度
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCGFloatBlock byStrokeWidth;
/// 背景图
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByImageBlock byImage;
/// 背景图模式
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByContentModeBlock byImageContentMode;
/// 模糊效果
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByVisualEffectBlock byVisualEffect;
/// layoutMargins 叠加到 backgroundInsets 的边
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByRectEdgeBlock byEdgesAddingLayoutMarginsToBackgroundInsets;
/// 描边的外扩/内缩（相对 background），正为外扩、负为内缩
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCGFloatBlock byStrokeOutset;
/// 背景色转换器（Dark Mode 等动态变换）
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCorTransformerBlock byBackgroundColorTransformer;
/// 描边色转换器（Dark Mode 等动态变换）
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCorTransformerBlock byStrokeColorTransformer;
#if defined(__IPHONE_18_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_18_0)
/// 阴影（iOS18+）
Prop_copy(readonly,nonnull)JobsRetBackgroundConfigByCGFloatBlock byShadowOpacity API_AVAILABLE(ios(18.0));

#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_EXTRA_E2D3E6D4AE */
