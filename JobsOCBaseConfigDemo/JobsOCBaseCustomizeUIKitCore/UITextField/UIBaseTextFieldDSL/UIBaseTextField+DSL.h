//
//  UIBaseTextField+DSL.h
//  JobsOCBaseConfigDemo
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
-(JobsRetCJTextFieldByDeleteDelegateBlock _Nonnull)byCJDelegate;
@end

@interface HQTextField (JobsUIBaseTextFieldDSL)
-(JobsRetHQTextFieldByVoidBlock _Nonnull)byShowWarn;
@end

@interface ZYTextField (JobsUIBaseTextFieldDSL)
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldCornerRadius;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byZYTextFieldBorderWidth;
-(JobsRetZYTextFieldByCorBlock _Nonnull)byZYTextFieldBorderColor;
-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byZYTextFieldMasksToBounds;

-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byIsShowDelBtn;
-(JobsRetZYTextFieldByBOOLBlock _Nonnull)byUseCustomClearButton;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byClearButtonRectForBounds;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byLeftViewRectForBounds;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byRightViewRectForBounds;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byDrawPlaceholderInRect;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byPlaceholderRectForBounds;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byTextRectForBounds;
-(JobsRetZYTextFieldByCGRectBlock _Nonnull)byEditingRectForBounds;
-(JobsRetZYTextFieldByCorBlock _Nonnull)byPlaceholderColor;
-(JobsRetZYTextFieldByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetZYTextFieldByNSIntegerBlock _Nonnull)byPlaceHolderAlignment;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byPlaceHolderOffset;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byTextOffset;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byFieldEditorOffset;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byLeftViewOffsetX;
-(JobsRetZYTextFieldByCGFloatBlock _Nonnull)byRightViewOffsetX;
@end

@interface JobsMagicTextField (JobsUIBaseTextFieldDSL)
-(JobsRetMagicTextFieldByBOOLBlock _Nonnull)byPlaceholdAnimationable;
-(JobsRetMagicTextFieldByCorBlock _Nonnull)byAnimationColor;
-(JobsRetMagicTextFieldByFontBlock _Nonnull)byAnimationFont;
-(JobsRetMagicTextFieldByCGFloatBlock _Nonnull)byMoveDistance;
-(JobsRetMagicTextFieldByTimeIntervalBlock _Nonnull)byAnimationTime;
@end

@interface JobsTextField (JobsUIBaseTextFieldDSL)
-(JobsRetJobsTextFieldByUITextFieldBlock _Nonnull)byRealTextField;
-(JobsRetJobsTextFieldByTextFieldConfigBlock _Nonnull)byRealTextFieldConfig;
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBASETEXTFIELD_DSL_6F0F8CB1D8 */
