//
//  JobsStatusBarSetttingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021
#define JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsMonitorVC.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsStatusBarSetttingVC : JobsMonitorVC<BaseViewControllerProtocol>

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021 */
