//
//  UIButton+TextView.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_55649BEC79
#define JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_55649BEC79

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsSuspend/UIView+Measure.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#ifndef BaseTextView
#define BaseTextView UITextView
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (JobsSuspendExtra)

-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedText;

@end

@interface UIButton (TextView)

Prop_strong()BaseTextView *titleTextView;
Prop_strong()BaseTextView *subtitleTextView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_TEXTVIEW_55649BEC79 */
