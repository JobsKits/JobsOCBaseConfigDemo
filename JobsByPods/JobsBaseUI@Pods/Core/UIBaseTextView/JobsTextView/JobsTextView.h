//
//  JobsTextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561
#define JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561

#import <UIKit/UIKit.h>
#import <JobsBaseUI/BaseView.h>
#import <JobsBaseUI/UIView+Extra.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@interface JobsTextView : BaseView

-(JobsRetJobsTextViewByTextModelBlock _Nonnull)byTextModel;
-(JobsRetJobsTextViewByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_;
-(JobsRetJobsTextViewByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_;
-(JobsRetJobsTextViewByUIKeyboardTypeBlock _Nonnull)byKeyboardType_;
-(JobsRetJobsTextViewByStrBlock _Nonnull)byPlaceholder;
-(JobsRetJobsTextViewByFontBlock _Nonnull)byFont;
-(JobsRetJobsTextViewByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetJobsTextViewByCorBlock _Nonnull)byPlaceholderColor;
-(JobsRetSZTextViewByVoidBlock _Nonnull)getTextView;
-(jobsByNSIntegerBlock _Nonnull)updateWordCount;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTextView *_Nonnull makeJobsTextView(jobsByJobsTextViewBlock _Nonnull block){
    JobsTextView *data = JobsTextView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561 */
