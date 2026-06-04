//
//  JobsLaunchVC.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSLAUNCHVC_C72BEE7A38
#define JOBS_HEADER_GUARD_JOBSLAUNCHVC_C72BEE7A38

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

NS_ASSUME_NONNULL_BEGIN
/// 系统的启动页因为版本升级兼容度降低的问题，现在为了统一处理，即摒弃系统设置
/// 本页是对系统提供的Api接口LaunchScreen.storyboard的一个平替处理方案
/// 可以在这个基础上进行拓展：网络图文、倒计时按钮触发等一系列功能
@interface JobsLaunchVC : BaseViewController

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSLAUNCHVC_C72BEE7A38 */
