//
//  JobsMonitorVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05
#define JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05

#import <UIKit/UIKit.h>
#import "JobsBaseDataSettingVC.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMonitorVC : JobsBaseDataSettingVC

-(jobsByVoidBlock _Nonnull)语言切换的监听;
-(jobsByVoidBlock _Nonnull)设备方向的监听;

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSMONITORVC_7957808C05 */
