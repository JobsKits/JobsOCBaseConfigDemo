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
#import "JobsSuspendBtn.h"

#import "JobsLanMgr.h"

#import "JobsLoadingImageHeader.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

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
