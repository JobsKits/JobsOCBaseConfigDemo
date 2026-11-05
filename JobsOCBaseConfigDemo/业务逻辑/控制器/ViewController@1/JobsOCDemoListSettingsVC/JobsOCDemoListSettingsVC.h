//
//  JobsOCDemoListSettingsVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCSplash/JobsOCSplash.h>)
#import <JobsOCSplash/JobsOCSplash.h>
#else
#import "JobsOCSplash.h"
#endif

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

typedef NS_ENUM(NSInteger, JobsOCDemoListCellTextDisplayStrategy) {
    JobsOCDemoListCellTextDisplayStrategyNormal = 0,
    JobsOCDemoListCellTextDisplayStrategyTailTruncation,
    JobsOCDemoListCellTextDisplayStrategyScaleToFit,
    JobsOCDemoListCellTextDisplayStrategyContinuous,
    JobsOCDemoListCellTextDisplayStrategyPingPong
};

FOUNDATION_EXPORT JobsOCDemoListCellTextDisplayStrategy JobsOCCurrentDemoListCellTextDisplayStrategy(void);
FOUNDATION_EXPORT void JobsOCSetDemoListCellTextDisplayStrategy(JobsOCDemoListCellTextDisplayStrategy strategy);

@interface JobsOCDemoListSettingsVC : BaseViewController <UITableViewDelegate, UITableViewDataSource>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCDemoListSettingsVC
-(JobsRetJobsOCDemoListSettingsVCByBOOLBlock _Nonnull)byShouldApplyAppEntryAfterReturning;
-(JobsRetJobsOCDemoListSettingsVCByNSMutableIndexSetBlock _Nonnull)byExpandedSettingSectionIndexSet;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCDemoListSettingsVC
@end

NS_ASSUME_NONNULL_END
