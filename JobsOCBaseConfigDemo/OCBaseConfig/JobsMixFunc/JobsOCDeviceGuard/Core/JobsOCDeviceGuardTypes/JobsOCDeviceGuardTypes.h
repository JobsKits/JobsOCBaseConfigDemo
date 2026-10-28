//
//  JobsOCDeviceGuardTypes.h
//  JobsOCDeviceGuard
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsOCDeviceGuardCategory) {
    JobsOCDeviceGuardCategoryFileSystem,
    JobsOCDeviceGuardCategoryRuntime,
    JobsOCDeviceGuardCategorySandbox
};

typedef NS_ENUM(NSUInteger, JobsOCDeviceGuardCheckStatus) {
    JobsOCDeviceGuardCheckStatusPassed,
    JobsOCDeviceGuardCheckStatusDetected,
    JobsOCDeviceGuardCheckStatusSkipped,
    JobsOCDeviceGuardCheckStatusUnavailable
};

typedef NS_ENUM(NSUInteger, JobsOCDeviceGuardVerdict) {
    JobsOCDeviceGuardVerdictNoIndicators,
    JobsOCDeviceGuardVerdictSuspicious,
    JobsOCDeviceGuardVerdictJailbroken,
    JobsOCDeviceGuardVerdictIndeterminate,
    JobsOCDeviceGuardVerdictUnsupported
};

FOUNDATION_EXPORT NSString *JobsOCDeviceGuardCategoryName(JobsOCDeviceGuardCategory category);
FOUNDATION_EXPORT NSString *JobsOCDeviceGuardCheckStatusName(JobsOCDeviceGuardCheckStatus status);
FOUNDATION_EXPORT NSString *JobsOCDeviceGuardVerdictName(JobsOCDeviceGuardVerdict verdict);

NS_ASSUME_NONNULL_END
