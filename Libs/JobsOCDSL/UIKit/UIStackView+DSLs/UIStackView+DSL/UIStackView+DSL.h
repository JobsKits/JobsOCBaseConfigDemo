//
//  UIStackView+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_UISTACKVIEW_DSL_6B2F4E917A
#define JOBS_HEADER_GUARD_UISTACKVIEW_DSL_6B2F4E917A

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

@interface UIStackView (DSL)

-(JobsRetStackViewByAxisBlock _Nonnull)byAxis;
-(JobsRetStackViewByDistributionBlock _Nonnull)byDistribution;
-(JobsRetStackViewByAlignmentBlock _Nonnull)byAlignment;
-(JobsRetStackViewByCGFloatBlock _Nonnull)bySpacing;
-(JobsRetStackViewByBOOLBlock _Nonnull)byBaselineRelativeArrangement;
-(JobsRetStackViewByBOOLBlock _Nonnull)byLayoutMarginsRelativeArrangement;
-(JobsRetStackViewByViewBlock _Nonnull)byAddArrangedSubview;
-(JobsRetStackViewByViewBlock _Nonnull)byRemoveArrangedSubview;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UISTACKVIEW_DSL_6B2F4E917A */
