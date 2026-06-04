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

@class XLBubbleTransition;
@interface UIViewController (XLBubbleTransition)
<
UINavigationControllerDelegate
,UIViewControllerTransitioningDelegate
>

@property(nonatomic,retain)XLBubbleTransition *xl_pushTranstion;
@property(nonatomic,retain)XLBubbleTransition *xl_popTranstion;
@property(nonatomic,retain)XLBubbleTransition *xl_presentTranstion;
@property(nonatomic,retain)XLBubbleTransition *xl_dismissTranstion;

@end
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_XLBUBBLETRANSITION_496AF3DA62 */
