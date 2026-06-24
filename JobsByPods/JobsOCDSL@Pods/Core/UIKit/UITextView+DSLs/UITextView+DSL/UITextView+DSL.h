//
//  UITextView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月8日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UITEXTVIEW_DSL_4F3A7E82B1
#define JOBS_HEADER_GUARD_UITEXTVIEW_DSL_4F3A7E82B1

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

@interface UITextView (DSL)

#pragma mark —— 基础文本
-(JobsRetTextViewByStringBlock _Nonnull)byText;
-(JobsRetTextViewByAttributedStringBlock _Nonnull)byAttributedText;
-(JobsRetTextViewByCorBlock _Nonnull)byTextCor;
-(JobsRetTextViewByFontBlock _Nonnull)byFont;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byTextAlignment;
-(JobsRetTextViewByNSRangeBlock _Nonnull)bySelectedRange;
-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byTypingAttributes API_AVAILABLE(ios(6.0));
-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byMarkedTextStyle;
-(JobsRetTextViewByEdgeInsetsBlock _Nonnull)byTextContainerInset;
-(JobsRetTextViewByNSDictionaryBlock _Nonnull)byLinkTextAttributes;
#pragma mark —— 编辑行为
-(JobsRetTextViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetTextViewByBOOLBlock _Nonnull)byEditable;
-(JobsRetTextViewByBOOLBlock _Nonnull)bySelectable;
-(JobsRetTextViewByNSUIntegerBlock _Nonnull)byDataDetectorTypes;
-(JobsRetTextViewByBOOLBlock _Nonnull)byAllowsEditingTextAttributes API_AVAILABLE(ios(6.0));
-(JobsRetTextViewByBOOLBlock _Nonnull)byClearsOnInsertion API_AVAILABLE(ios(6.0));
#pragma mark —— 输入视图
-(JobsRetTextViewByViewBlock _Nonnull)byInputView;
-(JobsRetTextViewByViewBlock _Nonnull)byInputAccessoryView API_UNAVAILABLE(visionos);
#pragma mark —— 键盘
-(JobsRetTextViewByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsRetTextViewByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsRetTextViewByReturnKeyTypeBlock _Nonnull)byReturnKeyType;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byAutocapitalizationType;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byAutocorrectionType;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySpellCheckingType;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartQuotesType API_AVAILABLE(ios(11.0));
-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartDashesType API_AVAILABLE(ios(11.0));
-(JobsRetTextViewByNSIntegerBlock _Nonnull)bySmartInsertDeleteType API_AVAILABLE(ios(11.0));
-(JobsRetTextViewByBOOLBlock _Nonnull)byEnablesReturnKeyAutomatically;
-(JobsRetTextViewByBOOLBlock _Nonnull)bySecureTextEntry;
-(JobsRetTextViewByTextContentTypeBlock _Nonnull)byTextContentType API_AVAILABLE(ios(10.0));
-(JobsRetTextViewByWritingToolsBehaviorBlock _Nonnull)byWritingToolsBehavior API_AVAILABLE(ios(18.0), visionos(2.4)) API_UNAVAILABLE(tvos, watchos);
-(JobsRetTextViewByWritingToolsResultOptionsBlock _Nonnull)byAllowedWritingToolsResultOptions API_AVAILABLE(ios(18.0), visionos(2.4)) API_UNAVAILABLE(tvos, watchos);
#pragma mark —— Single-parameter methods
-(JobsRetTextViewByNSRangeBlock _Nonnull)byScrollRangeToVisible;
#pragma mark —— 文本容器
-(JobsRetTextViewByCGFloatBlock _Nonnull)byLineFragmentPadding;
-(JobsRetTextViewByNSUIntegerBlock _Nonnull)byMaximumNumberOfLines;
-(JobsRetTextViewByNSIntegerBlock _Nonnull)byLineBreakMode;
-(JobsRetTextViewByBOOLBlock _Nonnull)byWidthTracksTextView;
-(JobsRetTextViewByBOOLBlock _Nonnull)byHeightTracksTextView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTVIEW_DSL_4F3A7E82B1 */
