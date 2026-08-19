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
#import "JobsByOCPods.h"
#import "JobsOCDSL.h"
#import "JobsMakes.h"
#import "JobsOCTimer.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCSplashConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashVC : UIViewController

Prop_strong(readonly) JobsOCSplashConfiguration *configuration;

-(instancetype)initWithConfiguration:(JobsOCSplashConfiguration *)configuration NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithNibName:(NSString *_Nullable)nibNameOrNil bundle:(NSBundle *_Nullable)nibBundleOrNil NS_UNAVAILABLE;
-(instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
-(jobsByVoidBlock _Nonnull)finish;

-(JobsRetBOOLByVoidBlock _Nonnull)jobsCanBecomeFirstResponder;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCSplashVC
-(JobsRetJobsOCSplashVCByAVPlayerLayerBlock _Nonnull)byPlayerLayer;
    -(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byIsCountdownTime;
-(JobsRetJobsOCSplashVCByBOOLBlock _Nonnull)byHasFinished;
-(JobsRetJobsOCSplashVCByNSIntegerBlock _Nonnull)byCountdownTime;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCSplashVC
@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashVC_h */
