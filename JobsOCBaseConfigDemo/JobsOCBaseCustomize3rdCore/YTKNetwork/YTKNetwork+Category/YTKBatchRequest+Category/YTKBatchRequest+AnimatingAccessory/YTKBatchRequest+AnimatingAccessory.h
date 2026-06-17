//
// Created by Chenyu Lan on 10/30/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTKAnimatingRequestAccessory.h"
#import "JobsDefineProperty.h"

#if __has_include(<YTKNetwork/YTKBatchRequest.h>)
#import <YTKNetwork/YTKBatchRequest.h>
#else
#import "YTKBatchRequest.h"
#endif

@interface YTKBatchRequest (AnimatingAccessory)

Prop_weak()UIView *animatingView;
Prop_copy()NSString *animatingText;

@end
