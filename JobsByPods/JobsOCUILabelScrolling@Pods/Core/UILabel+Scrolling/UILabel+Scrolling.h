//
//  UILabel+Scrolling.h
//  JobsOCUILabelScrolling
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717
#define JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCUILabelScrolling/JobsLabelScrollConfiguration.h>)
#import <JobsOCUILabelScrolling/JobsLabelScrollConfiguration.h>
#else
#import "JobsLabelScrollConfiguration.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Scrolling)
/// 用统一枚举配置 UILabel 的四种定尺寸文字展示策略。
-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode;
-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode
              minimumScaleFactor:(CGFloat)minimumScaleFactor
            maximumNumberOfLines:(NSInteger)maximumNumberOfLines
             scrollConfiguration:(JobsLabelScrollConfiguration *)scrollConfiguration;
-(JobsLabelTextDisplayMode)jobs_textDisplayMode;
/// 配置滚动参数，不自动启动。
-(instancetype)byTextScroll:(JobsLabelScrollConfiguration *)configuration;
/// 仅在单行内容宽度超过 UILabel 可视宽度时启动。
-(instancetype)byStartTextScroll;
-(instancetype)byPauseTextScroll;
-(instancetype)byResumeTextScroll;
/// 文案、字体、颜色或约束尺寸变化后主动重建 CoreText 排版。
-(instancetype)byReloadTextScroll;
/// 停止并恢复 UILabel 原始绘制状态。
-(instancetype)byStopTextScroll;
-(BOOL)jobs_isTextScrolling;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717 */
