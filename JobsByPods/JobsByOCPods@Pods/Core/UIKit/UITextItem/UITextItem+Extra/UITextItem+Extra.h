//
//  UITextItem+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_B0EBA49D4C
#define JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_B0EBA49D4C

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

@interface UITextItem (JobsByOCPodsExtra)

Prop_strong()UITextView *textView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTITEM_EXTRA_B0EBA49D4C */
