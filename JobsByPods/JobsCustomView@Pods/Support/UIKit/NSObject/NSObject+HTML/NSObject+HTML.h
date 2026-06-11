//
//  NSObject+HTML.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_HTML_E003C98DDC
#define JOBS_HEADER_GUARD_NSOBJECT_HTML_E003C98DDC

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>                         // 用于嵌入和管理网页内容，例如加载和显示网页。
#import <JobsCustomView/NSMutableArray+Extra.h>
#import <JobsBaseUI/WKWebView+Extra.h>

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

@interface NSObject (HTML)<WKScriptMessageHandler,WKNavigationDelegate>
/// HTML 必要标签
- (__kindof NSMutableArray<NSString *> *)requiredHTMLTags;
/// HTML 标签
-(__kindof NSArray <__kindof NSString *>*)htmlTags;
/// 一个常规的WebView
-(JobsRetWKWebViewByViewModelBlock _Nonnull)makeNormaleWebViewByViewModel;

@end

NS_ASSUME_NONNULL_END
/**
 
     @synthesize webView = _webView;
     -(WKWebView *)webView {
         if (!_webView) {
     //        _webView = self.makeWebViewByURL(self.urlString.jobsUrl);
             /// JS 回调 Objective-C 方法
             _webView = WKWebView.initBy(jobsMakeWebViewConfiguration(^(__kindof WKWebViewConfiguration * _Nullable config) {
                 config.userContentController = jobsMakeUserContentController(^(__kindof WKUserContentController * _Nullable data) {
                     [data addScriptMessageHandler:self name:@"mayapay"]; // handler 名字
                 });
             }));
             _webView.navigationDelegate = self; // 设置代理监听网页加载状态
             /// 从 Objective-C 调用 JavaScript 方法
             [_webView evaluateJavaScript:@"navigator.userAgent"
                        completionHandler:^(id result, NSError *error) {
                 if (!error && [result isKindOfClass:NSString.class]) {
                     NSLog(@"User-Agent: %@", result);
                     NSString *ua = [NSString stringWithFormat:@"%@",result];
                     self->_webView.customUserAgent = ua.add(@"iOS/Mobile");
                 } else {
                     NSLog(@"获取 User-Agent 失败: %@", error.localizedDescription);
                 }
             }];
         };return _webView;
     }
 */
#endif /* JOBS_HEADER_GUARD_NSOBJECT_HTML_E003C98DDC */
