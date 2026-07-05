//
//  JobsBaseWebVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEWEBVC_F8FA30C485
#define JOBS_HEADER_GUARD_JOBSBASEWEBVC_F8FA30C485

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import <WebKit/WebKit.h>
#import "BaseViewController.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

#import "JobsModelDSL.h"

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
