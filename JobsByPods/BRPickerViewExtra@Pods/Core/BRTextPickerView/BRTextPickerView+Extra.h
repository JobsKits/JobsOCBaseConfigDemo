//
//  BRTextPickerView+Extra.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#ifndef JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED
#define JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED

#import <UIKit/UIKit.h>

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
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

@interface BRTextPickerView (Extra)
/// 链式初始化：BRTextPickerView.initBy(BRTextPickerComponentSingle)
+(BRPickerViewExtraReturnTextPickerViewByPickerModeBlock)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_BRTEXTPICKERVIEW_EXTRA_E3DB663CED */
