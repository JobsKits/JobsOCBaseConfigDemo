//
//  NSMutableArray+Extra.m
//  BRPickerViewExtra
//
//  Created by Jobs on 2026/5/13.
//

#import "NSMutableArray+Extra.h"

@implementation NSMutableArray (Extra)
/// 通过数组创建可变数组
+(JobsRetArrByArrBlock _Nonnull)initBy{
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable data){
        return [NSMutableArray arrayWithArray:data];
    };
}
/// 清除数组元素
-(jobsByVoidBlock _Nonnull)clean{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self removeAllObjects];
    };
}
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
/// 删除元素
-(JobsRetIDByIDBlock _Nonnull)remove{
    @jobs_weakify(self)
    return ^id (id _Nullable data) {
        @jobs_strongify(self)
        if(data){
            [self removeObject:data];
        }else JobsLog(@"数组被删除了一个空元素");
        return self;
    };
}
/// 批量追加数组元素
-(JobsRetIDByIDBlock _Nonnull)addBy{
    @jobs_weakify(self)
    return ^id (__kindof NSArray *data) {
        @jobs_strongify(self)
        if(data){
            [self addObjectsFromArray:data];
        }else JobsLog(@"数组被添加了一个空元素");
        return self;
    };
}

@end
