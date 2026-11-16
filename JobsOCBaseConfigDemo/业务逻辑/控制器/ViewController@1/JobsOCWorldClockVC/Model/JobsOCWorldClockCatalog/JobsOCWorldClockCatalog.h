//
//  JobsOCWorldClockCatalog.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCWorldClockCatalog : NSObject

+(NSDictionary<NSString *, id> *)snapshotForDate:(NSDate *)date
                               currentTimeZone:(NSTimeZone *)currentTimeZone;
+(NSString *)timeForDate:(NSDate *)date
               timeZone:(NSTimeZone *)timeZone
            uses12Hours:(BOOL)uses12Hours;

@end

NS_ASSUME_NONNULL_END
