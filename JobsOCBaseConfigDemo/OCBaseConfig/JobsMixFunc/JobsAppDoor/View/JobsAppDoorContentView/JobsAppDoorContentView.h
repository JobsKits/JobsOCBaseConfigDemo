//
//  JobsAppDoorContentView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE
#define JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE

#import <UIKit/UIKit.h>
#import "JobsOCTools.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsLanMgr.h"
#import "JobsByOCPods.h"
#import "JobsMakes.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorContentView : BaseContentView

Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*loginDoorInputViewBaseStyleMutArr;
Prop_strong()NSMutableArray <JobsAppDoorInputViewBaseStyle *>*registerDoorInputViewBaseStyleMutArr;
Prop_strong()JobsAppDoorModel *appDoorModel;/// 网络请求的传入参数
/// 获取存储按钮
-(UIButton *)getStoreCodeBtn;
/// 去登录【外部调用】
-(void)animationToLogin;
/// 去注册【外部调用】
-(void)animationToRegister;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORCONTENTVIEW_5F125A14FE */
