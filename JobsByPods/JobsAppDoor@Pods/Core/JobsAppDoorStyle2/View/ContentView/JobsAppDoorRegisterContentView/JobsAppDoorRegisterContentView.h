//
//  JobsAppDoorRegisterContentView.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <JobsAppDoor/JobsAppDoorConfig.h>
#import <JobsAppDoor/BaseContentView.h>
#import <JobsAppDoor/JobsAppDoorInputViewBaseStyle_1.h>
#import <JobsAppDoor/JobsAppDoorInputViewBaseStyle_3.h>
#import <JobsAppDoor/JobsAppDoorInputViewBaseStyle_4.h>
#import <JobsAppDoor/JobsAppDoorInputViewBaseStyle_7.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCTools/JobsOCTools.h>)
#import <JobsOCTools/JobsOCTools.h>
#else
#import "JobsOCTools.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 注册页
@interface JobsAppDoorRegisterContentView : BaseContentView
<
JobsDoorInputViewProtocol
,BaseViewProtocol
>

Prop_strong()JobsAppDoorConfig *configuration;
-(JobsRetJobsAppDoorRegisterContentViewByConfigBlock _Nonnull)byConfiguration;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorRegisterContentView
-(JobsRetJobsAppDoorRegisterContentViewByRACCompoundDisposableBlock _Nonnull)bySendBtnEnableDisposable;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorRegisterContentView
@end

NS_ASSUME_NONNULL_END
