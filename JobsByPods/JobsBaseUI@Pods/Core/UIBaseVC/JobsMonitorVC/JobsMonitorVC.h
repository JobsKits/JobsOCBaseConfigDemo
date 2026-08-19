//
//  JobsMonitorVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05
#define JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05

#import <UIKit/UIKit.h>
#import <JobsBaseUI/JobsBaseDataSettingVC.h>

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

@interface JobsMonitorVC : JobsBaseDataSettingVC

-(jobsByVoidBlock _Nonnull)语言切换的监听;
-(jobsByVoidBlock _Nonnull)设备方向的监听;

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05 */
