//
//  BRStringPickerViewModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_1BB58CD861E70D0D
#define JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_1BB58CD861E70D0D

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRStringPickerViewModel (DSL)

-(JobsRetBRStringPickerViewModelByBRTextPickerModeBlock _Nonnull)byPickerMode;
-(JobsRetBRStringPickerViewModelByNSArrayPointerBlock _Nonnull)byDataSourceArr;
-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byFileName;
-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byPlistName;
-(JobsRetBRStringPickerViewModelByNSIntegerBlock _Nonnull)bySelectIndex;
-(JobsRetBRStringPickerViewModelByNSArrayNSNumberPointerPointerBlock _Nonnull)bySelectIndexs;
-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)bySelectValue;
-(JobsRetBRStringPickerViewModelByNSArrayNSStringPointerPointerBlock _Nonnull)bySelectValues;
-(JobsRetBRStringPickerViewModelByNSUIntegerBlock _Nonnull)byShowColumnNum;
-(JobsRetBRStringPickerViewModelByNSIntegerBlock _Nonnull)byNumberOfComponents;
-(JobsRetBRStringPickerViewModelByBOOLBlock _Nonnull)bySelectRowAnimated;
-(JobsRetBRStringPickerViewModelByStrBlock _Nonnull)byTitle;
-(JobsRetBRStringPickerViewModelByBOOLBlock _Nonnull)byIsAutoSelect;
-(JobsRetBRStringPickerViewModelByBRPickerStylePointerBlock _Nonnull)byPickerStyle;
-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byPickerHeaderView;
-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byPickerFooterView;
-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byAlertView;
-(JobsRetBRStringPickerViewModelByUIViewPointerBlock _Nonnull)byKeyView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRSTRINGPICKERVIEWMODEL_DSL_1BB58CD861E70D0D */
