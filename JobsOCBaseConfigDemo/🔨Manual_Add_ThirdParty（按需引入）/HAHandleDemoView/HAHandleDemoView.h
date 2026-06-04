//
//  handleDemoView.h
//  HandleAnimationDemo
//
//  Created by ZengYong on 16/4/8.
//  Copyright © 2016年 maipu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DefineProperty.h"

@protocol HAHandleDemoViewDelegate <NSObject>

@optional
-(void)animationCompleted;
-(void)animationCancel;

@end

NS_ASSUME_NONNULL_BEGIN

@interface HAHandleDemoView : UIView

Prop_weak()id<HAHandleDemoViewDelegate> delegate;

-(void)handleBtnTouchDownAction;
-(void)handleBtnTouchUpOutsideAction;

@end

NS_ASSUME_NONNULL_END
