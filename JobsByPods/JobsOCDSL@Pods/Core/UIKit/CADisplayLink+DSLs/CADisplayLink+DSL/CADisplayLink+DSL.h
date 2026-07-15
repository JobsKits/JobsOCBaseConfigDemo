//
//  CADisplayLink+DSL.h
//  JobsOCDSL
//
#ifndef JOBS_HEADER_GUARD_CADISPLAYLINK_DSL
#define JOBS_HEADER_GUARD_CADISPLAYLINK_DSL

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

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
@interface CADisplayLink (JobsChain)

-(JobsRetCADisplayLinkByBOOLBlock _Nonnull)byPaused;
-(JobsRetCADisplayLinkByNSIntegerBlock _Nonnull)byFrameInterval API_DEPRECATED("preferredFramesPerSecond", ios(3.1, 10.0), tvos(9.0, 10.0)) API_UNAVAILABLE(macos, watchos);
-(JobsRetCADisplayLinkByNSIntegerBlock _Nonnull)byPreferredFramesPerSecond;
-(JobsRetCADisplayLinkByVoidBlock _Nonnull)byInvalidate;
#if defined(__IPHONE_15_0)
-(JobsRetCADisplayLinkByCAFrameRateRangeBlock _Nonnull)byPreferredFrameRateRange API_AVAILABLE(ios(15.0));
#endif

@end
NS_ASSUME_NONNULL_END
#endif
