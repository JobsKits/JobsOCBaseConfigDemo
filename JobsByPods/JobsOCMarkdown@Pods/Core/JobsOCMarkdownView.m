//
//  JobsOCMarkdownView.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownView.h"
#import "JobsOCMarkdownResourceLocator.h"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

static NSErrorDomain const JobsOCMarkdownViewErrorDomain = @"com.jobs.markdown.view";

@class JobsOCMarkdownWeakMessageHandler;

@interface JobsOCMarkdownView ()
<
WKNavigationDelegate,
WKUIDelegate,
WKScriptMessageHandler
>

Prop_strong(readwrite)WKWebView *webView;
Prop_strong(readwrite,nullable)JobsOCMarkdownDocument *document;
Prop_strong(readwrite)JobsOCMarkdownConfiguration *markdownConfiguration;
Prop_strong()UIActivityIndicatorView *loadingView;
Prop_copy(nullable)NSDictionary *pendingPayload;
Prop_assign()BOOL runtimeReady;

-(void)jobsCommonInit;
-(WKWebView *)jobsMakeWebView;
-(void)jobsRenderPendingPayload;
-(void)jobsHandleMessageBody:(id)body;
-(void)jobsFail:(NSError *)error;
-(NSURL *)jobsCommonAncestorURL:(NSURL *)firstURL
                     secondURL:(NSURL *)secondURL;

@end

@interface JobsOCMarkdownWeakMessageHandler : NSObject <WKScriptMessageHandler>

Prop_weak(nullable)id<WKScriptMessageHandler> target;

-(instancetype)initWithTarget:(id<WKScriptMessageHandler>)target;

@end

@implementation JobsOCMarkdownView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self jobsCommonInit];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self jobsCommonInit];
    };return self;
}

-(void)dealloc{
    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"jobsMarkdown"];
    [self.webView stopLoading];
}

-(instancetype)byConfiguration:(JobsOCMarkdownConfiguration *)configuration{
    self.markdownConfiguration = configuration.copy;
    return self;
}

-(instancetype)byDocument:(JobsOCMarkdownDocument *)document{
    [self loadDocument:document];
    return self;
}

-(void)loadDocument:(JobsOCMarkdownDocument *)document{
    [self loadDocument:document configuration:nil];
}

