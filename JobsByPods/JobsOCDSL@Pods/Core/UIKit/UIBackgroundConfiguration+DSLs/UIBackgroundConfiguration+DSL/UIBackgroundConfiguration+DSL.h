//
//  UIBackgroundConfiguration+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_DSL_6D9E3A7B42
#define JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_DSL_6D9E3A7B42

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

API_IOS14_TVOS14_UNAVAILABLE_WATCHOS
@interface UIBackgroundConfiguration (DSL)

#pragma mark —— 自定义视图
-(JobsRetBackgroundConfigByViewBlock _Nonnull)byCustomView;
#pragma mark —— 背景
-(JobsRetBackgroundConfigByCorBlock _Nonnull)byBackgroundColor;
-(JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byBackgroundColorTransformer;
-(JobsRetBackgroundConfigByVisualEffectBlock _Nonnull)byVisualEffect;
#pragma mark —— 圆角 / 边距
-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetBackgroundConfigByInsetsBlock _Nonnull)byBackgroundInsets;
-(JobsRetBackgroundConfigByRectEdgeBlock _Nonnull)byEdgesAddingLayoutMargins;
#pragma mark —— 描边
-(JobsRetBackgroundConfigByCorBlock _Nonnull)byStrokeColor;
-(JobsRetBackgroundConfigByCorTransformerBlock _Nonnull)byStrokeColorTransformer;
-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeWidth;
-(JobsRetBackgroundConfigByCGFloatBlock _Nonnull)byStrokeOutset;
#pragma mark —— 图片
-(JobsRetBackgroundConfigByImageBlock _Nonnull)byImage;
-(JobsRetBackgroundConfigByContentModeBlock _Nonnull)byImageContentMode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBACKGROUNDCONFIGURATION_DSL_6D9E3A7B42 */
