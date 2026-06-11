//
//  UIBaseTextField+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四。
//

#ifndef JOBS_HEADER_GUARD_UIBASETEXTFIELD_DSL_6F0F8CB1D8
#define JOBS_HEADER_GUARD_UIBASETEXTFIELD_DSL_6F0F8CB1D8

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/CJTextField.h>)
#import <JobsBaseUI/CJTextField.h>
#else
#import "CJTextField.h"
#endif

#if __has_include(<JobsBaseUI/HQTextField.h>)
#import <JobsBaseUI/HQTextField.h>
#else
#import "HQTextField.h"
#endif

#if __has_include(<JobsBaseUI/ZYTextField.h>)
#import <JobsBaseUI/ZYTextField.h>
#else
#import "ZYTextField.h"
#endif

#if __has_include(<JobsBaseUI/JobsMagicTextField.h>)
#import <JobsBaseUI/JobsMagicTextField.h>
#else
#import "JobsMagicTextField.h"
#endif

#if __has_include(<JobsBaseUI/JobsTextField.h>)
#import <JobsBaseUI/JobsTextField.h>
#else
#import "JobsTextField.h"
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

@interface CJTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnCJTextFieldByDeleteDelegateBlock _Nonnull)byCJDelegate;
@end

@interface HQTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnHQTextFieldByVoidBlock _Nonnull)byShowWarn;
@end

@interface ZYTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldCornerRadius;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldBorderWidth;
-(JobsReturnZYTextFieldByCorBlock _Nonnull)byZYTextFieldBorderColor;
-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byZYTextFieldMasksToBounds;

-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byIsShowDelBtn;
-(JobsReturnZYTextFieldByBOOLBlock _Nonnull)byUseCustomClearButton;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byClearButtonRectForBounds;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byLeftViewRectForBounds;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byRightViewRectForBounds;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byDrawPlaceholderInRect;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byPlaceholderRectForBounds;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byTextRectForBounds;
-(JobsReturnZYTextFieldByCGRectBlock _Nonnull)byEditingRectForBounds;
-(JobsReturnZYTextFieldByCorBlock _Nonnull)byPlaceholderColor;
-(JobsReturnZYTextFieldByFontBlock _Nonnull)byPlaceholderFont;
-(JobsReturnZYTextFieldByNSIntegerBlock _Nonnull)byPlaceHolderAlignment;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byPlaceHolderOffset;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byTextOffset;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byFieldEditorOffset;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byLeftViewOffsetX;
-(JobsReturnZYTextFieldByCGFloatBlock _Nonnull)byRightViewOffsetX;
@end

@interface JobsMagicTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnMagicTextFieldByBOOLBlock _Nonnull)byPlaceholdAnimationable;
-(JobsReturnMagicTextFieldByCorBlock _Nonnull)byAnimationColor;
-(JobsReturnMagicTextFieldByFontBlock _Nonnull)byAnimationFont;
-(JobsReturnMagicTextFieldByCGFloatBlock _Nonnull)byMoveDistance;
-(JobsReturnMagicTextFieldByTimeIntervalBlock _Nonnull)byAnimationTime;
@end

@interface JobsTextField (JobsUIBaseTextFieldDSL)
-(JobsReturnJobsTextFieldByUITextFieldBlock _Nonnull)byRealTextField;
-(JobsReturnJobsTextFieldByTextFieldConfigBlock _Nonnull)byRealTextFieldConfig;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBASETEXTFIELD_DSL_6F0F8CB1D8 */
