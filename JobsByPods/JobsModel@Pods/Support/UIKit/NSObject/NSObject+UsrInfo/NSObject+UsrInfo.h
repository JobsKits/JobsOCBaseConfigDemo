//
//  NSObject+UsrInfo.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/15.
//

#ifndef NSObject_UsrInfo_h
#define NSObject_UsrInfo_h

#import <Foundation/Foundation.h>
#import <JobsModel/UserDefaultModel.h>
#import <JobsModel/NSMutableArray+Extra.h>
#import <JobsModel/NSUserDefaults+Manager.h>
#import <JobsModel/NSObject+SysInfo.h>
#import <JobsModel/NSObject+Extra.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UsrInfo)
#pragma mark —— 全局的用户数据(存、取、清)[全局唯一一份用户档案]
/// 登出清空用户数据 【用户信息】/【JobsUserModel】
-(jobsByVoidBlock _Nonnull)logOut;
/// 保存用户数据（用 NSUserDefaults ）【用户信息】/【JobsUserModel】
-(jobsByUserModelBlock _Nonnull)saveUserInfo;
/// 读取用户信息【用户信息】/【JobsUserModel】
-(JobsUserModel <NSCoding>*_Nullable)readUserInfo;
/// 保存用户数据
-(jobsByIDAndKeyBlock _Nonnull)jobsSaveUserInfo;
/// 读取用户信息
-(JobsRetIDByStrBlock _Nonnull)jobsReadUserInfo;
#pragma mark —— 保存特定的用户数据（不随登出清空数据）[全局多份用户档案]
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(jobsByUserModelBlock _Nonnull)userNameToSaveUserInfo;
///【通过特定的用户名】 读取用户的本地资料
-(JobsRetIDByClsAndSaltStrBlock _Nonnull)readUserInfoByUserName;
///【通过特定的用户名】 删除该用户的本地资料
-(jobsByStrBlock _Nonnull)deleteUserInfoByUserName;
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名组
-(jobsByStrBlock _Nonnull)saveUserName;
/// 读取用户名组
-(NSArray *_Nullable)readUserNameMutArr;
/// 全局删除已经登录成功的用户名
-(jobsByStrBlock _Nonnull)deleteUserName;

@end

NS_ASSUME_NONNULL_END

#endif /* NSObject_UsrInfo_h */
