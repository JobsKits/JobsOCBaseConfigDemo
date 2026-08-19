//
//  JobsOCSplashVC.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashVC_h
#define JobsOCSplashVC_h

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "JobsOCSplashGIFDecoder.h"
#import "JobsOCSplashLocalization.h"
#import "JobsOCSplashMediaCache.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
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

#if __has_include(<JobsOCSplash/JobsOCSplashConfiguration.h>)
#import <JobsOCSplash/JobsOCSplashConfiguration.h>
#else
#import "JobsOCSplashConfiguration.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashVC : UIViewController

Prop_strong(readonly) JobsOCSplashConfiguration *configuration;

-(instancetype)initWithConfiguration:(JobsOCSplashConfiguration *)configuration NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(NSString *_Nullable)nibNameOrNil bundle:(NSBundle *_Nullable)nibBundleOrNil NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
-(jobsByVoidBlock _Nonnull)finish;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCSplashVC
-(JobsRetJobsOCSplashVCByAVPlayerLayerBlock _Nonnull)byPlayerLayer;
    -(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byIsCountdownTime;
-(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byHasFinished;
-(JobsRetJobsOCSplashVCByNSIntegerBlock _Nonnull)byCountdownTime;
-(JobsRetJobsOCSplashVCByjobsByVoidBlockBlock _Nonnull)byHostGestureRestoration;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCSplashVC
@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashVC_h */
