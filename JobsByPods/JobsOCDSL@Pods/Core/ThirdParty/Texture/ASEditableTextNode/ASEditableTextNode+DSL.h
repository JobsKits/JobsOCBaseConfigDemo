//
//  ASEditableTextNode+DSL.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ASEDITABLETEXTNODE_DSL_60D8D10297
#define JOBS_HEADER_GUARD_ASEDITABLETEXTNODE_DSL_60D8D10297

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <objc/runtime.h>
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

@interface ASEditableTextNode (DSL)

-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byScrollEnabled;
-(JobsRetEditableTextNodeByDictBlock _Nonnull)byTypingAttributes;
-(JobsRetEditableTextNodeByRangeBlock _Nonnull)bySelectedRange;
-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byPlaceholder;
-(JobsRetEditableTextNodeByAttrTextBlock _Nonnull)byText;
-(JobsRetEditableTextNodeByInsetsBlock _Nonnull)byTextContainerInset;
-(JobsRetEditableTextNodeByUIntBlock _Nonnull)byMaximumLinesToDisplay;
-(JobsRetEditableTextNodByeAutocapBlock _Nonnull)byAutocapitalizationType;
-(JobsRetEditableTextNodeByAutocorrBlock _Nonnull)byAutocorrectionType;
-(JobsRetEditableTextNodeBySpellBlock _Nonnull)bySpellCheckingType;
-(JobsRetEditableTextNodeByKeyboardTypeBlock _Nonnull)byKeyboardType;
-(JobsRetEditableTextNodeByKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance;
-(JobsRetEditableTextNodeByReturnKeyBlock _Nonnull)byReturnKeyType;
-(JobsRetEditableTextNodeByBoolBlock _Nonnull)byEnablesReturnKeyAutomatically;
-(JobsRetEditableTextNodeByBoolBlock _Nonnull)bySecureTextEntry;
-(JobsRetEditableTextNodeByTextViewBlock _Nonnull)byTextView;
/// 事件（Begin / Change / End）
-(JobsRetEditableTextNodeByOnBeginBlock _Nonnull)onBeginEditingBy;
-(JobsRetEditableTextNodeByOnChangeBlock _Nonnull)onTextChangeBy;
-(JobsRetEditableTextNodeByOnEndBlock _Nonnull)onEndEditingBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASEDITABLETEXTNODE_DSL_60D8D10297 */
