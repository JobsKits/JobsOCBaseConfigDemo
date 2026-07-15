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
#import "UIView+Extra.h"

#if __has_include(<TFPopup/TFPopup.h>)
#import <TFPopup/TFPopup.h>
#else
#import "TFPopup.h"
#endif

#import "JobsMakes.h"
#import "JobsBasePopupViewHeader.h"
#import "JobsLanMgr.h"
#import "WHToastExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

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
