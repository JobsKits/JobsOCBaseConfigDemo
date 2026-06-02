//
//  UITextItem+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_EC1E53696F
#define JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_EC1E53696F

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextItem (Extra)

Prop_strong()UITextView *textView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_EC1E53696F */
