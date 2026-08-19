//
//  UISegmentedControl+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UISEGMENTEDCONTROL_DSL_97A3C5D821
#define JOBS_HEADER_GUARD_UISEGMENTEDCONTROL_DSL_97A3C5D821

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

@interface UISegmentedControl (DSL)

-(JobsRetNSIntegerByVoidBlock _Nonnull)jobs_selectedSegmentIndex;
-(JobsRetSegmentedControlByNSIntegerBlock _Nonnull)bySelectedSegmentIndex;
-(JobsRetSegmentedControlByBOOLBlock _Nonnull)byMomentary;
-(JobsRetSegmentedControlByBOOLBlock _Nonnull)byApportionsSegmentWidthsByContent;
-(JobsRetSegmentedControlByColorBlock _Nonnull)bySelectedSegmentTintColor API_AVAILABLE(ios(13.0));
-(JobsRetSegmentedControlByVoidBlock _Nonnull)byRemoveAllSegments;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISEGMENTEDCONTROL_DSL_97A3C5D821 */
