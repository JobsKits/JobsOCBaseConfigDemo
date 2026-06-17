//
//  UIButton+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月10日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2
#define JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2

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

@interface UIButton (DSL)

/// 回调 UIButton 原生 titleLabel，便于继续使用 UILabel+DSL。
-(JobsRetBtnByLabelBlock _Nonnull)byTitleLabel;
/// 回调 BaseButton 等子类可能持有的 subtitleLabel。不存在时回调 nil，不中断链式调用。
-(JobsRetBtnByLabelBlock _Nonnull)bySubtitleLabel;
/// 回调 UIButton 原生 imageView。
-(JobsRetBtnByImageViewBlock _Nonnull)byImageView;
/// 设置标题对齐方式；BaseButton 等子类若持有 titleAlignment 属性，也会同步写入。
-(JobsRetBtnByTextAlignmentBlock _Nonnull)byTitleAlignment;
/// 设置标题换行方式；BaseButton 等子类若持有 lineBreakMode / titleLineBreakMode 属性，也会同步写入。
-(JobsRetBtnByLineBreakModeBlock _Nonnull)byLineBreakMode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_DSL_37F5B7F4E2 */
