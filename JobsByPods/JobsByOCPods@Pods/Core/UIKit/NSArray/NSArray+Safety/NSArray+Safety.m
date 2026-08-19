//
//  NSArray+Safety.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+Safety.h"

@implementation NSArray (Safety)
/// "__NSArrayI" 表示不可变数组类型
/// "__NSArrayM" 表示可变数组类型
+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma mark —— 替换不可变数组中的方法 objectAtIndex
        [self exchangeMethodForClass:@"__NSArrayI"
                         originalSel:@selector(objectAtIndex:)
                         swizzledSel:@selector(safe_objectAtIndex:)];
#pragma mark —— 替换不可变数组中的方法 []调用的方法
        [self exchangeMethodForClass:@"__NSArrayI"
                         originalSel:@selector(objectAtIndexedSubscript:)
                         swizzledSel:@selector(safe_objectAtIndexedSubscript:)];
#pragma mark —— 替换可变数组中的方法 objectAtIndex
        [self exchangeMethodForClass:@"__NSArrayI"
                         originalSel:@selector(objectAtIndex:)
                         swizzledSel:@selector(safe_mutableObjectAtIndex:)];
#pragma mark —— 替换可变数组中的方法 []调用的方法
        [self exchangeMethodForClass:@"__NSArrayI"
                         originalSel:@selector(objectAtIndexedSubscript:)
                         swizzledSel:@selector(safe_mutableObjectAtIndexedSubscript:)];
    });
}

-(id)safe_objectAtIndex:(NSUInteger)index{
    JobsRetIDByUIntegerBlock action = ((JobsRetIDByUIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsSafe_objectAtIndex)))(self, @selector(jobsSafe_objectAtIndex));
    return action ? action(index) : nil;
}

-(JobsRetIDByUIntegerBlock _Nonnull)jobsSafe_objectAtIndex{
    @jobs_weakify(self)
    return ^id(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        if (index < self.count && self.count > 0) {
            @try {
                return [self safe_objectAtIndex:index];
            } @catch (NSException *exception) {
                JobsLog(@"不可变数组越界访问");
                return nil;
            }
        }JobsLog(@"不可变数组为空或越界访问");
        return nil;
    };
}

-(id)safe_objectAtIndexedSubscript:(NSUInteger)index {
    JobsRetIDByUIntegerBlock action = ((JobsRetIDByUIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsSafe_objectAtIndexedSubscript)))(self, @selector(jobsSafe_objectAtIndexedSubscript));
    return action ? action(index) : nil;
}

-(JobsRetIDByUIntegerBlock _Nonnull)jobsSafe_objectAtIndexedSubscript{
    @jobs_weakify(self)
    return ^id(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        if (index < self.count && self.count > 0) {
            @try {
                return [self safe_objectAtIndexedSubscript:index];
            } @catch (NSException *exception) {
                JobsLog(@"不可变数组越界访问");
                return nil;
            }
        }JobsLog(@"不可变数组为空或越界访问");
        return nil;
    };
}

- (id)safe_mutableObjectAtIndex:(NSUInteger)index {
    JobsRetIDByUIntegerBlock action = ((JobsRetIDByUIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsSafe_mutableObjectAtIndex)))(self, @selector(jobsSafe_mutableObjectAtIndex));
    return action ? action(index) : nil;
}

-(JobsRetIDByUIntegerBlock _Nonnull)jobsSafe_mutableObjectAtIndex{
    @jobs_weakify(self)
    return ^id(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        if (index < self.count && self.count > 0) {
            @try {
                return [self safe_mutableObjectAtIndex:index];
            } @catch (NSException *exception) {
                JobsLog(@"可变数组越界访问");
                return nil;
            }
        }JobsLog(@"可变数组为空或越界访问");
        return nil;
    };
}

-(id)safe_mutableObjectAtIndexedSubscript:(NSUInteger)index{
    JobsRetIDByUIntegerBlock action = ((JobsRetIDByUIntegerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSArray.class, @selector(jobsSafe_mutableObjectAtIndexedSubscript)))(self, @selector(jobsSafe_mutableObjectAtIndexedSubscript));
    return action ? action(index) : nil;
}

-(JobsRetIDByUIntegerBlock _Nonnull)jobsSafe_mutableObjectAtIndexedSubscript{
    @jobs_weakify(self)
    return ^id(NSUInteger index){
        @jobs_strongify(self)
        if (!self) return nil;
        if (index < self.count && self.count > 0) {
            @try {
                return [self safe_mutableObjectAtIndexedSubscript:index];
            } @catch (NSException *exception) {
                JobsLog(@"可变数组越界访问");
                return nil;
            }
        }JobsLog(@"可变数组为空或越界访问");
        return nil;
    };
}

@end
