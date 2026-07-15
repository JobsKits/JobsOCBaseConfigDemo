//
//  SZTextView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617
#define JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617

#import <UIKit/UIKit.h>

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface SZTextView (Extra)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SZTextView *_Nonnull jobsMakeSZTextView(jobsBySZTextViewBlock _Nonnull block){
    SZTextView *data = SZTextView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617 */
