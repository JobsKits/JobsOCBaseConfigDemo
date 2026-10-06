//
//  JobsDebugPanelManager.h
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
#import <UIKit/UIKit.h>
#import "JobsDebugEnvironment.h"
#import "JobsDebugAction.h"

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

#if DEBUG
NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSNotificationName const JobsDebugEnvironmentDidChangeNotification;
FOUNDATION_EXPORT NSNotificationName const JobsDebugPanelVisibilityDidChangeNotification;

@interface JobsDebugPanelManager : NSObject

Prop_strong(class,readonly)JobsDebugPanelManager *sharedPanel;
Prop_copy(readonly)NSArray<JobsDebugEnvironment *> *environments;
Prop_copy(readonly)NSArray<JobsDebugAction *> *actions;
Prop_strong(readonly,nullable)JobsDebugEnvironment *currentEnvironment;
-(JobsRetDebugPanelByEnvironmentsBlock _Nonnull)byEnvironments;
-(JobsRetDebugPanelByStringBlock _Nonnull)byDefaultEnvironmentIdentifier;
-(JobsRetDebugPanelByChangedHandlerBlock _Nonnull)byEnvironmentChanged;
-(JobsRetDebugPanelByActionsBlock _Nonnull)byActions;
-(JobsRetDebugPanelByVoidBlock _Nonnull)start;
-(JobsRetDebugPanelByVoidBlock _Nonnull)hideForCurrentLaunch;
-(JobsRetDebugPanelByViewControllerBlock _Nonnull)showFrom;
// 浮动入口在整个调试导航流程中再次点击时返回打开面板前的页面。
-(JobsRetDebugPanelByViewControllerBlock _Nonnull)toggleFrom;
-(JobsRetBOOLByVCBlock _Nonnull)isShowingFrom;
-(JobsRetDebugPanelByEnvironmentBlock _Nonnull)selectEnvironment;

@end

NS_ASSUME_NONNULL_END
#endif

