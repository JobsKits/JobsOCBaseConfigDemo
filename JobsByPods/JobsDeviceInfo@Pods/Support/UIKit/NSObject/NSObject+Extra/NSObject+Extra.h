//
//  NSObject+Extra.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_574DCC8FA4
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_574DCC8FA4

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)
/// NSBundle
+(NSBundle *)mainBundle;
+(JobsRetNSBundleByVoidBlock _Nonnull)jobsMainBundle;
/// NSLocale
+(NSLocale *)currentLocale;
+(JobsRetNSLocaleByVoidBlock _Nonnull)jobsCurrentLocale;
/// UIDevice
+(UIDevice *)currentDevice;
+(JobsRetUIDeviceByVoidBlock _Nonnull)jobsCurrentDevice;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_574DCC8FA4 */
