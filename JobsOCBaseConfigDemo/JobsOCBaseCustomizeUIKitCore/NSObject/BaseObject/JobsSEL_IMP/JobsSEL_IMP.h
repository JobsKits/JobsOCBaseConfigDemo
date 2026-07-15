//
//  JobsSEL_IMP.h
//  JobsOCRuntimeKits
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSEL_IMP_CA1F82F29D
#define JOBS_HEADER_GUARD_JOBSSEL_IMP_CA1F82F29D

#pragma once

#import <Foundation/Foundation.h>
#import "JobsBaseProtocolHeader.h"

NS_ASSUME_NONNULL_BEGIN
/**
 
     SEL：就是一个字符串（Char*类型），表示方法的名字
     IMP：就是指向方法实现首地址的指针
     Method：是一个结构体，包含一个SEL表示方法名、一个IMP指向函数的实现地址、一个Char*表示函数的类型（包括返回值和参数类型）

     SEL、IMP、Method之间的关系可以这么理解：

     一个类（Class）持有一系列的方法（Method），在load类时，runtime会将所有方法的选择器（SEL）hash后映射到一个集合（NSSet）中（NSSet里的元素不能重复）
     当需要发消息时，会根据选择器（SEL）去查找方法；找到之后，用Method结构体里的函数指针（IMP）去调用方法。这样在运行时查找selecter的速度就会非常快
 */
@interface JobsSEL_IMP : NSObject <BaseProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSEL_IMP_CA1F82F29D */
