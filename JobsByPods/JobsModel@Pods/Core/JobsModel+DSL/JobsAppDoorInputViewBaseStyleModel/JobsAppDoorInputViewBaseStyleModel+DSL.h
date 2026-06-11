//
//  JobsAppDoorInputViewBaseStyleModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLEMODEL_DSL_64B2185162561510
#define JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLEMODEL_DSL_64B2185162561510

#if __has_include(<JobsModel/JobsAppDoorInputViewBaseStyleModel.h>)
#import <JobsModel/JobsAppDoorInputViewBaseStyleModel.h>
#else
#import "JobsAppDoorInputViewBaseStyleModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyleModel (DSL)

#pragma mark —— 来自 JobsAppDoorInputViewBaseStyleModel
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byLeftViewIMG;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))bySelectedSecurityBtnIMG;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byUnSelectedSecurityBtnIMG;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowDelBtn;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byIsShowSecurityBtn;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byUseCustomClearButton;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byNickNamePlaceHolderStr;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byTitleLabStr;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byTitleStrFont;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byTitleStrCor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSString * data))byInputStr;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSInteger data))byInputCharacterRestriction;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIReturnKeyType data))byReturnKeyType;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIKeyboardAppearance data))byKeyboardAppearance;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UITextFieldViewMode data))byLeftViewMode;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIKeyboardType data))byKeyboardType;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byKeyboardEnable;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byBackgroundColor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byDisabledBackground;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIImage * data))byBackground;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGSize data))byTfSize;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byTFRiseHeight;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byPlaceHolderOffset;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byFieldEditorOffset;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(NSTextAlignment data))byPlaceHolderAlignment;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byOffset;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byLeftViewOffsetX;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byRightViewOffsetX;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byZYTextFieldMasksToBounds;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYTextFieldBorderColor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYtextColor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byZYtintColor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byZYtextFont;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byZYTextFieldCornerRadius;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byZYTextFieldBorderWidth;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(BOOL data))byPlaceholdAnimationable;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIColor * data))byAnimationColor;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(UIFont * data))byAnimationFont;
-(__kindof JobsAppDoorInputViewBaseStyleModel *_Nonnull (^ _Nonnull)(CGFloat data))byMoveDistance;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLEMODEL_DSL_64B2185162561510 */
