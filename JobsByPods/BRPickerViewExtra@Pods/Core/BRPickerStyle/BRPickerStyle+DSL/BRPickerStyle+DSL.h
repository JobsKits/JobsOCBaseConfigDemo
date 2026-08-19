//
//  BRPickerStyle+DSL.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_BRPICKERSTYLE_DSL_9A3D8F53D0
#define JOBS_HEADER_GUARD_BRPICKERSTYLE_DSL_9A3D8F53D0

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

@interface BRPickerStyle (DSL)

-(JobsRetBRPickerStyleByCorBlock _Nonnull)bySeparatorColor;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BRPickerStyle
-(JobsRetBRPickerStyleByCorBlock _Nonnull)byPickerColor;
-(JobsRetBRPickerStyleByCorBlock _Nonnull)byPickerTextColor;
-(JobsRetBRPickerStyleByNSStringBlock _Nonnull)byCancelBtnTitle;
-(JobsRetBRPickerStyleByNSStringBlock _Nonnull)byDoneBtnTitle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BRPickerStyle
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BRPickerStyle *_Nonnull jobsMakeBRPickerStyle(BRPickerViewExtraPickerStyleConfigBlock _Nonnull block) {
    BRPickerStyle *data = BRPickerStyle.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JOBS_HEADER_GUARD_BRPICKERSTYLE_DSL_9A3D8F53D0 */
