//
//  JobsDeviceGuardDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsSwiftParityDemoBaseVC.h"

#if __has_include(<JobsOCDeviceGuard/JobsOCDeviceGuard.h>)
#import <JobsOCDeviceGuard/JobsOCDeviceGuard.h>
#else
#import "JobsOCDeviceGuard.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsDeviceGuardDemoVC : JobsSwiftParityDemoBaseVC

@end

NS_ASSUME_NONNULL_END
