//
//  JobsOCOpener.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B
#define JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCOpenConfiguration.h"

#if __has_include(<JobsGetWindow/JobsGetWindow.h>)
#import <JobsGetWindow/JobsGetWindow.h>
#else
#import "JobsGetWindow.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCOpener : NSObject

+(JobsRetIDByVoidBlock _Nonnull)shared;
-(jobsByJobsOCOpenConfigurationBlock _Nonnull)open;
-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration
       from:(UIViewController *_Nullable)sourceViewController;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B */
