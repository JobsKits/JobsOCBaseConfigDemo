//
//  NSString+Conversion.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CONVERSION_3099D4D48D
#define JOBS_HEADER_GUARD_NSSTRING_CONVERSION_3099D4D48D

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Conversion)

+(JobsRetStrByDataBlock _Nonnull)initByUTF8Data;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CONVERSION_3099D4D48D */
