//
//  NSDateFormatter+DSL.h
//  JobsOCBaseConfigDemo
//
#ifndef JOBS_HEADER_GUARD_NSDATEFORMATTER_DSL
#define JOBS_HEADER_GUARD_NSDATEFORMATTER_DSL

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

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
-(JobsRetStrByDateBlock _Nonnull)byStringFromDate;
-(JobsRetDateByStrBlock _Nonnull)byDateFromString;

@end
NS_ASSUME_NONNULL_END
#endif
