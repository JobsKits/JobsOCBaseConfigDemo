//
//  UIViewController+SafeTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SAFETRANSITION_32FA445F7D
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SAFETRANSITION_32FA445F7D

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JobsRecordPresentedViewController.h"
#import "NSString+Toast.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsLanMgr.h"

#import "JobsOCRuntimeKits.h"

#import "WHToastExtra.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

/// 防止过多的presented模态推出ViewController
@interface UIViewController (SafeTransition)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SAFETRANSITION_32FA445F7D */
