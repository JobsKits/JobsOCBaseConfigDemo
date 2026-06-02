//
//  BRPickerViewExtra.h
//  BRPickerViewExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//  Updated for latest BRPickerView on 2026年5月29日，星期五.
//

#ifndef BRPickerViewExtra_h
#define BRPickerViewExtra_h

#import "BRTextPickerView+Extra.h"
#import "NSObject+BRPickerView.h"
/**
 新版 BRPickerView 已经没有 BRStringPickerView / BRStringPickerMode。
 这里保留旧命名的轻量兼容层，目的是让历史代码中简单的：

     BRStringPickerView.initBy(BRStringPickerComponentSingle)

 能映射到：

     BRTextPickerView.initBy(BRTextPickerComponentSingle)

 注意：旧版 BRResultModel、resultModelBlock、resultModelArrayBlock 等 API 已不存在，
 需要迁移到 BRTextModel、singleResultBlock、multiResultBlock。
 */
#ifndef BRStringPickerView
#define BRStringPickerView BRTextPickerView
#endif

#ifndef BRStringPickerMode
#define BRStringPickerMode BRTextPickerMode
#endif

#ifndef BRStringPickerComponentSingle
#define BRStringPickerComponentSingle BRTextPickerComponentSingle
#endif

#ifndef BRStringPickerComponentMulti
#define BRStringPickerComponentMulti BRTextPickerComponentMulti
#endif

#ifndef BRStringPickerComponentCascade
#define BRStringPickerComponentCascade BRTextPickerComponentCascade
#endif

#ifndef BRStringPickerComponentLinkage
#define BRStringPickerComponentLinkage BRTextPickerComponentCascade
#endif

#endif /* BRPickerViewExtra_h */
