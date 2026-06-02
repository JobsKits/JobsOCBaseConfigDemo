//
//  NSData+Extra.h
//  JobsDebug
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATA_EXTRA_1ABF2E15DC
#define JOBS_HEADER_GUARD_NSDATA_EXTRA_1ABF2E15DC

#pragma once

#import <Foundation/Foundation.h>
#import <JobsDebug/NSString+Extra.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Extra)

-(NSString *)stringByUTF8Encoding;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATA_EXTRA_1ABF2E15DC */
