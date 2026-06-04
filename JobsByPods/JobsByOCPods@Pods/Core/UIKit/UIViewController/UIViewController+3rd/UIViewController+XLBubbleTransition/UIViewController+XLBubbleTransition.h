//
//  UIViewController+XLBubbleTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_XLBUBBLETRANSITION_496AF3DA62
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_XLBUBBLETRANSITION_496AF3DA62

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/XLBubbleTransition.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@class XLBubbleTransition;
@interface UIViewController (XLBubbleTransition)
<
UINavigationControllerDelegate
,UIViewControllerTransitioningDelegate
>

Prop_retain()XLBubbleTransition *xl_pushTranstion;
Prop_retain()XLBubbleTransition *xl_popTranstion;
Prop_retain()XLBubbleTransition *xl_presentTranstion;
Prop_retain()XLBubbleTransition *xl_dismissTranstion;

@end
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_XLBUBBLETRANSITION_496AF3DA62 */
