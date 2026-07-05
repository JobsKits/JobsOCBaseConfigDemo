//
//  NSMutableDictionary+Ordered.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_ORDERED_D69F3AE72C
#define JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_ORDERED_D69F3AE72C

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
    因为是对setObject:forKey:、removeObjectForKey:、removeAllObjects、removeObjectsForKeys:
    所以在调用结果集的前提条件是需要对目标数组进行上述条件的操作
    特别的，比如MJExtension，模型转字典，因为没有调用上述相关方法，所以结果集会失败
 */
@interface NSMutableDictionary (Ordered)

Prop_copy(readonly, nullable)NSMutableArray *keys;
//获取给定index的对象
-(id)objectAtIndex:(NSUInteger)index;
//插入键值对至给定index
-(void)insertObject:(id)anObject
             forKey:(id<NSCopying>)aKey
            atIndex:(NSUInteger)index;
//插入键值对至给定index
-(void)removeLastObject;
//移除最后一个键值对
-(void)removeObjectAtIndex:(NSUInteger)index;
//移除给定index的键值对
-(void)replaceObjectAtIndex:(NSUInteger)index
                 withObject:(id)anObject;
//插入键值对至给定indexes
-(void)insertObjects:(NSArray<id> *)objects
                keys:(NSArray<id <NSCopying>> *)keys
           atIndexes:(NSIndexSet *)indexes;
//移除给定indexes的键值对
-(void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
//替换给定indexes的值
-(void)replaceObjectsAtIndexes:(NSIndexSet *)indexes
                   withObjects:(NSArray<id> *)objects;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSMUTABLEDICTIONARY_ORDERED_D69F3AE72C */
