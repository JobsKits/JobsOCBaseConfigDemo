//
//  JobsAppDoorLoginContentView.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "BaseContentView.h"
#import "JobsAppDoorInputViewBaseStyle_3.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import "JobsBaseProtocolHeader.h"
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import "JobsMakes.h"
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCTools/JobsOCTools.h>)
#import "JobsOCTools.h"
#else
#import "JobsOCTools.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import "JobsModelDSL.h"
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 登录页
@interface JobsAppDoorLoginContentView : BaseContentView
<
JobsDoorInputViewProtocol
,BaseViewProtocol
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorLoginContentView
-(JobsRetJobsAppDoorLoginContentViewByRACCompoundDisposableBlock _Nonnull)bySendBtnEnableDisposable;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorLoginContentView
@end

NS_ASSUME_NONNULL_END
