//
//  UITextView+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTVIEW_EXTRA_14C4D94D0F
#define JOBS_HEADER_GUARD_UITEXTVIEW_EXTRA_14C4D94D0F

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface UITextView (Extra)

/// 从 iOS 16 起，UITextView 使用新的文本渲染系统，会使用 UITextLayoutFragmentView。
/// 它默认在某些情况下会将内容垂直居中，比如文本少、没有足够内容填满 UITextView 的高度时。
/// 所以一下操作就是在关闭这个新特性
-(jobsByVoidBlock _Nonnull)switchs;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byTextAlignment;
-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byTextContainerInset;
-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byContentInset;
-(JobsRetTextViewByPointBlock _Nonnull)byContentOffset;
-(JobsRetTextViewByPointBlock _Nonnull)byContentOffsetWithAnimated;
-(JobsRetTextViewByAttributedTextBlock _Nonnull)byAttributedText;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTVIEW_EXTRA_14C4D94D0F */
