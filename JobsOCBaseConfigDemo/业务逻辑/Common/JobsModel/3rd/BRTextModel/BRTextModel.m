//
//  BRTextModel.m
//  JobsOCBaseConfigDemo
//
//  Created by renbo on 2019/10/2.
//  Copyright © 2019 irenb. All rights reserved.
//
//  最新代码下载地址：https://github.com/agiapp/BRPickerView

#import "BRTextModel.h"

@implementation BRTextModel

/// 字典 转 模型
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.code = dictionary[@"code"];
        self.text = dictionary[@"text"];
        self.parentCode = dictionary[@"parent_code"];
        NSArray *childrenArray = dictionary[@"children"];
        if (childrenArray) {
            NSMutableArray *tempArr = [NSMutableArray array];
            for (NSDictionary *childDict in childrenArray) {
                BRTextModel *child = [[BRTextModel alloc] initWithDictionary:childDict];
                [tempArr addObject:child];
            }
            self.children = [tempArr copy];
        }
    };return self;
}

/// 判断两个对象是否相等
/// @param object 目标对象
- (BOOL)isEqual:(id)object {
    // 1.对象的地址相同
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[BRTextModel class]]) {
        return NO;
    }
    
    BRTextModel *model = (BRTextModel *)object;
    if (!model) {
        return NO;
    }
    // 2.对象的类型相同，且对象的各个属性相等
    BOOL isSameCode = (!self.code && !model.code) || [self.code isEqualToString:model.code];
    BOOL isSameText = (!self.text && !model.text) || [self.text isEqualToString:model.text];
    
    return isSameCode && isSameText;
}

- (NSUInteger)hash {
    return [self.code hash] ^ [self.text hash];
}


#pragma mark —— value
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

// value为nil，key不为nil的时候会调用
#pragma mark —— nilValueForKey
- (void)setNilValueForKey:(NSString *)key {
    
}

// 防止使用 valueForKey 获取值，key不存在时奔溃
- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