-(void)loadDocument:(JobsOCMarkdownDocument *)document
      configuration:(JobsOCMarkdownConfiguration *)configuration{
    self.document = document;
    if (configuration) self.markdownConfiguration = configuration.copy;
    NSError *error = nil;
    NSString *markdown = [NSString stringWithContentsOfURL:document.fileURL
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    if (!markdown) {
        [self jobsFail:error];
        return;
    }
    [self renderMarkdown:markdown
                   title:document.title
                 baseURL:document.fileURL.URLByDeletingLastPathComponent
           readAccessURL:document.contentRootURL
           configuration:nil];
}

-(void)renderMarkdown:(NSString *)markdown
                title:(NSString *)title
              baseURL:(NSURL *)baseURL
        readAccessURL:(NSURL *)readAccessURL
        configuration:(JobsOCMarkdownConfiguration *)configuration{
    if (configuration) self.markdownConfiguration = configuration.copy;
    NSURL *templateURL = JobsOCMarkdownResourceLocator.templateURL;
    if (!templateURL) {
        [self jobsFail:[NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                           code:1
                                       userInfo:@{NSLocalizedDescriptionKey : @"未找到 JobsOCMarkdownResources.bundle。"}]];
        return;
    }
    self.pendingPayload = @{
        @"markdown" : markdown ?: @"",
        @"title" : title ?: @"",
        @"baseURL" : baseURL.absoluteString ?: @"",
        @"appearance" : self.markdownConfiguration.appearanceName,
        @"fontScale" : @(self.markdownConfiguration.fontScale),
        @"showsTableOfContents" : @(self.markdownConfiguration.showsTableOfContents),
        @"showsCodeCopyButton" : @(self.markdownConfiguration.showsCodeCopyButton),
        @"rendersMermaid" : @(self.markdownConfiguration.rendersMermaid),
        @"rendersMath" : @(self.markdownConfiguration.rendersMath),
        @"sanitizesHTML" : @(self.markdownConfiguration.sanitizesHTML),
        @"allowsRemoteContent" : @(self.markdownConfiguration.allowsRemoteContent),
        @"customCSS" : self.markdownConfiguration.customCSS ?: @""
    };
    self.runtimeReady = NO;
    [self.loadingView startAnimating];
    NSURL *preferredReadAccessURL = readAccessURL ?: templateURL.URLByDeletingLastPathComponent;
    NSURL *readAccessRootURL = [self jobsCommonAncestorURL:templateURL.URLByDeletingLastPathComponent
                                                secondURL:preferredReadAccessURL];
    [self.webView loadFileURL:templateURL allowingReadAccessToURL:readAccessRootURL];
}

-(void)reloadDocument{
    if (self.document) [self loadDocument:self.document];
}

-(void)scrollToAnchor:(NSString *)anchor
             animated:(BOOL)animated{
    NSData *data = [NSJSONSerialization dataWithJSONObject:@[anchor ?: @""]
                                                   options:0
                                                     error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (json.length < 2) return;
    NSString *value = [json substringWithRange:NSMakeRange(1, json.length - 2)];
    [self.webView evaluateJavaScript:[NSString stringWithFormat:
                                      @"window.JobsMarkdownRuntime.scrollToAnchor(%@, %@);",
                                      value,
                                      animated ? @"true" : @"false"]
                   completionHandler:nil];
}

-(void)findText:(NSString *)text
      backwards:(BOOL)backwards
     completion:(void (^)(WKFindResult *result))completion{
    if (@available(iOS 14.5, *)) {
        WKFindConfiguration *configuration = WKFindConfiguration.new;
        configuration.backwards = backwards;
        configuration.wraps = YES;
        [self.webView findString:text
               withConfiguration:configuration
               completionHandler:completion ?: ^(WKFindResult *result) {}];
    }
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if (self.markdownConfiguration.appearance != JobsOCMarkdownAppearanceAutomatic) return;
    if (![self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) return;
    [self.webView evaluateJavaScript:@"window.JobsMarkdownRuntime.refreshAppearance('automatic');"
                   completionHandler:nil];
}
#pragma mark —— WKNavigationDelegate
-(void)webView:(WKWebView *)webView
decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction
decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSURL *URL = navigationAction.request.URL;
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated && URL) {
        if ([self.delegate respondsToSelector:@selector(markdownView:didRequestOpenURL:)]) {
            [self.delegate markdownView:self didRequestOpenURL:URL];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
#pragma mark —— WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    [self jobsHandleMessageBody:message.body];
}
#pragma mark —— 一些私有方法
-(void)jobsCommonInit{
    self.markdownConfiguration = JobsOCMarkdownConfiguration.defaultConfiguration;
    self.byBgColor(UIColor.systemBackgroundColor);
    self.webView.byAlpha(1);
    self.loadingView.byAlpha(1);
}

-(WKWebView *)jobsMakeWebView{
    if (!_webView) {
        WKUserContentController *contentController = WKUserContentController.new;
        WKWebViewConfiguration *configuration = jobsMakeWebViewConfiguration(^(WKWebViewConfiguration * _Nullable data) {
            data.userContentController = contentController;
            data.defaultWebpagePreferences.allowsContentJavaScript = YES;
            data.allowsInlineMediaPlayback = YES;
        });
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.scrollView.byBgColor(UIColor.systemBackgroundColor);
        _webView.scrollView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        _webView.byAddTo(self, ^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        });
        [contentController addScriptMessageHandler:[[JobsOCMarkdownWeakMessageHandler alloc] initWithTarget:self]
                                              name:@"jobsMarkdown"];
    };return _webView;
}

-(WKWebView *)webView{
    return [self jobsMakeWebView];
}

-(UIActivityIndicatorView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        _loadingView.hidesWhenStopped = YES;
        _loadingView.byAddTo(self, ^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        });
    };return _loadingView;
}

