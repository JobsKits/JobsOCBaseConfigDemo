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
-(void)finish;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashVC_h */
