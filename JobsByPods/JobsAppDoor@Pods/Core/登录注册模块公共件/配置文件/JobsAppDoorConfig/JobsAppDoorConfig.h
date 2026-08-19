//
//  JobsAppDoorConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORCONFIG_BAEB9789D0
#define JOBS_HEADER_GUARD_JOBSAPPDOORCONFIG_BAEB9789D0

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsAppDoor/JobsAppDoorResource.h>)
#import <JobsAppDoor/JobsAppDoorResource.h>
#else
#import "JobsAppDoorResource.h"
#endif

#if __has_include(<JobsAppDoor/JobsAppDoorRegisterConfig.h>)
#import <JobsAppDoor/JobsAppDoorRegisterConfig.h>
#else
#import "JobsAppDoorRegisterConfig.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorConfig : NSObject
<
NSCopying
>

Prop_assign()JobsAppDoorBgType backgroundType;
Prop_strong()JobsAppDoorRegisterConfig *registerConfig;
Prop_copy()NSString *backgroundImageName;
Prop_copy()NSString *notchVideoResourceName;
Prop_copy()NSString *compactVideoResourceName;

+(JobsRetIDByVoidBlock _Nonnull)defaultConfig;
+(JobsRetIDByVoidBlock _Nonnull)fullConfig;
-(JobsRetNSUIntegerByVoidBlock _Nonnull)registerFieldCount;
-(JobsRetCGFloatByVoidBlock _Nonnull)registerContentHeight;
-(JobsRetCGFloatByVoidBlock _Nonnull)registerContentY;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorConfig
-(JobsRetJobsAppDoorConfigByJobsAppDoorBgTypeBlock _Nonnull)byBackgroundType;
-(JobsRetJobsAppDoorConfigByJobsAppDoorRegisterConfigBlock _Nonnull)byRegisterConfig;
-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byBackgroundImageName;
-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byCompactVideoResourceName;
-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byNotchVideoResourceName;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorConfig
@end

#define Cor1 JobsBlackColor.colorWithAlphaComponentBy(0.9007f)
#define Cor2 JobsBlackColor.colorWithAlphaComponentBy(0.5984f)
#define Cor3 JobsWhiteColor.colorWithAlphaComponentBy(0.9007f)
#define Cor4 HEXCOLOR(0xE1CD62)
#define Cor5 HEXCOLOR(0x502600)

#define ThingsHeight JobsWidth(50)
#define RegisterBtnWidth JobsWidth(64)
#define InputViewOffset JobsWidth(20)

/// 页面1：登录
#define JobsAppDoorContentViewLoginX JobsWidth(20)
#define JobsAppDoorContentViewLoginY JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 4 : 5)
#define JobsAppDoorContentViewLoginWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewLoginX * 2
#define JobsAppDoorContentViewLoginHeight JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 2.3 : 2.0)
/// 页面2：注册，真实高度和 Y 由 JobsAppDoorConfig 按字段数计算
#define JobsAppDoorContentViewRegisterX JobsWidth(20)
#define JobsAppDoorContentViewRegisterWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewRegisterX * 2
/// 页面3：忘记密码
#define JobsAppDoorContentViewFindPasswordX JobsWidth(20)
#define JobsAppDoorContentViewFindPasswordY JobsMainScreen_HEIGHT() / 4
#define JobsAppDoorContentViewFindPasswordWidth JobsMainScreen_WIDTH() - JobsAppDoorContentViewFindPasswordX * 2
#define JobsAppDoorContentViewFindPasswordHeight JobsMainScreen_HEIGHT() / (isiPhoneX_series() ? 1.6 : 1.3)

#define Title1 @"返回登录".jobsTr().addNewlines()
#define Title2 @"新用户注册".jobsTr().addNewlines()
#define Title3 @"忘记密码".jobsTr()
#define Title4 @"返回首页".jobsTr()
#define Title5 @"记住我".jobsTr()
#define Title6 @"注册".jobsTr()
#define Title7 @"登录".jobsTr()
#define Title8 [NSString stringWithFormat:@"%@\n%@",@"在线客服".jobsTr(),@"7×24小时".jobsTr()]
#define Title9 @"获取验证码".jobsTr()
#define Title10 @"您也可以通过以下方式联系客服".jobsTr()
#define Title11 @"以后".jobsTr()
#define Title12 @"去注册".jobsTr().addNewlines()

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORCONFIG_BAEB9789D0 */
