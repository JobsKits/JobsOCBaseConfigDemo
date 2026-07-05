//
//  UIViewController+SuspendBtn.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SUSPENDBTN_05D777E68F
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SUSPENDBTN_05D777E68F

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsSuspend/JobsSuspendBtn.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import <JobsLoadingImage/JobsLoadingImageHeader.h>
#else
#import "JobsLoadingImageHeader.h"
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

@interface UIViewController (SuspendBtn)

Prop_strong()JobsSuspendBtn *suspendBtn;

@end

NS_ASSUME_NONNULL_END
/**
  
    【使用示例】
    suspendBtn按钮点击事件集成了点击旋转的动效
    [self.suspendBtn stopRotateAnimation];
 */
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SUSPENDBTN_05D777E68F */
