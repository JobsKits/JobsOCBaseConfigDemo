//
//  UITextFieldModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_253030781DC1BEE9
#define JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_253030781DC1BEE9

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldModel (DSL)

-(JobsRetUITextFieldModelByStrBlock _Nonnull)byText;
-(JobsRetUITextFieldModelByCorBlock _Nonnull)byTextCor;
-(JobsRetUITextFieldModelByFontBlock _Nonnull)byTextFont;
-(JobsRetUITextFieldModelByStrBlock _Nonnull)byTextFieldPlaceholder;
-(JobsRetUITextFieldModelByCorBlock _Nonnull)byPlaceholderColor;
-(JobsRetUITextFieldModelByFontBlock _Nonnull)byPlaceholderFont;
-(JobsRetUITextFieldModelByNSAttributedStringPointerBlock _Nonnull)byAttributedPlaceholder;
-(JobsRetUITextFieldModelByCorBlock _Nonnull)byBaseBackgroundColor;
-(JobsRetUITextFieldModelByNSTextAlignmentBlock _Nonnull)byPlaceHolderAlignment;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byCornerRadiusValue;
-(JobsRetUITextFieldModelByCorBlock _Nonnull)byLayerBorderCor;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byBorderWidth;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byText_offset;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byPlaceHolderOffset;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byLeftViewOffsetX;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byRightViewOffsetX;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byFieldEditorOffset;
-(JobsRetUITextFieldModelByUIViewPointerBlock _Nonnull)byLeftView;
-(JobsRetUITextFieldModelByUIViewPointerBlock _Nonnull)byRightView;
-(JobsRetUITextFieldModelByUITextFieldViewModeBlock _Nonnull)byLeftViewMode;
-(JobsRetUITextFieldModelByUITextFieldViewModeBlock _Nonnull)byRightViewMode;
-(JobsRetUITextFieldModelByBOOLBlock _Nonnull)byIsShowDelBtn;
-(JobsRetUITextFieldModelByBOOLBlock _Nonnull)byUseCustomClearButton;
-(JobsRetUITextFieldModelByBOOLBlock _Nonnull)byIsShowMenu;
-(JobsRetUITextFieldModelByBOOLBlock _Nonnull)byNotAllowEdit;
-(JobsRetUITextFieldModelByBOOLBlock _Nonnull)byTextFieldSecureTextEntry;
-(JobsRetUITextFieldModelByCGFloatBlock _Nonnull)byTFRiseHeight;
-(JobsRetUITextFieldModelByUIKeyboardAppearanceBlock _Nonnull)byKeyboardAppearance_;
-(JobsRetUITextFieldModelByUIKeyboardTypeBlock _Nonnull)byKeyboardType_;
-(JobsRetUITextFieldModelByUIReturnKeyTypeBlock _Nonnull)byReturnKeyType_;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byClearButtonRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byBorderRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byDrawPlaceholderInRect;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byLeftViewRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byRightViewRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byPlaceholderRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byTextRectForBounds;
-(JobsRetUITextFieldModelByFrameBlock _Nonnull)byEditingRectForBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_253030781DC1BEE9 */
