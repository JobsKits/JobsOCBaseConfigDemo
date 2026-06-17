//
// Created by Chenyu Lan on 10/30/14.
// Copyright (c) 2014 Fenbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTKAnimatingRequestAccessory.h"
#import "JobsDefineProperty.h"

#if __has_include(<YTKNetwork/YTKChainRequest.h>)
#import <YTKNetwork/YTKChainRequest.h>
#else
#import "YTKChainRequest.h"
#endif

@interface YTKChainRequest (AnimatingAccessory)

Prop_weak()UIView *animatingView;
Prop_copy()NSString *animatingText;

@end
