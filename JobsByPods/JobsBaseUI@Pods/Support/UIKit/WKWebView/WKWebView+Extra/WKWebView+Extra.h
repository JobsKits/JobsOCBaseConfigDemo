//
//  WKWebView+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <WebKit/WebKit.h>
#import <JobsBaseUI/WKWebViewConfiguration+Extra.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

@interface WKWebView (Extra)<BaseProtocol>

+(JobsRetWKWebViewByConfigurationBlock _Nonnull)initBy;
-(JobsRetWKWebViewByURLRequestBlock _Nonnull)loadRequest;
-(JobsRetWKWebViewByURLBlock _Nonnull)loadFileURL;
-(JobsRetCollectionViewByNavDelegateBlock _Nonnull)byNavDelegate;
-(JobsRetCollectionViewByUIDelegateBlock _Nonnull)byUIDelegate;

@end

NS_ASSUME_NONNULL_END

#ifndef JOBS_MAKE_WK_WEB_VIEW_BY_CONFIG
#define JOBS_MAKE_WK_WEB_VIEW_BY_CONFIG

NS_INLINE __kindof WKWebView *_Nonnull jobsMakeWKWebViewByConfig(jobsByWKWebViewBlock _Nonnull block){
    WKWebView *data = WKWebView.initBy(jobsMakeWKWebViewConfiguration(^(WKWebViewConfiguration * _Nullable config) {
        /// 确保 WebView 的配置允许加载外部资源：
        config.preferences.javaScriptEnabled = YES;
        config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
        config.allowsInlineMediaPlayback = YES;
        config.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone; // 确保媒体资源可以自动播放
        config.limitsNavigationsToAppBoundDomains = NO; // 禁止限制导航到受保护的域
        config.websiteDataStore = WKWebsiteDataStore.defaultDataStore;
    }));
    // 确保加载基础页面
    [data loadHTMLString:@"<html><head></head><body></body></html>" baseURL:nil];
    if (block) block(data);
    return data;
}
#endif
