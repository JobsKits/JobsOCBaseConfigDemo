//
//  JobsDebugPanelBlock.h
//  JobsBlock
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#pragma once
#import <UIKit/UIKit.h>
#import <JobsBlock/JobsBlockHeader.h>

#pragma mark —— JobsDebugPanel
/// JobsDebugEnvironment
typedef JobsDebugEnvironment *_Nullable(^JobsRetDebugEnvironmentByStringBlock)(NSString *_Nullable value);
/// JobsDebugAction
typedef void(^JobsDebugActionHandler)(UIViewController *_Nonnull source);
typedef JobsDebugAction *_Nullable(^JobsRetDebugActionByStringBlock)(NSString *_Nullable value);
typedef JobsDebugAction *_Nullable(^JobsRetDebugActionByImageBlock)(UIImage *_Nullable value);
typedef JobsDebugAction *_Nullable(^JobsRetDebugActionByHandlerBlock)(JobsDebugActionHandler _Nullable value);
/// JobsDebugPanelManager
typedef void(^JobsDebugEnvironmentChangedHandler)(JobsDebugEnvironment *_Nonnull environment);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByVoidBlock)(void);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByStringBlock)(NSString *_Nullable value);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByEnvironmentsBlock)(NSArray<JobsDebugEnvironment *> *_Nullable value);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByActionsBlock)(NSArray<JobsDebugAction *> *_Nullable value);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByChangedHandlerBlock)(JobsDebugEnvironmentChangedHandler _Nullable value);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByViewControllerBlock)(UIViewController *_Nullable source);
typedef JobsDebugPanelManager *_Nullable(^JobsRetDebugPanelByEnvironmentBlock)(JobsDebugEnvironment *_Nullable value);

