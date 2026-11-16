//
//  UILabel+Scrolling.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717
#define JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#import "JobsOCDSL.h"
#import "JobsDefines.h"
#import "JobsLabelScrollConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Scrolling)

/// 用统一枚举配置 UILabel 的四种定尺寸文字展示策略。
-(JobsRetIDByJobsLabelTextDisplayModeBlock _Nonnull)byTextDisplayMode;
-(instancetype)byTextDisplayMode:(JobsLabelTextDisplayMode)mode
              minimumScaleFactor:(CGFloat)minimumScaleFactor
            maximumNumberOfLines:(NSInteger)maximumNumberOfLines
             scrollConfiguration:(JobsLabelScrollConfiguration *)scrollConfiguration;
-(JobsRetJobsLabelTextDisplayModeByVoidBlock _Nonnull)jobs_textDisplayMode;

/// 配置滚动参数，不自动启动。
-(JobsRetIDByJobsLabelScrollConfigurationBlock _Nonnull)byTextScroll;
/// 仅在单行内容宽度超过 UILabel 可视宽度时启动。
-(JobsRetIDByVoidBlock _Nonnull)byStartTextScroll;
-(JobsRetIDByVoidBlock _Nonnull)byPauseTextScroll;
-(JobsRetIDByVoidBlock _Nonnull)byResumeTextScroll;
/// 文案、字体、颜色或约束尺寸变化后主动重建 CoreText 排版。
-(JobsRetIDByVoidBlock _Nonnull)byReloadTextScroll;
/// 停止并恢复 UILabel 原始绘制状态。
-(JobsRetLabelByVoidBlock _Nonnull)byStopTextScroll;
-(JobsRetBOOLByVoidBlock _Nonnull)jobs_isTextScrolling;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UILABEL_SCROLLING_20260717 */
