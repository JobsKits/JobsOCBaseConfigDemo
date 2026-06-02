//
//  NSObject+UUID.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_UUID_013D0F4A01
#define JOBS_HEADER_GUARD_NSOBJECT_UUID_013D0F4A01

#import <Foundation/Foundation.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UUID)

-(NSString *)UUID;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_UUID_013D0F4A01 */
