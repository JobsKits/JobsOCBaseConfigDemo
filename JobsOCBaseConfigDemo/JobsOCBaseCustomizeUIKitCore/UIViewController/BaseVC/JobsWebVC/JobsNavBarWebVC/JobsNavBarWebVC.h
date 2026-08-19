//
//  JobsNavBarWebVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D
#define JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "UIView+Masonry.h"
#import "JobsBaseWebVC.h"
#import "NSObject+MyAppTools.h"
#import "JobsAppToolsHeader.h"
#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"
#import "JobsModelDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 带导航栏的WebView控制器
@interface JobsNavBarWebVC : JobsBaseWebVC
<
WKNavigationDelegate
,WKScriptMessageHandler
>

-(JobsRetJobsNavBarWebVCByStrBlock _Nonnull)byURL;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D */
