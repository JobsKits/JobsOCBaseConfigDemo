//
//  JobsNavBarWebVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D
#define JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/UIView+Masonry.h>
#import <JobsBaseUI/JobsBaseWebVC.h>

#if __has_include(<JobsAppTools/NSObject+AppTools.h>)
#import <JobsAppTools/NSObject+AppTools.h>
#else
#import "NSObject+AppTools.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 带导航栏的WebView控制器
@interface JobsNavBarWebVC : JobsBaseWebVC
<
WKNavigationDelegate
,WKScriptMessageHandler
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSNAVBARWEBVC_7B476F197D */
