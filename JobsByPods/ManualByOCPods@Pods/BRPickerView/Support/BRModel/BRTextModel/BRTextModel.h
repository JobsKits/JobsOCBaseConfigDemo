//
//  BRTextModel.h
//  BRPickerViewDemo
//
//  Created by renbo on 2019/10/2.
//  Copyright © 2019 irenb. All rights reserved.
//
//  最新代码下载地址：https://github.com/agiapp/BRPickerView

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRTextModel : NSObject
/** code */
@property (nullable, nonatomic, copy) NSString *code;
/** text */
@property (nullable, nonatomic, copy) NSString *text;
/** 子级 list */
@property (nullable, nonatomic, copy) NSArray<BRTextModel *> *children;
/** 父级 code */
@property (nonatomic, strong) NSString *parentCode;
/** 其它扩展字段 */
@property (nullable, nonatomic, strong) id extras;
/** 记录选择的索引位置 */
@property (nonatomic, assign) NSInteger index;

/** 字典 转 模型 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
