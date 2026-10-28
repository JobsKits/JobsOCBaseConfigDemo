//
//  JobsOCDeviceGuardBlockedVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDeviceGuard/JobsOCDeviceGuard.h>)
#import <JobsOCDeviceGuard/JobsOCDeviceGuard.h>
#else
#import "JobsOCDeviceGuard.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 独立于BaseViewController，不进入Demo/业务初始化管线。
@interface JobsOCDeviceGuardBlockedVC : UIViewController

Prop_strong(readonly)JobsOCDeviceGuardReport *report;
-(instancetype)initWithReport:(JobsOCDeviceGuardReport *)report NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
