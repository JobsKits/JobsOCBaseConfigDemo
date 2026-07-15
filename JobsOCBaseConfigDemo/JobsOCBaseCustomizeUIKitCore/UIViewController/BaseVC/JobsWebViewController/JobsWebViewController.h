//
//  JobsWebViewController.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSWEBVIEWCONTROLLER_E5C8C2988F
#define JOBS_HEADER_GUARD_JOBSWEBVIEWCONTROLLER_E5C8C2988F

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import <WebKit/WebKit.h>
#import "BaseViewController.h"
#import "JobsBaseProtocolHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsWebViewController : BaseViewController

+(JobsRetVCByWebViewBlock _Nonnull)initByWebView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSWEBVIEWCONTROLLER_E5C8C2988F */
