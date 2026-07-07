//
//  JXCategoryViewVerticalShowSubBaseVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<lottie-ios/Lottie.h>)
#import <lottie-ios/Lottie.h>
#else
#import "Lottie.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import "JobsBaseUI.h"
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryViewVerticalShowSubBaseVC : UIViewController//BaseViewController

Prop_copy()NSString *pageTitle;

@end

NS_ASSUME_NONNULL_END
