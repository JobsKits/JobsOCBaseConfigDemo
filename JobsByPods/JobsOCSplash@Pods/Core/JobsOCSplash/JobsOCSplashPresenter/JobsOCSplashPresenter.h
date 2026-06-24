//
//  JobsOCSplashPresenter.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashPresenter_h
#define JobsOCSplashPresenter_h

#import <UIKit/UIKit.h>
#import "JobsOCSplashVC.h"

#if __has_include(<JobsOCSplash/JobsOCSplashConfiguration.h>)
#import <JobsOCSplash/JobsOCSplashConfiguration.h>
#else
#import "JobsOCSplashConfiguration.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class JobsOCSplashVC;

@interface JobsOCSplashPresenter : NSObject

+(__kindof JobsOCSplashVC *)showOver:(__kindof UIViewController *)hostViewController configuration:(JobsOCSplashConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashPresenter_h */
