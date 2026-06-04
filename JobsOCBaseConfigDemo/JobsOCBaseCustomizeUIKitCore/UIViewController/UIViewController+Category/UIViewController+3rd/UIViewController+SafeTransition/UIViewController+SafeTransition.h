//
//  UIViewController+SafeTransition.h
//  Casino
//
//  Created by Jobs on 2022/1/1.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "BaseProtocol.h"
#import "JobsBlock.h"
#import "NSObject+WHToast.h"

#if __has_include(<WHToast/WHToast.h>)
#import <WHToast/WHToast.h>
#else
#import "WHToast.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsRecordPresentedViewController : NSObject<BaseProtocol>

Prop_strong()NSMutableArray <__kindof UIViewController *>*presentedVCMutArr;

@end
/// 防止过多的presented模态推出ViewController
@interface UIViewController (SafeTransition)

@end

NS_ASSUME_NONNULL_END
