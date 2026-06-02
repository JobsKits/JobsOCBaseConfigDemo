//
//  JobsBtnTextViewStyleCVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3
#define JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3

#import <JobsBaseUI/JobsBaseCollectionViewCell.h>
#import <JobsBaseUI/BaseTextView.h>
#import <JobsBaseUI/JobsTextView.h>

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsRichTextUtils/JobsRichTextUtils.h>)
#import <JobsRichTextUtils/JobsRichTextUtils.h>
#else
#import "JobsRichTextUtils.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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
/// 包含一个按钮 和 一个TextView（用于承接富文本及其点击事件）
@interface JobsBtnTextViewStyleCVCell : JobsBaseCollectionViewCell<UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLECVCELL_C6469FF0C3 */
