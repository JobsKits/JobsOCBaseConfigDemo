//
//  NSObject+PopViewToLogOut.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_POPVIEWTOLOGOUT_9DBDCE6BE7
#define JOBS_HEADER_GUARD_NSOBJECT_POPVIEWTOLOGOUT_9DBDCE6BE7

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import <JobsByOCPods/UIView+Extra.h>

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBasePopupView/JobsBasePopupView.h>)
#import <JobsBasePopupView/JobsBasePopupView.h>
#else
#import "JobsBasePopupView.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
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

NS_ASSUME_NONNULL_BEGIN
/// 触发退出登录模块之前，弹窗提示二次确认，确认以后再删除本地用户数据
@interface NSObject (PopViewToLogOut)
/// UI
Prop_strong()JobsBasePopupView *logOutPopupView;
/// Data
Prop_strong()UIViewModel *logOutPopupVM;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_POPVIEWTOLOGOUT_9DBDCE6BE7 */
