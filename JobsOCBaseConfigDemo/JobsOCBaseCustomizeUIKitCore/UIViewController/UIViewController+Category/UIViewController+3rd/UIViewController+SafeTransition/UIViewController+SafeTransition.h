//
//  UIViewController+SafeTransition.h
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JobsBlock.h"
#import "JobsRecordPresentedViewController.h"
#import "NSObject+WHToast.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 防止过多的presented模态推出ViewController
@interface UIViewController (SafeTransition)

@end

NS_ASSUME_NONNULL_END
