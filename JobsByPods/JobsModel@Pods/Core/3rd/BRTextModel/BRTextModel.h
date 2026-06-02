//
//  BRTextModel.h
//  BRPickerViewDemo
//
//  Created by renbo on 2019/10/2.
//  Copyright © 2019 irenb. All rights reserved.
//
//  最新代码下载地址：https://github.com/agiapp/BRPickerView

#ifndef BRTextModel_h
#define BRTextModel_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BRTextModel : NSObject
/** code */
Prop_copy(nullable)NSString *code;
/** text */
Prop_copy(nullable)NSString *text;
/** 子级 list */
Prop_copy(nullable)NSArray<BRTextModel *> *children;
/** 父级 code */
Prop_strong()NSString *parentCode;
/** 其它扩展字段 */
Prop_strong(nullable)id extras;
/** 记录选择的索引位置 */
Prop_assign()NSInteger index;
/** 字典 转 模型 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

#endif /* BRTextModel_h */
