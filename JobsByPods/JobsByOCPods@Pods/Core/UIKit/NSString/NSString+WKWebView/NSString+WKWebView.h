//
//  NSString+WKWebView.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_WKWEBVIEW_264ABEA923
#define JOBS_HEADER_GUARD_NSSTRING_WKWEBVIEW_264ABEA923

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h> // 提供 Objective-C / Swift 与 JavaScript 交互能力，可执行脚本并进行对象桥接。
#import <JobsByOCPods/NSObject+HTML.h>
#import <JobsByOCPods/NSString+Check.h>
#import <JobsByOCPods/NSString+URL.h>
#import <JobsByOCPods/WKWebView+Extra.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WKWebView)
/// loadHTMLString：包含 HTML 内容的字符串
/// baseURL：指定 HTML 内容的基本 URL，可以用于解析相对路径
-(JobsRetWKWebViewByStrBlock _Nonnull)webViewByloadHTMLString;
/// 解析纯的HTML字符串
-(__kindof WKWebView *_Nullable)webViewByloadHTMLStr;
/// 解析URL数据
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebView;
/// 解析JS
-(JobsRetWKWebViewByVoidBlock _Nonnull)makeWebViewByJS;
/// 鉴别一个字符串里面是否包含HTML的标签。如果有则这个字符串考虑用WebView来进行承接
-(BOOL)isHTMLString;
/// 某个字符串是否包含这些HTML必要的成像标签。如果没有就要做特殊处理
-(BOOL)isContainsRequiredHTMLTags;
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示
-(__kindof NSString *_Nullable)wrapHTMLString;
/// 包装 HTML 字符串，使之能被 WKWebView 正确显示 + 背景透明
-(__kindof NSString *_Nullable)wrapHTMLStringWithClearBg;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_WKWEBVIEW_264ABEA923 */
