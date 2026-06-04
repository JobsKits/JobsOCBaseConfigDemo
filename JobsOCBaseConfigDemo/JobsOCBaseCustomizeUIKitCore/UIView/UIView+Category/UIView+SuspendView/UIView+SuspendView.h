//
//  UIView+SuspendView.h
//  Search
//
//  Created by Jobs on 2020/8/13.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Measure.h"
#import "MacroDef_Size.h"

#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SuspendView)

Prop_weak()UIViewController *vc;
Prop_strong()UIPanGestureRecognizer *panRcognize;

@end

NS_ASSUME_NONNULL_END
