//
//  NSTimeZone+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_NSTIMEZONE_DSL
#define JOBS_HEADER_GUARD_NSTIMEZONE_DSL

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
@interface NSTimeZone (JobsChain)

+(JobsRetTimeZoneByVoidBlock _Nonnull)bySystemTimeZone;
+(JobsRetTimeZoneByVoidBlock _Nonnull)byLocalTimeZone;
+(JobsRetTimeZoneByVoidBlock _Nonnull)byDefaultTimeZone;
+(JobsRetTimeZoneByStrBlock _Nonnull)byTimeZoneWithName;
+(JobsRetTimeZoneByIntegerBlock _Nonnull)byTimeZoneForSecondsFromGMT;
-(JobsRetIntegerByDateBlock _Nonnull)bySecondsFromGMTForDate;

@end
NS_ASSUME_NONNULL_END
#endif
