//
//  SYSAlertControllerConfig+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_2F7D941951693EE3
#define JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_2F7D941951693EE3

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SYSAlertControllerConfig (DSL)

-(JobsRetSYSAlertControllerConfigByStrBlock _Nonnull)byTitle;
-(JobsRetSYSAlertControllerConfigByStrBlock _Nonnull)byMessage;
-(JobsRetSYSAlertControllerConfigByBOOLBlock _Nonnull)byIsSeparateStyle;
-(JobsRetSYSAlertControllerConfigByUIViewControllerPointerBlock _Nonnull)byTargetVC;
-(JobsRetSYSAlertControllerConfigByIDBlock _Nonnull)byFuncInWhere;
-(JobsRetSYSAlertControllerConfigByBOOLBlock _Nonnull)byAnimated;
-(JobsRetSYSAlertControllerConfigByUIControlPointerBlock _Nonnull)bySender;
-(JobsRetSYSAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byBtnTitleArr;
-(JobsRetSYSAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertBtnActionArr;
-(JobsRetSYSAlertControllerConfigByNSArrayPointerBlock _Nonnull)byParametersArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_2F7D941951693EE3 */
