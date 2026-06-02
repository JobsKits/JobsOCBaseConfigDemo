//
//  NSMutableArray+Extra.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSMutableArray+Extra.h"

@implementation NSMutableArray (Extra)
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByIDBlock _Nonnull)add{
    @jobs_weakify(self)
    return ^NSMutableArray <__kindof NSObject *>*_Nullable(__kindof NSObject *_Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self addObject:data];// 向数组加入nil会崩
        }else JobsLog(@"数组被添加了一个空元素");
        return self;
    };
}

@end
