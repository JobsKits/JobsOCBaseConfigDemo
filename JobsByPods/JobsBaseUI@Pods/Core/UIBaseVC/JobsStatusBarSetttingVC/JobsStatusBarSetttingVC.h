//
//  JobsStatusBarSetttingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021
#define JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021

#import <UIKit/UIKit.h>
#import <JobsBaseUI/JobsMonitorVC.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsStatusBarSetttingVC : JobsMonitorVC<BaseViewControllerProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSTATUSBARSETTTINGVC_09C08F4021 */
