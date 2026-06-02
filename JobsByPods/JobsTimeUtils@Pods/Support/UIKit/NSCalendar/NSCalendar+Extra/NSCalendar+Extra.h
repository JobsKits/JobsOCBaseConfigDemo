//
//  NSCalendar+Extra.h
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSCALENDAR_EXTRA_2C750A2B16
#define JOBS_HEADER_GUARD_NSCALENDAR_EXTRA_2C750A2B16

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

@interface NSCalendar (Extra)
/// 对系统方法 calendarWithIdentifier 的二次封装
+(JobsRetCalendarByCalendarIdentifierBlock _Nonnull)initBy;
/// 对系统方法 dateFromComponents 的二次封装
-(JobsRetDateByDateComponentsBlock _Nonnull)dateByComponents;
/// 对系统方法 initWithCalendarIdentifier 的二次封装
+(JobsRetCalendarByCalendarIdentifierBlock _Nonnull)initByCalendarIdentifier;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSCALENDAR_EXTRA_2C750A2B16 */
