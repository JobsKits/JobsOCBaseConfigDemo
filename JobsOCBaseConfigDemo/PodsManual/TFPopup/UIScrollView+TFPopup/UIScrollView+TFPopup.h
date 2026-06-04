//
//  UIScrollView+TFPopup.h
//  TFPopupDemo
//
//  Created by zhutaofeng on 2019/8/15.
//  Copyright © 2019 ztf. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "TFPopupConst.h"
#import "NSObject+TFPopupMethodExchange.h"

@interface UIScrollView (TFPopup)<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property(nonatomic,  weak) UIView *faterPopupView;

@end


