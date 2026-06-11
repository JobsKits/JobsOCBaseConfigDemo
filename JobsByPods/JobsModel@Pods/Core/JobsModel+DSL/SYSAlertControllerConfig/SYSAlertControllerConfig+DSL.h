//
//  SYSAlertControllerConfig+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_7A7897F297F1ACF7
#define JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_7A7897F297F1ACF7

#if __has_include(<JobsModel/SYSAlertControllerConfig.h>)
#import <JobsModel/SYSAlertControllerConfig.h>
#else
#import "SYSAlertControllerConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface SYSAlertControllerConfig (DSL)

#pragma mark —— 来自 SYSAlertControllerConfig
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byTitle;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byMessage;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byIsSeparateStyle;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(UIViewController * data))byTargetVC;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(id data))byFuncInWhere;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byAnimated;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(UIControl * data))bySender;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString*> * data))byBtnTitleArr;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString*> * data))byAlertBtnActionArr;
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray * data))byParametersArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_SYSALERTCONTROLLERCONFIG_DSL_7A7897F297F1ACF7 */
