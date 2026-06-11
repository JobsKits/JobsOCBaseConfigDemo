//
//  BRStringPickerViewModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_AF7952ABE44E9E26
#define JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_AF7952ABE44E9E26

#if __has_include(<JobsModel/BRStringPickerViewModel.h>)
#import <JobsModel/BRStringPickerViewModel.h>
#else
#import "BRStringPickerViewModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRStringPickerViewModel (DSL)

#pragma mark —— 来自 BRStringPickerViewModel
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BRTextPickerMode data))byPickerMode;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray * data))byDataSourceArr;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byFileName;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byPlistName;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSInteger data))bySelectIndex;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))bySelectIndexs;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))bySelectValue;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))bySelectValues;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSUInteger data))byShowColumnNum;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSInteger data))byNumberOfComponents;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BOOL data))bySelectRowAnimated;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BOOL data))byIsAutoSelect;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(BRPickerStyle * data))byPickerStyle;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byPickerHeaderView;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byPickerFooterView;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byAlertView;
-(__kindof BRStringPickerViewModel *_Nonnull (^ _Nonnull)(UIView * data))byKeyView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_AF7952ABE44E9E26 */
