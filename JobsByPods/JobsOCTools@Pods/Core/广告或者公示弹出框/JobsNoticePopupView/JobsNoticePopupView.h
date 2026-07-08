//
//  JobsNoticePopupView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNOTICEPOPUPVIEW_8242178238
#define JOBS_HEADER_GUARD_JOBSNOTICEPOPUPVIEW_8242178238

#import <UIKit/UIKit.h>

#if __has_include(<TFPopupExtra/TFPopupExtra.h>)
#import <TFPopupExtra/TFPopupExtra.h>
#else
#import "TFPopupExtra.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

@interface JobsNoticePopupView : UIView

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSNOTICEPOPUPVIEW_8242178238 */
