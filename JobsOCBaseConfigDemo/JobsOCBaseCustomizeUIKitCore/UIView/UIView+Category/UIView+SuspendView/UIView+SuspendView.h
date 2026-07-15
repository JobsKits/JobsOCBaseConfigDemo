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
Prop_assign()BOOL suspendHapticOnDock;
Prop_assign()BOOL suspendConfineInSafeArea;

/// 以父视图 safeArea 左上角为坐标原点设置悬浮起点，并自动夹紧
-(JobsRetViewByCGPointBlock _Nonnull)bySuspendOriginInSafeArea;
/// 吸附结束后是否触发轻触觉
-(JobsRetViewByBOOLBlock _Nonnull)byHapticOnDock;
/// 拖动过程中是否限制在父视图 safeArea 内，默认 YES
-(JobsRetViewByBOOLBlock _Nonnull)byConfineInSafeArea;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_SUSPENDVIEW_FD5FBAE9D4 */
