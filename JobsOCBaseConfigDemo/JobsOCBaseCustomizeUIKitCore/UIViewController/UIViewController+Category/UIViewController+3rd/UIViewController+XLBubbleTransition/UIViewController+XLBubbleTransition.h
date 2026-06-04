//
//  UIViewController+XLBubbleTransition.h
//  XLBubbleTransitionDemo
//
//  Created by MengXianLiang on 2017/4/1.
//  Copyright © 2017年 MengXianLiang. All rights reserved.
//  GitHub ：https://github.com/mengxianliang/XLBubbleTransition

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "XLBubbleTransition.h"

@class XLBubbleTransition;
#import "DefineProperty.h"

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
