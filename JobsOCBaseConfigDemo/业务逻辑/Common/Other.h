//
//  Other.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef Other_h

#if __has_include(<JobsAppDoor/JobsAppDoor.h>)
#import <JobsAppDoor/JobsAppDoor.h>
#else
#import "JobsAppDoor.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

#define Other_h

#import "JobsTabBarVC.h"
#import "JobsNoticePopupView.h"
#import "AppDelegate.h"
#import "NSObject+UserInfo.h"
#import "NSObject+MyAppTools.h"
#import "ViewController@1.h"
#import "ViewController@2.h"
#import "ViewController@3.h"
#import "ViewController@4.h"
#import "ViewController@5.h"
#import "JobsOCBaseConfigPopupViewHeader.h" // 本App相关的自定义弹出框

/// App 的所有网络请求Api
#import "JobsNetworkingHeader.h"
/// 公共图
#import "CommonViews.h"

#endif /* Other_h */
