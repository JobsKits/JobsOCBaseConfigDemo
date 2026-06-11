//
//  UIControl+DSL.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICONTROL_DSL_B59D10B82A
#define JOBS_HEADER_GUARD_UICONTROL_DSL_B59D10B82A

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (DSL)

Prop_copy(readonly)JobsRetControlByHandlerBlock onJobsTap;
Prop_copy(readonly)JobsRetControlByHandlerBlock onJobsChange;
Prop_copy(readonly)JobsRetControlByEventsHandlerBlock onJobsEvent;
Prop_copy(readonly)JobsRetControlByBOOLBlock byEnabled;
Prop_copy(readonly)JobsRetControlByBOOLBlock bySelected;
Prop_copy(readonly)JobsRetControlByBOOLBlock byHighlighted;
Prop_copy(readonly)JobsRetControlByAlignBlock byContentAlignment;
Prop_copy(readonly)JobsRetControlByHorizontalAlignBlock byContentHorizontalAlignment;
Prop_copy(readonly)JobsRetControlByVerticalAlignBlock byContentVerticalAlignment;
Prop_copy(readonly)JobsRetControlByTargetActionEventsBlock byAddTarget;
Prop_copy(readonly)JobsRetControlByTargetActionEventsBlock byRemoveTarget;
Prop_copy(readonly)JobsRetControlByEventsBlock bySendActions;
Prop_copy(readonly)JobsRetControlByActionEventsBlock byAddAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByActionEventsBlock byRemoveAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByIdentifierEventsBlock byRemoveActionByIdentifier API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByEventsIdentifierActionHandlerBlock byOnAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByBOOLBlock byShowsMenuAsPrimaryAction API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByBOOLBlock byContextMenuEnabled API_AVAILABLE(ios(14.0));
Prop_copy(readonly)JobsRetControlByStringBlock byToolTip API_AVAILABLE(ios(15.0));
Prop_copy(readonly)JobsRetControlByBOOLBlock bySymbolAnimationEnabled API_AVAILABLE(ios(17.0));

#if defined(__IPHONE_17_4) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_4)
Prop_copy(readonly)JobsRetControlByVoidBlock byPerformPrimaryAction API_AVAILABLE(ios(17.4));
#endif

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICONTROL_DSL_B59D10B82A */
