//
//  JobsClockIconView.h
//  JobsImageRotation
//
//  Created by Jobs on 2026年7月29日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsImageRotation/JobsImageRotator.h>)
#import <JobsImageRotation/JobsImageRotator.h>
#else
#import "JobsImageRotator.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSTimeInterval const JobsClockIconViewDefaultInterval;

@interface JobsClockIconView : UIView

Prop_assign()JobsImageRotationDirection direction;
Prop_assign()NSTimeInterval interval;
Prop_assign(readonly,getter=isRunning)BOOL running;

-(instancetype)initWithDirection:(JobsImageRotationDirection)direction
                        interval:(NSTimeInterval)interval;
-(JobsRetIDByVoidBlock _Nonnull)start;
-(JobsRetIDByVoidBlock _Nonnull)pause;
-(JobsRetIDByVoidBlock _Nonnull)resume;
-(JobsRetIDByVoidBlock _Nonnull)jobsStop;
-(JobsRetIDByBOOLBlock _Nonnull)stopAndReset;

-(jobsByVoidBlock _Nonnull)jobsTintColorDidChange;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsClockIconView
-(JobsRetJobsClockIconViewByBOOLBlock _Nonnull)byHasStarted;
-(JobsRetJobsClockIconViewByBOOLBlock _Nonnull)byRunning;
-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byCenterDotLayer;
-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byDialLayer;
-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byHourHandLayer;
-(JobsRetJobsClockIconViewByCAShapeLayerBlock _Nonnull)byMinuteHandLayer;
-(JobsRetJobsClockIconViewByNSTimeIntervalBlock _Nonnull)byInterval;
-(JobsRetJobsClockIconViewByUIViewBlock _Nonnull)byMinuteHandContainerView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsClockIconView
@end

NS_ASSUME_NONNULL_END
