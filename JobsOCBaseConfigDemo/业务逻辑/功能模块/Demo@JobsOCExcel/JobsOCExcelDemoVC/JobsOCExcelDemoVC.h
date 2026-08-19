//
//  JobsOCExcelDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import <UIKit/UIKit.h>

#import "JobsOCExcelDemoCell.h"

#if __has_include(<FDFullscreenPopGesture/FDFullscreenPopGesture.h>)
#import <FDFullscreenPopGesture/FDFullscreenPopGesture.h>
#else
#import "FDFullscreenPopGesture.h"
#endif

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface JobsOCExcelDemoVC : BaseViewController
<
UITableViewDataSource
,UITableViewDelegate
,JobsOCExcelViewDelegate
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCExcelDemoVC
-(JobsRetJobsOCExcelDemoVCByCGFloatBlock _Nonnull)byFd_interactivePopMaxAllowedInitialDistanceToLeftEdge;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCExcelDemoVC
@end

NS_ASSUME_NONNULL_END
