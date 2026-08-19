//
//  JobsCommentPopUpView_viewForHeaderInSection.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsCommentConfig.h"
#import "JobsCommentModel.h"

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import <JobsLoadingImage/JobsLoadingImageHeader.h>
#else
#import "JobsLoadingImageHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCommentPopUpView_viewForHeaderInSection : BaseView

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCommentPopUpView_viewForHeaderInSection
-(JobsRetJobsCommentPopUpView_viewForHeaderInSectionByJobsFirstCommentModelBlock _Nonnull)byFirstCommentModel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCommentPopUpView_viewForHeaderInSection
@end

NS_ASSUME_NONNULL_END
