//
//  UIScrollView+TFPopup.h
//  TFPopup
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <TFPopup/TFPopupConst.h>
#import <TFPopup/UIView+TFPopup.h>
#import <TFPopup/NSObject+TFPopupMethodExchange.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface UIScrollView (TFPopup)<UIGestureRecognizerDelegate,UIScrollViewDelegate>

Prop_weak()UIView *faterPopupView;

@end

