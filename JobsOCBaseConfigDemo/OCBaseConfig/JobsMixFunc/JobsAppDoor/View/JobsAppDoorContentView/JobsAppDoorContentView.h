//
//  JobsAppDoorContentView.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE
#define JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE

#import <UIKit/UIKit.h>
#import "JobsOCTools.h"
#import "BaseContentView.h"
#import "JobsAppDoorConfig.h"
#import "JobsAppDoorInputViewBaseStyle.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import "JobsBaseProtocolHeader.h"
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import "JobsLanMgr.h"
#else
#import "JobsLanMgr.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorContentView : BaseContentView

Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;
Prop_strong()JobsAppDoorModel *appDoorModel;/// 网络请求的传入参数
Prop_strong()JobsAppDoorConfig *configuration;
/// 获取存储按钮
-(UIButton *)getStoreCodeBtn;
/// 去登录【外部调用】
-(void)animationToLogin;
/// 去注册【外部调用】
-(void)animationToRegister;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE */
