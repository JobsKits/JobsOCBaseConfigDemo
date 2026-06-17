//
//  TransitionAnimation.h
//  JobsOCBaseConfigDemo
//
//  Created by wsk on 16/8/22.
//  Copyright © 2016年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsDefineProperty.h"

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

-(instancetype)initWithTargetEdge:(UIRectEdge)targetEdge;

Prop(readwrite)UIRectEdge targetEdge;

@end
