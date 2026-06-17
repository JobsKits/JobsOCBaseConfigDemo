//
//  ZLGestureLockIndicator.h
//  JobsOCBaseConfigDemo
//
//  Created by ZL on 2017/4/5.
//  Copyright © 2017年 ZL. All rights reserved.
//  九宫格指示器 小图

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "JobsDefineProperty.h"

@interface ZLGestureLockIndicator : BaseView

Prop_copy()NSString *gesturePassword;

- (void)setGesturePassword:(NSString *)gesturePassword;

@end
