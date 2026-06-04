//
//  SPAlertControllerConfig+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_3AEDC79A6BB7A081
#define JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_3AEDC79A6BB7A081

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

@interface SPAlertControllerConfig (DSL)

-(JobsRetSPAlertControllerConfigByNSObject_SPAlertControllerInitTypeBlock _Nonnull)bySPAlertControllerInitType;
-(JobsRetSPAlertControllerConfigByStrBlock _Nonnull)byTitle;
-(JobsRetSPAlertControllerConfigByStrBlock _Nonnull)byMessage;
-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomAlertView;
-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomHeaderView;
-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomActionSequenceView;
-(JobsRetSPAlertControllerConfigByUIViewControllerPointerBlock _Nonnull)byTargetVC;
-(JobsRetSPAlertControllerConfigByIDBlock _Nonnull)byFuncInWhere;
-(JobsRetSPAlertControllerConfigByBOOLBlock _Nonnull)byAnimated;
-(JobsRetSPAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertActionTitleArr;
-(JobsRetSPAlertControllerConfigByNSArrayNSNumberPointerPointerBlock _Nonnull)byAlertActionStyleArr;
-(JobsRetSPAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertBtnActionArr;
-(JobsRetSPAlertControllerConfigByNSArrayNSMutableArrayPointerPointerBlock _Nonnull)byParametersArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SPALERTCONTROLLERCONFIG_DSL_3AEDC79A6BB7A081 */
