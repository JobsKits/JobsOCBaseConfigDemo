//
//  NSArray+Extra.m
//  WHToastExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+Extra.h"

@implementation NSArray (Extra)
/// 数组取值（无法关联数组的泛型）
-(JobsRetIDByUIntegerBlock _Nonnull)objectAt{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        return [self objectAtIndex:data];
    };
}
/// 数组取下标
-(JobsRetNSUIntegerByIDBlock _Nonnull)indexBy{
    @jobs_weakify(self)
    return ^NSUInteger(id _Nullable data){
        @jobs_strongify(self)
        return [self indexOfObject:data];
    };
}
/// 数组里面是否包含某个元素
-(JobsRetBOOLByIDBlock _Nonnull)containsObject{
    @jobs_weakify(self)
    return ^BOOL(id _Nullable data) {
        @jobs_strongify(self)
        if(!data) return NO;
        return [self containsObject:data];
    };
}
/// 数组转字符串
-(NSString *_Nonnull)string{
    if(!self ||self.count == 0) return @"";
    NSMutableString *str = NSMutableString.string;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,
                                       BOOL *stop) {
        [str appendFormat:@"%@,",obj];
    }];
    /// 删除最后一个','
    NSString *strForRight = [str substringWithRange:NSMakeRange(0, str.length - 1)];
    return strForRight;
}
/// 数组比较
-(JobsRetBOOLByArrBlock _Nonnull)compareEqualArrElement{
    @jobs_weakify(self)
    return ^BOOL(NSArray *_Nullable array){
        @jobs_strongify(self)
        return [NSSet.initByArr(self) isEqualToSet:NSSet.initByArr(array)];
    };
}
/// 数组计算交集
-(JobsRetArrByArrBlock _Nonnull)arrayForIntersectionWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        if(self.count == 0) return nil;
        if(!otherArray) return nil;
        return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            for (id obj in self) {// 遍历
                if(!otherArray.containsObject(obj)) continue;
                data.add(obj);// 添加
            }
        });
    };
}
/// 数据计算差集
-(JobsRetArrByArrBlock _Nonnull)arrayForMinusWithOtherArray{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(__kindof NSArray *_Nullable otherArray){
        @jobs_strongify(self)
        if(!self) return nil;
        if(!otherArray) return self;
        return jobsMakeMutArr(^(NSMutableArray *array) {
            @jobs_strongify(self)
            [array addObjectsFromArray:self];
            for (id obj in otherArray) {
                if(!self.containsObject(obj)) continue;
                [array removeObject:obj];
            }
        });
    };
}

-(jobsByBOOLBlock _Nonnull)jobsVisible{
    @jobs_weakify(self)
    return ^(BOOL data){
        @jobs_strongify(self)
        for (UIView *view in self) {
            if(view.isKindOfClass(UIView.class)) view.jobsVisible = data;
        }
    };
}

-(JobsReturnArrByMasonryBlocks _Nonnull)installByMasonryBlock{
    @jobs_weakify(self)
    return ^__kindof NSArray *_Nullable(jobsByMASConstraintMakerBlock _Nonnull data){
        @jobs_strongify(self)
        [self mas_makeConstraints:data];
        return self;
    };
}
/// 转成可变数组
-(JobsRetMutableArrayByVoidBlock _Nonnull)mutableArr{
    @jobs_weakify(self)
    return ^__kindof NSMutableArray *_Nullable(void){
        @jobs_strongify(self)
        return [NSMutableArray arrayWithArray:self];
    };
}

@end
