//
//  JobsBtnTextViewStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#define JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "JobsBaseTableViewCell.h"
#import "BaseTextView.h"
#import "JobsTextView.h"

#import "JobsOCDSL.h"

#import "JobsRichTextUtils.h"
#import "JobsLanMgr.h"
#import "JobsDefines.h"
#import "JobsModelDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 包含一个按钮 和 一个TextView（用于承接富文本及其点击事件）
@interface JobsBtnTextViewStyleTBVCell : JobsBaseTableViewCell<UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7 */
