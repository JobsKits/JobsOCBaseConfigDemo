//
//  JobsBaseWebVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEWEBVC_F8FA30C485
#define JOBS_HEADER_GUARD_JOBSBASEWEBVC_F8FA30C485

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <WebKit/WebKit.h>
#import <JobsBaseUI/BaseViewController.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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
/// 平铺的WebView控制器
@interface JobsBaseWebVC : BaseViewController
<
WKNavigationDelegate
,WKScriptMessageHandler
>
/// makeNormaleWebView
/// self.webView.loadRequest(self.urlString.URLRequest);
+(JobsRetVCByWebViewBlock _Nonnull)initByWebView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBASEWEBVC_F8FA30C485 */
