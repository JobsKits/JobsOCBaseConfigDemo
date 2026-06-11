//
//  JobsBtnTextViewStyleTBVCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7
#define JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/JobsBaseTableViewCell.h>
#import <JobsBaseUI/BaseTextView.h>
#import <JobsBaseUI/JobsTextView.h>
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 包含一个按钮 和 一个TextView（用于承接富文本及其点击事件）
@interface JobsBtnTextViewStyleTBVCell : JobsBaseTableViewCell<UITextViewDelegate>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBTNTEXTVIEWSTYLETBVCELL_4E2492D2A7 */
