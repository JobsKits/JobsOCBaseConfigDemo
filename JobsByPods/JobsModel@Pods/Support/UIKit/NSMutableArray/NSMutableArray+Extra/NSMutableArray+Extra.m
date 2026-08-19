//
//  NSMutableArray+Extra.m
//  JobsModel
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
/// 阻止向可变数组添加空元素
-(JobsRetMutableArrayByArrBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^NSMutableArray <__kindof NSObject *>*_Nullable(__kindof NSArray *_Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self addObjectsFromArray:data];/// 向数组加入nil会崩
        }else JobsLog(@"数组被添加了一个空元素");
        return self;
    };
}
/// 删除元素
-(JobsRetIDByIDBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self removeObject:data];
        }else JobsLog(@"数组被删除了一个非空元素");
        return self;
    };
}

@end
