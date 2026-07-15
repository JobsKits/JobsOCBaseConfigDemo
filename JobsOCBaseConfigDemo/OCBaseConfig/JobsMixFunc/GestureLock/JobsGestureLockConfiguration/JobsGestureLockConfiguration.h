//
//  JobsGestureLockConfiguration.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

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

+(instancetype)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
