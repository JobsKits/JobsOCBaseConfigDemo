//
//  UIImpactFeedbackGenerator+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_DSL_20260611
#define JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_DSL_20260611

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

@interface UIImpactFeedbackGenerator (DSL)

-(JobsRetImpactFeedbackGeneratorByVoidBlock _Nonnull)byImpactOccurred;
#if defined(__IPHONE_17_5)
-(JobsRetImpactFeedbackGeneratorByCGPointBlock _Nonnull)byImpactOccurredAtLocation API_AVAILABLE(ios(17.5)) API_UNAVAILABLE(visionos);
#endif
#if defined(__IPHONE_13_0)
-(JobsRetImpactFeedbackGeneratorByCGFloatBlock _Nonnull)byImpactOccurredWithIntensity API_AVAILABLE(ios(13.0));
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_DSL_20260611 */
