//
//  XLBubbleTransition.h
//  JobsOCBaseConfigDemo
//
//  Created by MengXianLiang on 2017/4/11.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+XLBubbleTransition.h"

typedef NS_ENUM(NSInteger,XLBubbleTransitionType) {
    XLBubbleTransitionTypeShow = 0,
    XLBubbleTransitionTypeHide,
};

#import "JobsDefineProperty.h"

@interface XLBubbleTransition : NSObject
<
UIViewControllerAnimatedTransitioning
,CAAnimationDelegate
>
/// 转场方式：进入/返回
Prop_assign()XLBubbleTransitionType transitionType;
/// 初始化方法
+(instancetype)transitionWithAnchorRect:(CGRect)anchorRect;

@end
