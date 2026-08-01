//
//  JobsClockIconView.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsImageRotation/JobsImageRotator.h>)
#import <JobsImageRotation/JobsImageRotator.h>
#else
#import "JobsImageRotator.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSTimeInterval const JobsClockIconViewDefaultInterval;

@interface JobsClockIconView : UIView

Prop_assign()JobsImageRotationDirection direction;
Prop_assign()NSTimeInterval interval;
Prop_assign(readonly,getter=isRunning)BOOL running;

-(instancetype)initWithDirection:(JobsImageRotationDirection)direction
                        interval:(NSTimeInterval)interval;
-(instancetype)start;
-(instancetype)pause;
-(instancetype)resume;
-(instancetype)stop;
-(instancetype)stopAndReset:(BOOL)reset;

@end

NS_ASSUME_NONNULL_END
