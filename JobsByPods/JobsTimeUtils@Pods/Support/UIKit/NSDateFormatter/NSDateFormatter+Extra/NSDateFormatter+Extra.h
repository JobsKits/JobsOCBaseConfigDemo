//
//  NSDateFormatter+Extra.h
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATEFORMATTER_EXTRA_E77A025E48
#define JOBS_HEADER_GUARD_NSDATEFORMATTER_EXTRA_E77A025E48

#pragma once

#import <Foundation/Foundation.h>

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

@interface NSDateFormatter (Extra)
/// 链式设置时区；基础实现下沉到 JobsTimeUtils，避免 JobsTimeUtils 反向依赖 JobsOCDSL
-(JobsRetDateFormatterByTimeZoneBlock _Nonnull)byTimeZone;
/// 对系统方法 stringFromDate 的二次封装
-(JobsRetStrByDateBlock _Nonnull)stringByDate;
/// 对系统方法 dateFromString 的二次封装
-(JobsRetDateByStrBlock _Nonnull)dateByString;

@end

NS_ASSUME_NONNULL_END

//NS_INLINE __kindof NSDateFormatter *_Nonnull jobsMakeDateFormatter(jobsByLabelBlock _Nonnull block){
//    NSDateFormatter *data = NSDateFormatter.alloc.init;
//    if (block) block(data);
//    return data;
//}
#endif /* JOBS_HEADER_GUARD_NSDATEFORMATTER_EXTRA_E77A025E48 */
