//
//  NSObject+UserInfo.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "NSUserDefaults+Manager.h"
#import "NSObject+MyAppTools.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface NSObject (UserInfo)
/**
 
 【鉴别目前是否登录】
 【标准】判定的标准 = 用户数据存在➕用户数据中Token的值非空➕Token过期时间存在➕Token是否已经过期
 【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin;
/// 判定是否登录的标准1：是否本地存在用户数据模型 + 是否存在Token
-(BOOL)isLoginByToken;
/// 判定是否登录的标准2
/// 登录是否过期：没有过期时间 ===  已经过期
-(JobsRetBOOLByStrBlock _Nonnull)isLoginByExpiredTime;
/// 检查是否登录并执行传入的代码块
-(void)isLogin:(jobsByVoidBlock _Nullable)loginedinBlock;
/// 刷新用户Token
-(jobsByVoidBlock _Nonnull)refreshUserToken;
/// 刷新用户Token（仅删除本地的用户数据）
-(jobsByVoidBlock _Nonnull)refreshUserToken2;

@end

NS_ASSUME_NONNULL_END
/**
 
     #pragma mark —— 存取用户信息Demo
     -(void)saveAndReadUserInfoDemo{
         JobsAppDoorVC *userModel = JobsAppDoorVC.new;
         userModel.token = @"12345";
         userModel.uid = @"54321";

         self.saveUserInfo(userModel);
         JobsLog(@"");
         JobsAppDoorVC *f = self.readUserInfo;
         JobsLog(@"");
     }
 */
