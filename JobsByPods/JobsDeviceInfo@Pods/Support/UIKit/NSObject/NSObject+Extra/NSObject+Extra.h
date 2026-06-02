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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extra)
/// NSBundle
+(NSBundle *_Nullable)mainBundle;
/// NSLocale
+(NSLocale *_Nullable)currentLocale;
/// UIDevice
+(UIDevice *_Nullable)currentDevice;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_574DCC8FA4 */
