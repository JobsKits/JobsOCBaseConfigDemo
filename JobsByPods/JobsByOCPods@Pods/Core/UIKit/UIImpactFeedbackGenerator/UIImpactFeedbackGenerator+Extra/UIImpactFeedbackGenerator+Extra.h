//
//  UIImpactFeedbackGenerator+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_EXTRA_EC3A2EDA1E
#define JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_EXTRA_EC3A2EDA1E

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

@interface UIImpactFeedbackGenerator (Extra)

+(JobsRetImpactFeedbackGeneratorByNSIntegerBlock _Nonnull)initByStyle;
+(UIImpactFeedbackGenerator *_Nonnull)initByLightStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initLightStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByMediumStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initMediumStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByHeavyStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initHeavyStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initBySoftStyle API_AVAILABLE(ios(13.0));
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initSoftStyleBy;
+(UIImpactFeedbackGenerator *_Nonnull)initByRigidStyle;
+(JobsRetImpactFeedbackGeneratorByViewBlock _Nonnull)initRigidStyleBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIIMPACTFEEDBACKGENERATOR_EXTRA_EC3A2EDA1E */
