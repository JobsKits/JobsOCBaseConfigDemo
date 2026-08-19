//
//  JobsGestureLockConfiguration.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

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

#ifndef JOBS_GESTURE_LOCK_VALIDATION_RESULT_ENUM
#define JOBS_GESTURE_LOCK_VALIDATION_RESULT_ENUM
typedef NS_ENUM(NSUInteger, JobsGestureLockValidationResult) {
    JobsGestureLockValidationResultNone,
    JobsGestureLockValidationResultSuccess,
    JobsGestureLockValidationResultFailure,
    JobsGestureLockValidationResultTooShort
};
#endif

#ifndef JOBS_GESTURE_LOCK_MODE_ENUM
#define JOBS_GESTURE_LOCK_MODE_ENUM
typedef NS_ENUM(NSUInteger, JobsGestureLockMode) {
    JobsGestureLockModeCreate,
    JobsGestureLockModeValidate
};
#endif

@interface JobsGestureLockConfiguration : NSObject <NSCopying>

Prop_assign()NSUInteger minimumPatternLength;
Prop_assign()CGFloat lineWidth;
Prop_strong()UIColor *normalLineColor;
Prop_strong()UIColor *selectedLineColor;
Prop_strong()UIColor *errorLineColor;
Prop_strong()UIColor *statusTextColor;
Prop_strong()UIFont *statusFont;
Prop_copy()NSString *createStatusText;
Prop_copy()NSString *confirmStatusText;
Prop_copy()NSString *validateStatusText;
Prop_copy()NSString *tooShortStatusText;
Prop_copy()NSString *mismatchStatusText;
Prop_copy()NSString *errorFormat;
Prop_assign()NSInteger maxRetryCount;
Prop_strong(nullable)UIImage *nodeNormalImage;
Prop_strong(nullable)UIImage *nodeSelectedImage;
Prop_strong(nullable)UIImage *nodeErrorImage;
Prop_strong(nullable)UIImage *indicatorNormalImage;
Prop_strong(nullable)UIImage *indicatorSelectedImage;

+(JobsRetJobsGestureLockConfigurationByVoidBlock _Nonnull)defaultConfiguration;
-(JobsRetJobsGestureLockConfigurationByNSUIntegerBlock _Nonnull)byMinimumPatternLength;
-(JobsRetJobsGestureLockConfigurationByCGFloatBlock _Nonnull)byLineWidth;
-(JobsRetJobsGestureLockConfigurationByCorBlock _Nonnull)byNormalLineColor;
-(JobsRetJobsGestureLockConfigurationByCorBlock _Nonnull)bySelectedLineColor;
-(JobsRetJobsGestureLockConfigurationByCorBlock _Nonnull)byErrorLineColor;
-(JobsRetJobsGestureLockConfigurationByCorBlock _Nonnull)byStatusTextColor;
-(JobsRetJobsGestureLockConfigurationByFontBlock _Nonnull)byStatusFont;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byCreateStatusText;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byConfirmStatusText;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byValidateStatusText;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byTooShortStatusText;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byMismatchStatusText;
-(JobsRetJobsGestureLockConfigurationByStrBlock _Nonnull)byErrorFormat;
-(JobsRetJobsGestureLockConfigurationByNSIntegerBlock _Nonnull)byMaxRetryCount;
-(JobsRetJobsGestureLockConfigurationByImageBlock _Nonnull)byNodeNormalImage;
-(JobsRetJobsGestureLockConfigurationByImageBlock _Nonnull)byNodeSelectedImage;
-(JobsRetJobsGestureLockConfigurationByImageBlock _Nonnull)byNodeErrorImage;
-(JobsRetJobsGestureLockConfigurationByImageBlock _Nonnull)byIndicatorNormalImage;
-(JobsRetJobsGestureLockConfigurationByImageBlock _Nonnull)byIndicatorSelectedImage;

@end

NS_ASSUME_NONNULL_END
