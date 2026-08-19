//
//  XLBubbleTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_XLBUBBLETRANSITION_F733844DE5
#define JOBS_HEADER_GUARD_XLBUBBLETRANSITION_F733844DE5

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "UIViewController+XLBubbleTransition.h"
#import "JobsDefines.h"

typedef NS_ENUM(NSInteger,XLBubbleTransitionType) {
    XLBubbleTransitionTypeShow = 0,
    XLBubbleTransitionTypeHide,
};

@interface XLBubbleTransition : NSObject
<
UIViewControllerAnimatedTransitioning
,CAAnimationDelegate
>
/// 转场方式：进入/返回
Prop_assign()XLBubbleTransitionType transitionType;

/// 锚点
Prop_assign()CGRect anchorRect;

/// 初始化方法
+(JobsRetIDByFrameBlock _Nonnull)transitionWithAnchorRect;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN XLBubbleTransition
-(JobsRetXLBubbleTransitionByCAShapeLayerBlock _Nonnull)byMaskLayer;
-(JobsRetXLBubbleTransitionByCGRectBlock _Nonnull)byAnchorRect;
-(JobsRetXLBubbleTransitionByIDUIViewControllerContextTransitioningBlock _Nonnull)byTransitionContext;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END XLBubbleTransition
@end
#endif /* JOBS_HEADER_GUARD_XLBUBBLETRANSITION_F733844DE5 */
