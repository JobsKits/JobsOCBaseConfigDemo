//
//  JobsTextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#define JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "UIView+Extra.h"
#import "UITextView+Extend.h"
#import "JobsOCDSL.h"

#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
