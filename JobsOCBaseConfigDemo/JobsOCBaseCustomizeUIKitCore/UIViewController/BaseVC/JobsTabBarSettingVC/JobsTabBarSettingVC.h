//
//  JobsTabBarSettingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTABBARSETTINGVC_B2ADDCC22A
#define JOBS_HEADER_GUARD_JOBSTABBARSETTINGVC_B2ADDCC22A

#import "JobsNavSettingVC.h"

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

@interface JobsTabBarSettingVC : JobsNavSettingVC

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTABBARSETTINGVC_B2ADDCC22A */
