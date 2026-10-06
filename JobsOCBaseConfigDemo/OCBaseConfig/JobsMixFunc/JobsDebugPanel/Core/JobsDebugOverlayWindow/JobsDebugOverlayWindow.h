//
//  JobsDebugOverlayWindow.h
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
#import "JobsDebugOverlayVC.h"

#if DEBUG
NS_ASSUME_NONNULL_BEGIN
@interface JobsDebugOverlayWindow : UIWindow

Prop_weak(readonly)UIWindow *hostWindow;
-(instancetype)initWithHostWindow:(UIWindow *)window panel:(JobsDebugPanelManager *)panel;

@end
NS_ASSUME_NONNULL_END
#endif
