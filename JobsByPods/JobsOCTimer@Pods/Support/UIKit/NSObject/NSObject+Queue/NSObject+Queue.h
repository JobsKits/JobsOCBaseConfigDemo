//
//  NSObject+Queue.h
//  JobsOCTimer
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_QUEUE_A0501DE36B
#define JOBS_HEADER_GUARD_NSOBJECT_QUEUE_A0501DE36B

#pragma once

#import <Foundation/Foundation.h>
#import <JobsOCTimer/NSString+Extra.h>
#import <JobsOCTimer/NSString+Toast.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
// https://www.jianshu.com/p/564b5da57ea1
@interface NSObject (Queue)
/// 用于：UI刷新（高频需求）
-(void)delayByMainQueue:(int64_t)time block:(jobsByVoidBlock)block;
/// 用于：重计算 / IO
-(void)delayByGlobalQueue:(int64_t)time block:(jobsByVoidBlock)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_QUEUE_A0501DE36B */
