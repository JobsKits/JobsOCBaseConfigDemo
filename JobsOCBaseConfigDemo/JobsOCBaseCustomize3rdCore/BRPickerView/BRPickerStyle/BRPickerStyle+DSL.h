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

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRPickerStyle (DSL)

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BRPickerStyle *_Nonnull jobsMakeBRPickerStyle(BRPickerViewExtraPickerStyleConfigBlock _Nonnull block) {
    BRPickerStyle *data = BRPickerStyle.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JOBS_HEADER_GUARD_BRPICKERSTYLE_DSL_9A3D8F53D0 */
