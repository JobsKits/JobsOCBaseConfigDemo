//
//  JobsImageRotator.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import <math.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import "JobsTimer.h"
#import "JobsOCDSL.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSTimeInterval const JobsImageRotationDefaultInterval;

typedef NS_ENUM(NSInteger, JobsImageRotationDirection) {
    JobsImageRotationDirectionClockwise = 0,
    JobsImageRotationDirectionCounterclockwise
};

@interface JobsImageRotator : NSObject

Prop_assign()JobsImageRotationDirection direction;
Prop_assign()NSTimeInterval interval;

-(instancetype)initWithTargetView:(UIView *)targetView;
-(instancetype)initWithTargetView:(UIView *)targetView
                        direction:(JobsImageRotationDirection)direction
                         interval:(NSTimeInterval)interval NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

-(JobsRetIDByVoidBlock _Nonnull)start;
-(JobsRetIDByVoidBlock _Nonnull)pause;
-(JobsRetIDByVoidBlock _Nonnull)resume;
-(JobsRetIDByVoidBlock _Nonnull)jobsStop;
-(JobsRetIDByBOOLBlock _Nonnull)stopAndReset;
-(JobsRetJobsImageRotatorByDirectionBlock _Nonnull)byDirection;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsImageRotator
-(JobsRetJobsImageRotatorByCGFloatBlock _Nonnull)byCurrentAngle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsImageRotator
@end

NS_ASSUME_NONNULL_END
