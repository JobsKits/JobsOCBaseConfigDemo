//
//  LuckyDiskDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

/// https://github.com/xiaolongLee/XLLuckyDraw

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

@interface LuckyDiskDemoVC : UIViewController

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LuckyDiskDemoVC
-(JobsRetLuckyDiskDemoVCByNSIntegerBlock _Nonnull)byFastIndex;
-(JobsRetLuckyDiskDemoVCByNSIntegerBlock _Nonnull)bySelectedIndex;
-(JobsRetLuckyDiskDemoVCByNSIntegerBlock _Nonnull)bySlowIndex;
-(JobsRetLuckyDiskDemoVCByNSTimerBlock _Nonnull)byFastTimer;
-(JobsRetLuckyDiskDemoVCByNSTimerBlock _Nonnull)bySlowTimer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END LuckyDiskDemoVC
@end
