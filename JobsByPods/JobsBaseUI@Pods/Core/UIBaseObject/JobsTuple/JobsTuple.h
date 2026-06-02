//
//  JobsTuple.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTUPLE_C2BFCFE0A9
#define JOBS_HEADER_GUARD_JOBSTUPLE_C2BFCFE0A9

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 用Objective-C仿写Swift中的元祖
@interface JobsTuple : NSObject
/// 禁止使用系统的 alloc.init 和 new方法来进行创建对象
+(instancetype)new NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;
/// 强制用户使用-(instancetype)initWithValues:(id)firstValue, ... 来进行创建对象
-(instancetype)initWithValues:(id)firstValue, ... NS_REQUIRES_NIL_TERMINATION;

-(NSArray *)jobsTupleValueArr;

@end

NS_ASSUME_NONNULL_END
/**
 
     使用示例:

     // 创建元组
     JobsTuple *myTuple = [JobsTuple.alloc initWithValues:@"Hello", @42, @3.14, @"World", nil];
     // 访问元组的值
     myTuple.jobsTupleValueArr;

     这样做的意义：
     当我们一个方法需要返回多组不同类型的值，我们可以建立一个Model，但是Model会固定这些值的个数和类型，所以用此类来解决问题
 */
#endif /* JOBS_HEADER_GUARD_JOBSTUPLE_C2BFCFE0A9 */
