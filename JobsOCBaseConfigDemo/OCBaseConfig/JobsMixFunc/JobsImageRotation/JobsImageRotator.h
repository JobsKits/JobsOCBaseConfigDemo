//
//  JobsImageRotator.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import <math.h>
#import <UIKit/UIKit.h>
#import "JobsTimer.h"
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

-(instancetype)start;
-(instancetype)pause;
-(instancetype)resume;
-(instancetype)stop;
-(instancetype)stopAndReset:(BOOL)reset;

@end

NS_ASSUME_NONNULL_END
