//
//  NSDateFormatter+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_NSDATEFORMATTER_DSL
#define JOBS_HEADER_GUARD_NSDATEFORMATTER_DSL

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
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
@interface NSDateFormatter (JobsChain)

+(JobsRetDateFormatterByVoidBlock _Nonnull)byDateFormatter;
+(JobsRetDateFormatterByStrBlock _Nonnull)byDateFormatterWithDateFormat;
-(JobsRetDateFormatterByStrBlock _Nonnull)byDateFormat;
-(JobsRetDateFormatterByLocaleBlock _Nonnull)byLocale;
-(JobsRetDateFormatterByTimeZoneBlock _Nonnull)byTimeZone;
-(JobsRetDateFormatterByCalendarBlock _Nonnull)byCalendar;
-(JobsRetDateFormatterByDateFormatterStyleBlock _Nonnull)byDateStyle;
-(JobsRetDateFormatterByDateFormatterStyleBlock _Nonnull)byTimeStyle;
-(JobsRetDateFormatterByDateFormatterBehaviorBlock _Nonnull)byFormatterBehavior;
-(JobsRetDateFormatterByBOOLBlock _Nonnull)byLenient;
-(JobsRetDateFormatterByStrBlock _Nonnull)bySetLocalizedDateFormatFromTemplate API_AVAILABLE(ios(8.0), watchos(2.0), tvos(9.0));
-(JobsRetStrByDateBlock _Nonnull)byStringFromDate;
-(JobsRetDateByStrBlock _Nonnull)byDateFromString;

@end
NS_ASSUME_NONNULL_END
#endif
