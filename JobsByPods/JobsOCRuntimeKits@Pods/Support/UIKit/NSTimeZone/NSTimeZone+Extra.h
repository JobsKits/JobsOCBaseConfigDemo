//
//  NSTimeZone+Extra.h
//  JobsOCRuntimeKits
//
//  Created by Admin on 5/12/2024.
//

#ifndef JOBS_HEADER_GUARD_NSTIMEZONE_EXTRA_8B339641CF
#define JOBS_HEADER_GUARD_NSTIMEZONE_EXTRA_8B339641CF

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

@interface NSTimeZone (Extra)
/// 对系统方法 timeZoneWithName 的二次封装
+(JobsRetTimeZoneByStrBlock _Nonnull)initByName;
/// 对系统方法 timeZoneWithAbbreviation 的二次封装
+(JobsRetTimeZoneByStrBlock _Nonnull)initByAbbreviation;
/// 对系统方法 timeZoneForSecondsFromGMT 的二次封装
+(JobsRetTimeZoneByIntegerBlock _Nonnull)initByGMTSecs;
/// 对系统方法 secondsFromGMTForDate 的二次封装
-(JobsRetIntegerByDateBlock _Nonnull)GMTDateSecs;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSTIMEZONE_EXTRA_8B339641CF */
