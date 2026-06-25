//
//  JobsOCOpener.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B
#define JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B

#import <UIKit/UIKit.h>
#import "JobsOCOpenConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCOpener : NSObject

+(instancetype)shared;
-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration;
-(void)open:(JobsOCOpenConfiguration *_Nullable)configuration
       from:(UIViewController *_Nullable)sourceViewController;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCOPENER_D0E8F3A41B */