-(void)jobsRenderPendingPayload{
    if (!self.runtimeReady || !self.pendingPayload) return;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self.pendingPayload
                                                   options:0
                                                     error:&error];
    if (!data) {
        [self jobsFail:error];
        return;
    }
    NSString *base64 = [data base64EncodedStringWithOptions:0];
    NSString *script = [NSString stringWithFormat:
                        @"window.JobsMarkdownRuntime.renderBase64('%@');",
                        base64];
    @jobs_weakify(self)
    [self.webView evaluateJavaScript:script
                   completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        @jobs_strongify(self)
        if (error) [self jobsFail:error];
    }];
}

-(void)jobsHandleMessageBody:(id)body{
    if (![body isKindOfClass:NSDictionary.class]) {
        [self jobsFail:[NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                           code:2
                                       userInfo:@{NSLocalizedDescriptionKey : @"Markdown 渲染器返回了无法识别的消息。"}]];
        return;
    }
    NSDictionary *message = body;
    NSString *type = [message[@"type"] isKindOfClass:NSString.class] ? message[@"type"] : @"";
    if ([type isEqualToString:@"ready"]) {
        self.runtimeReady = YES;
        [self jobsRenderPendingPayload];
    }else if ([type isEqualToString:@"rendered"]){
        [self.loadingView stopAnimating];
        if ([self.delegate respondsToSelector:@selector(markdownViewDidFinishRendering:)]) {
            [self.delegate markdownViewDidFinishRendering:self];
        }
    }else if ([type isEqualToString:@"copy"]){
        UIPasteboard.generalPasteboard.string = [message[@"text"] isKindOfClass:NSString.class] ? message[@"text"] : @"";
    }else if ([type isEqualToString:@"link"]){
        NSURL *URL = [message[@"url"] isKindOfClass:NSString.class] ? [NSURL URLWithString:message[@"url"]] : nil;
        if (URL && [self.delegate respondsToSelector:@selector(markdownView:didRequestOpenURL:)]) {
            [self.delegate markdownView:self didRequestOpenURL:URL];
        }
    }else if ([type isEqualToString:@"error"]){
        NSString *description = [message[@"message"] isKindOfClass:NSString.class] ? message[@"message"] : @"Unknown JavaScript error";
        [self jobsFail:[NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                           code:3
                                       userInfo:@{NSLocalizedDescriptionKey :
                                                      [NSString stringWithFormat:@"Markdown 渲染失败：%@", description]}]];
    }
}

-(void)jobsFail:(NSError *)error{
    [self.loadingView stopAnimating];
    if ([self.delegate respondsToSelector:@selector(markdownView:didFailWithError:)]) {
        [self.delegate markdownView:self didFailWithError:error];
    }
}

-(NSURL *)jobsCommonAncestorURL:(NSURL *)firstURL
                     secondURL:(NSURL *)secondURL{
    NSArray <NSString *>*firstComponents = firstURL.standardizedURL.pathComponents;
    NSArray <NSString *>*secondComponents = secondURL.standardizedURL.pathComponents;
    NSMutableArray <NSString *>*commonComponents = NSMutableArray.array;
    NSUInteger count = MIN(firstComponents.count, secondComponents.count);
    for (NSUInteger index = 0; index < count; index++) {
        if (![firstComponents[index] isEqualToString:secondComponents[index]]) break;
        [commonComponents addObject:firstComponents[index]];
    }
    if (commonComponents.count <= 1) return firstURL.URLByDeletingLastPathComponent;
    return [NSURL fileURLWithPath:[NSString pathWithComponents:commonComponents] isDirectory:YES];
}

@end

@implementation JobsOCMarkdownWeakMessageHandler

-(instancetype)initWithTarget:(id<WKScriptMessageHandler>)target{
    if (self = [super init]) {
        self.target = target;
    };return self;
}

-(void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    [self.target userContentController:userContentController didReceiveScriptMessage:message];
}

@end
