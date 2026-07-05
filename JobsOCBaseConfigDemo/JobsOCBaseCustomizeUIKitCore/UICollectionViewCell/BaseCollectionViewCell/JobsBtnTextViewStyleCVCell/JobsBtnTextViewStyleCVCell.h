#import "UIView+Extra.h"
//
//  JobsBtnTextViewStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3
#define JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3

#import "JobsBaseCollectionViewCell.h"
#import "BaseTextView.h"
#import "JobsTextView.h"

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsRichTextUtils.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 包含一个按钮 和 一个TextView（用于承接富文本及其点击事件）
@interface JobsBtnTextViewStyleCVCell : JobsBaseCollectionViewCell<UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3 */
