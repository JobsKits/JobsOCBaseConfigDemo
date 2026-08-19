//
//  NSObject+BRPickerView.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_BRPICKERVIEW_99BF2FC412
#define JOBS_HEADER_GUARD_NSOBJECT_BRPICKERVIEW_99BF2FC412

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <BRPickerViewExtra/BRPickerStyle+DSL.h>
#import <BRPickerViewExtra/BRTextPickerView+Extra.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<BRPickerView/BRPickerView.h>)
#import <BRPickerView/BRPickerView.h>
#else
#import "BRPickerView.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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
/// 平替 UIPickerView：https://github.com/agiapp/BRPickerView
/// 适配说明：新版 BRPickerView 已移除 BRStringPickerView / BRAddressPickerView，统一迁移到 BRTextPickerView。
@interface NSObject (BRPickerView)
#pragma mark —— BRTextPickerView / BRDatePickerView
/// UI
Prop_strong()BRTextPickerView *textPickerView;
        // 文本选择器（新版主入口）
Prop_strong()BRTextPickerView *stringPickerView;      // 旧命名兼容，实际等同于 textPickerView
Prop_strong()BRTextPickerView *addressPickerView;     // 旧地址选择器兼容，实际为 BRTextPickerComponentCascade 文本级联选择器
Prop_strong()BRDatePickerView *datePickerView;
        // 时间选择器
/// Data
Prop_assign()BRTextPickerMode brTextPickerMode;
Prop_assign()BRTextPickerMode brStringPickerMode;     // 旧命名兼容，实际等同于 brTextPickerMode
Prop_strong()NSMutableArray *BRTextPickerViewDataMutArr;
Prop_strong()NSMutableArray *BRStringPickerViewDataMutArr; // 旧命名兼容，实际等同于 BRTextPickerViewDataMutArr
Prop_strong()BRPickerStyle *customStyle;

/// 以应对一个视图上面多个 BRPickerView 的情况。
/// 关键代码：[self.pickerView1 addPickerToView:承接的视图1]; 只能一对一承接。
- (JobsRetBRPickerStyleByVoidBlock _Nonnull)makeCustomStyle;
- (BRPickerViewExtraRetTextPickerViewByPickerModeBlock)makeTextPickerView;
- (BRPickerViewExtraRetTextPickerViewByPickerModeBlock)makeStringPickerView;       // 旧命名兼容
- (BRPickerViewExtraRetTextPickerViewByPickerStyleBlock)makeAddressPickerView;     // 旧命名兼容：返回 BRTextPickerView 级联选择器
- (BRPickerViewExtraRetDatePickerViewByPickerStyleBlock)makeDatePickerView;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof BRTextPickerView *_Nonnull jobsMakeBRTextPickerView(BRPickerViewExtraTextPickerViewConfigBlock _Nonnull block) {
    BRTextPickerView *data = [[BRTextPickerView alloc] initWithPickerMode:BRTextPickerComponentSingle];
    if (block) block(data);
    return data;
}

NS_INLINE __kindof BRDatePickerView *_Nonnull jobsMakeBRDatePickerView(BRPickerViewExtraDatePickerViewConfigBlock _Nonnull block) {
    BRDatePickerView *data = [[BRDatePickerView alloc] initWithPickerMode:BRDatePickerModeYMD];
    if (block) block(data);
    return data;
}

/**
 * 适配备注
 * 1. BRStringPickerView 已移除：请使用 BRTextPickerView。
 * 2. BRAddressPickerView 已移除：请使用 BRTextPickerView + BRTextPickerComponentCascade + 树状 BRTextModel 数据源实现地区级联。
 * 3. BRResultModel 已移除：请使用 BRTextModel。
 * 4. resultModelBlock / resultModelArrayBlock 已移除：请使用 singleResultBlock / multiResultBlock。
 */
#endif /* JOBS_HEADER_GUARD_NSOBJECT_BRPICKERVIEW_99BF2FC412 */
