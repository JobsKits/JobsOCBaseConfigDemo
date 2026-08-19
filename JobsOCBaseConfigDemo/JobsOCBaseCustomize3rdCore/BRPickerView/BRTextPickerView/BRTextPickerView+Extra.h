//
//  BRTextPickerView+Extra.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#ifndef JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#define JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED

#import <UIKit/UIKit.h>

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRTextPickerView (Extra)
/// 链式初始化：BRTextPickerView.initBy(BRTextPickerComponentSingle)
+(BRPickerViewExtraRetTextPickerViewByPickerModeBlock)initBy;
-(JobsRetBRTextPickerViewByPickerModeBlock _Nonnull)byPickerMode;
-(JobsRetBRTextPickerViewByStrBlock _Nonnull)byTitle;
-(JobsRetBRTextPickerViewByUIntegerBlock _Nonnull)byShowColumnNum;
-(JobsRetBRTextPickerViewByPickerStyleBlock _Nonnull)byPickerStyle;
-(JobsRetBRTextPickerViewByArrBlock _Nonnull)byDataSourceArr;

@end


@interface BRDatePickerView (Extra)

-(JobsRetBRDatePickerViewByNSIntegerBlock _Nonnull)byPickerMode;
-(JobsRetBRDatePickerViewByStrBlock _Nonnull)byTitle;
-(JobsRetBRDatePickerViewByPickerStyleBlock _Nonnull)byPickerStyle;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BRDatePickerView
-(JobsRetBRDatePickerViewByBOOLBlock _Nonnull)byAutoSelect;
-(JobsRetBRDatePickerViewByNSDateBlock _Nonnull)byMaxDate;
-(void)setMaxDate:(NSDate * _Nullable)data;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BRDatePickerView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED */
