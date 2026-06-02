//
//  NSArray+BRPickerView.m
//  BRPickerView
//
//  Created by Jobs on 2026/5/29.
//

#import "NSArray+BRPickerView.h"

@implementation NSArray (BRPickerView)
/// 数组 转 模型数组
+ (NSArray *)br_modelArrayWithJson:(NSArray *)dataArr mapper:(nullable NSDictionary *)mapper {
    if (!dataArr || dataArr.count == 0) {
        return nil;
    }
    if (!mapper) {
        // 如果属性映射字典为空，就使用下面默认的
        mapper = @{
            @"code": @"code",
            @"text": @"text",
            @"parentCode": @"parent_code",
            @"extras": @"extras",
            @"children": @"children"
        };
    }
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSDictionary *dic in dataArr) {
        BRTextModel *model = [[BRTextModel alloc]init];

        NSString *codeMappingKey = mapper[@"code"] ?: @"code";
        model.code = dic[codeMappingKey] ? [NSString stringWithFormat:@"%@", dic[codeMappingKey]] : nil;

        NSString *textMappingKey = mapper[@"text"] ?: @"text";
        model.text = dic[textMappingKey];

        NSString *parentCodeMappingKey = mapper[@"parentCode"] ?: @"parentCode";
        model.parentCode = dic[parentCodeMappingKey] ? [NSString stringWithFormat:@"%@", dic[parentCodeMappingKey]] : nil;

        NSString *extrasMappingKey = mapper[@"extras"] ?: @"extras";
        model.extras = dic[extrasMappingKey];

        NSString *childrenMappingKey = mapper[@"children"] ?: @"children";
        NSArray *children = dic[childrenMappingKey];
        if (children && children.count > 0) {
            model.children = [self br_modelArrayWithJson:children mapper:mapper]; // 递归处理子list
        }

        [tempArr addObject:model];
    }

    return [tempArr copy];
}

/// 获取模型数组元素，指定属性的值组成新数组
- (NSArray *)br_getValueArr:(NSString *)propertyName {
    NSMutableArray *valueArr = [[NSMutableArray alloc]init];
    for (BRTextModel *model in self) {
        id propertyValue = [model valueForKey:propertyName];
        if (propertyValue) {
            [valueArr addObject:propertyValue];
        }
    }
    return [valueArr copy];
}

/// 将模型数组元素，指定属性连接成字符串
- (NSString *)br_joinValue:(NSString *)propertyName separator:(NSString *)separator {
    NSArray *valueArr = [self br_getValueArr:propertyName];
    if (valueArr && valueArr.count > 0) {
        return [valueArr componentsJoinedByString:separator];
    }
    return @"";
}

/// 将模型数组元素的 text 属性，连接成字符串
- (NSString *)br_joinText:(NSString *)separator {
    NSArray *valueArr = [self br_getValueArr:@"text"];
    if (valueArr && valueArr.count > 0) {
        return [valueArr componentsJoinedByString:separator];
    }
    return @"";
}

/// 将扁平结构模型数组 转换成 树状结构模型数组
- (NSArray<BRTextModel *> *)br_buildTreeArray {
    NSMutableArray<BRTextModel *> *treeModels = [NSMutableArray array];
    NSMutableDictionary<NSString *, BRTextModel *> *allItemDic = [NSMutableDictionary dictionary];

    // 将所有模型对象以 code 作为 key 存入字典
    for (BRTextModel *model in self) {
        if (model.code && model.code.length > 0) {
            allItemDic[model.code] = model;
        }
    }

    for (BRTextModel *model in self) {
        NSString *parentCode = model.parentCode;
        BRTextModel *parentModel = parentCode && parentCode.length > 0 ? allItemDic[parentCode] : nil;
        if (parentModel) {
            if (!parentModel.children) {
                parentModel.children = [NSArray array];
            }
            parentModel.children = [parentModel.children arrayByAddingObject:model];
        } else {
            // 没有找到对应的父级模型，即该模型为根节点
            [treeModels addObject:model];
        }
    }

    return treeModels;
}

@end
