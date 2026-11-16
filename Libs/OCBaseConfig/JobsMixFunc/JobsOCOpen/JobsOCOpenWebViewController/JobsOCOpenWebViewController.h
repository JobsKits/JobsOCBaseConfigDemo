//
//  JobsOCOpenWebViewController.h
//  JobsOCOpen
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCOPENWEBVIEWCONTROLLER_460CCF016D
#define JOBS_HEADER_GUARD_JOBSOCOPENWEBVIEWCONTROLLER_460CCF016D

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "JobsBlock.h"
#import "JobsBaseUI.h"
#import "JobsOCDSL.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCOpenWebViewController : BaseViewController <WKNavigationDelegate>

-(JobsRetJobsOCOpenWebVCByURLBlock _Nonnull)byURL;
-(JobsRetJobsOCOpenWebVCByStrBlock _Nonnull)byPageTitle;
-(instancetype)initWithURL:(NSURL *)url
                     title:(NSString *_Nullable)title NS_DESIGNATED_INITIALIZER;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCOPENWEBVIEWCONTROLLER_460CCF016D */
