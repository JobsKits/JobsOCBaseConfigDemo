//
//  UITextFieldModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_859D14D891913AEB
#define JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_859D14D891913AEB

#if __has_include(<JobsModel/UITextFieldModel.h>)
#import <JobsModel/UITextFieldModel.h>
#else
#import "UITextFieldModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextFieldModel (DSL)

#pragma mark —— 来自 UITextFieldProtocol
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSString * data))byText;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byTextCor;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIFont * data))byTextFont;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSString * data))byTextFieldPlaceholder;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byPlaceholderColor;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIFont * data))byPlaceholderFont;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSAttributedString * data))byAttributedPlaceholder;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byBaseBackgroundColor;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byPlaceHolderAlignment;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byCornerRadiusValue;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIColor * data))byLayerBorderCor;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byBorderWidth;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byText_offset;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byPlaceHolderOffset;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewOffsetX;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewOffsetX;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byFieldEditorOffset;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byLeftView;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(__kindof UIView * data))byRightView;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byLeftViewMode;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byRightViewMode;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowDelBtn;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byUseCustomClearButton;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowMenu;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byNotAllowEdit;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(BOOL data))byTextFieldSecureTextEntry;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGFloat data))byTFRiseHeight;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIKeyboardAppearance data))byKeyboardAppearance_;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIKeyboardType data))byKeyboardType_;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(UIReturnKeyType data))byReturnKeyType_;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byClearButtonRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byBorderRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byDrawPlaceholderInRect;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byLeftViewRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byRightViewRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byPlaceholderRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byTextRectForBounds;
-(__kindof UITextFieldModel *_Nonnull (^ _Nonnull)(CGRect data))byEditingRectForBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTFIELDMODEL_DSL_859D14D891913AEB */
