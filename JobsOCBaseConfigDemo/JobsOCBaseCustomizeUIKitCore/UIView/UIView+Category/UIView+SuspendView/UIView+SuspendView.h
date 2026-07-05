//
//  UIView+SuspendView.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_SUSPENDVIEW_FD5FBAE9D4
#define JOBS_HEADER_GUARD_UIVIEW_SUSPENDVIEW_FD5FBAE9D4

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#import "JobsOCDSL.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SuspendView)

Prop_weak()UIViewController *vc;
Prop_strong()UIPanGestureRecognizer *panRcognize;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_SUSPENDVIEW_FD5FBAE9D4 */
