//
//  NSKeyedArchiver+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSKEYEDARCHIVER_EXTRA_BBA206712F
#define JOBS_HEADER_GUARD_NSKEYEDARCHIVER_EXTRA_BBA206712F

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

@interface NSKeyedArchiver (Extra)

+(JobsRetDataByIDBlock _Nonnull)initByObject;
+(JobsRetDataByIDBlock _Nonnull)archivedDataByRootObject_NO;
+(JobsRetDataByIDBlock _Nonnull)archivedDataByRootObject_YES;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSKEYEDARCHIVER_EXTRA_BBA206712F */
