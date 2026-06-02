//
//  JobsUserHeaderDataViewForHeaderInSection.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWFORHEADERINSECTION_B7133988F8
#define JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWFORHEADERINSECTION_B7133988F8

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/BaseTableViewHeaderFooterView.h>)
#import <JobsBaseUI/BaseTableViewHeaderFooterView.h>
#else
#import "BaseTableViewHeaderFooterView.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserHeaderDataViewForHeaderInSection : BaseTableViewHeaderFooterView

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWFORHEADERINSECTION_B7133988F8 */
