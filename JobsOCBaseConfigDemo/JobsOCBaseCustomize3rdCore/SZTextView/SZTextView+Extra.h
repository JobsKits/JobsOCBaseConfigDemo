//
//  SZTextView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#define JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617

#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface SZTextView (Extra)

-(JobsRetSZTextViewByStrBlock _Nonnull)byText;
-(JobsRetSZTextViewByCorBlock _Nonnull)byTextColor;
-(JobsRetSZTextViewByFontBlock _Nonnull)byFont;
-(JobsRetSZTextViewByStrBlock _Nonnull)byPlaceholder;
-(JobsRetSZTextViewByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetSZTextViewByCorBlock _Nonnull)byPlaceholderColor;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof SZTextView *_Nonnull jobsMakeSZTextView(jobsBySZTextViewBlock _Nonnull block){
    SZTextView *data = SZTextView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_SZTEXTVIEW_EXTRA_FE8B875617 */
