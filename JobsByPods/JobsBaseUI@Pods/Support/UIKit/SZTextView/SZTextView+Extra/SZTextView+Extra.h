//
//  SZTextView+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月18日，星期一.
//

#ifndef JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_226A1CDF16
#define JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_226A1CDF16

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UITextView+Extra.h>

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

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SZTextView (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SZTextView *_Nonnull jobsMakeSZTextView(jobsBySZTextViewBlock _Nonnull block){
    SZTextView *data = SZTextView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_226A1CDF16 */
