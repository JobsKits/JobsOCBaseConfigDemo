//
//  JobsOCMarkdownView.m
//  JobsOCMarkdown
//
//  Created by Jobs on 2026年7月30日，星期四.
//  Copyright © 2026 Jobs. All rights reserved.
//

#import "JobsOCMarkdownView.h"
#import "JobsOCMarkdownResourceLocator.h"



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

-(jobsByVoidBlock _Nonnull)jobsCommonInit;
-(JobsRetWKWebViewByVoidBlock _Nonnull)jobsMakeWebView;
-(jobsByVoidBlock _Nonnull)jobsRenderPendingPayload;
-(jobsByIDBlock _Nonnull)jobsHandleMessageBody;
-(jobsByErrBlock _Nonnull)jobsFail;
-(NSURL *)jobsCommonAncestorURL:(NSURL *)firstURL
                     secondURL:(NSURL *)secondURL;

@end
@interface JobsOCMarkdownWeakMessageHandler : NSObject <WKScriptMessageHandler>

Prop_weak(nullable)id<WKScriptMessageHandler> target;

-(JobsRetIDByIDBlock _Nonnull)initWithTarget;
-(JobsRetIDByIDBlock _Nonnull)byTarget;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCMarkdownView
@interface JobsOCMarkdownView (JobsPropertyDSLSetterAutogen_45eafab8f8)
-(void)setMarkdownConfiguration:(JobsOCMarkdownConfiguration * _Nullable)data;
-(void)setRuntimeReady:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCMarkdownView

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN WKFindConfiguration
@interface WKFindConfiguration (JobsLocalPropertyDSLAutogen_45eafab8f8)
-(JobsRetWKFindConfigurationByBOOLBlock _Nonnull)byBackwards;
-(JobsRetWKFindConfigurationByBOOLBlock _Nonnull)byWraps;
-(void)setBackwards:(BOOL)data;
-(void)setWraps:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END WKFindConfiguration

@implementation JobsOCMarkdownView

-(JobsRetJobsOCMarkdownViewByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownView *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.jobsCommonInit();
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        self.jobsCommonInit();
    };return self;
}

-(void)dealloc{
    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"jobsMarkdown"];
    [self.webView stopLoading];
}

-(JobsRetIDByJobsOCMarkdownConfigurationBlock _Nonnull)byConfiguration{
    @jobs_weakify(self)
    return ^id(JobsOCMarkdownConfiguration * configuration){
        @jobs_strongify(self)
        if (!self) return nil;
        self.markdownConfiguration = configuration.copy;
        return self;
    };
}

-(JobsRetIDByJobsOCMarkdownDocumentBlock _Nonnull)byDocument{
    @jobs_weakify(self)
    return ^id(JobsOCMarkdownDocument * document){
        @jobs_strongify(self)
        if (!self) return nil;
        self.loadDocument(document);
        return self;
    };
}

-(jobsByJobsOCMarkdownDocumentBlock _Nonnull)loadDocument{
    @jobs_weakify(self)
    return ^(JobsOCMarkdownDocument * document){
        @jobs_strongify(self)
        if (!self) return;
        [self loadDocument:document configuration:nil];
    };
}

-(void)loadDocument:(JobsOCMarkdownDocument *)document
      configuration:(JobsOCMarkdownConfiguration *)configuration{
    self.byDocument(document);
    if (configuration) self.markdownConfiguration = configuration.copy;
    NSError *error = nil;
    NSString *markdown = [NSString stringWithContentsOfURL:document.fileURL
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    if (!markdown) {
        self.jobsFail(error);
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
    NSURL *templateURL = JobsOCMarkdownResourceLocator.templateURL();
    if (!templateURL) {
        self.jobsFail([NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                           code:1
                                       userInfo:@{NSLocalizedDescriptionKey : @"未找到 JobsOCMarkdownResources.bundle。"}]);
        return;
    }
    self.pendingPayload = @{
        @"markdown" : markdown ?: @"",
        @"title" : title ?: @"",
        @"baseURL" : baseURL.absoluteString ?: @"",
        @"appearance" : self.markdownConfiguration.appearanceName(),
        @"fontScale" : @(self.markdownConfiguration.fontScale),
        @"showsTableOfContents" : @(self.markdownConfiguration.showsTableOfContents),
        @"showsCodeCopyButton" : @(self.markdownConfiguration.showsCodeCopyButton),
        @"rendersMermaid" : @(self.markdownConfiguration.rendersMermaid),
        @"rendersMath" : @(self.markdownConfiguration.rendersMath),
        @"sanitizesHTML" : @(self.markdownConfiguration.sanitizesHTML),
        @"allowsRemoteContent" : @(self.markdownConfiguration.allowsRemoteContent),
        @"customCSS" : self.markdownConfiguration.customCSS ?: @""
    };
    self.byRuntimeReady(NO);
    [self.loadingView startAnimating];
    NSURL *preferredReadAccessURL = readAccessURL ?: templateURL.URLByDeletingLastPathComponent;
    NSURL *readAccessRootURL = [self jobsCommonAncestorURL:templateURL.URLByDeletingLastPathComponent
                                                secondURL:preferredReadAccessURL];
    [self.webView loadFileURL:templateURL allowingReadAccessToURL:readAccessRootURL];
}

-(jobsByVoidBlock _Nonnull)reloadDocument{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.document) self.loadDocument(self.document);
    };
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
        configuration.byBackwards(backwards);
        configuration.byWraps(YES);
        [self.webView findString:text
               withConfiguration:configuration
               completionHandler:completion ?: ^(WKFindResult *result) {}];
    }
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownView.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        if (self.markdownConfiguration.appearance != JobsOCMarkdownAppearanceAutomatic) return;
        if (![self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) return;
        [self.webView evaluateJavaScript:@"window.JobsMarkdownRuntime.refreshAppearance('automatic');"
                       completionHandler:nil];
    };
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
    (((jobsByIDBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownView.class, @selector(jobsHandleMessageBody)))(self, @selector(jobsHandleMessageBody)))(message.body);
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)jobsCommonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byMarkdownConfiguration(JobsOCMarkdownConfiguration.defaultConfiguration());
        self.byBgColor(UIColor.systemBackgroundColor);
        self.webView.byAlpha(1);
        self.loadingView.byAlpha(1);
    };
}

-(JobsRetWKWebViewByVoidBlock _Nonnull)jobsMakeWebView{
    @jobs_weakify(self)
    return ^WKWebView *{
        @jobs_strongify(self)
        if (!self) return nil;
        if (!_webView) {
            WKUserContentController *contentController = jobsMakeUserContentController(^(WKUserContentController *object){});
            WKWebViewConfiguration *configuration = jobsMakeWebViewConfiguration(^(WKWebViewConfiguration * _Nullable data) {
                data
                    .byUserContentController(contentController)
                    .byDefaultWebpagePreferences(^(WKWebpagePreferences * _Nullable preferences) {
                        preferences.byAllowsContentJavaScript(YES);
                    })
                    .byAllowsInlineMediaPlayback(YES);
            });
            _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration]
                .byNavigationDelegate(self)
                .byUIDelegate(self)
                .byAllowsBackForwardNavigationGestures(YES);
            _webView.scrollView.byBgColor(UIColor.systemBackgroundColor);
            _webView.scrollView.byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
            _webView.byAddTo(self, ^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            });
            [contentController addScriptMessageHandler:JobsOCMarkdownWeakMessageHandler.alloc.initWithTarget(self)
                                                  name:@"jobsMarkdown"];
        };return _webView;
    };
}

-(WKWebView *)webView{
    return (((JobsRetWKWebViewByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCMarkdownView.class, @selector(jobsMakeWebView)))(self, @selector(jobsMakeWebView)))();
}

-(UIActivityIndicatorView *)loadingView{
    if (!_loadingView) {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        _loadingView.byHidesWhenStopped(YES);
        _loadingView.byAddTo(self, ^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        });
    };return _loadingView;
}

-(jobsByVoidBlock _Nonnull)jobsRenderPendingPayload{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.runtimeReady || !self.pendingPayload) return;
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.pendingPayload
                                                       options:0
                                                         error:&error];
        if (!data) {
            self.jobsFail(error);
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
            if (error) self.jobsFail(error);
        }];
    };
}

-(jobsByIDBlock _Nonnull)jobsHandleMessageBody{
    @jobs_weakify(self)
    return ^(id body){
        @jobs_strongify(self)
        if (!self) return;
        if (![body isKindOfClass:NSDictionary.class]) {
            self.jobsFail([NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                               code:2
                                           userInfo:@{NSLocalizedDescriptionKey : @"Markdown 渲染器返回了无法识别的消息。"}]);
            return;
        }
        NSDictionary *message = body;
        NSString *type = [message[@"type"] isKindOfClass:NSString.class] ? message[@"type"] : @"";
        if ([type isEqualToString:@"ready"]) {
            self.byRuntimeReady(YES);
            self.jobsRenderPendingPayload();
        }else if ([type isEqualToString:@"rendered"]){
            [self.loadingView stopAnimating];
            if ([self.delegate respondsToSelector:@selector(markdownViewDidFinishRendering:)]) {
                [self.delegate markdownViewDidFinishRendering:self];
            }
        }else if ([type isEqualToString:@"copy"]){
            UIPasteboard.generalPasteboard.byString([message[@"text"] isKindOfClass:NSString.class] ? message[@"text"] : @"");
        }else if ([type isEqualToString:@"link"]){
            NSURL *URL = [message[@"url"] isKindOfClass:NSString.class] ? [NSURL URLWithString:message[@"url"]] : nil;
            if (URL && [self.delegate respondsToSelector:@selector(markdownView:didRequestOpenURL:)]) {
                [self.delegate markdownView:self didRequestOpenURL:URL];
            }
        }else if ([type isEqualToString:@"error"]){
            NSString *description = [message[@"message"] isKindOfClass:NSString.class] ? message[@"message"] : @"Unknown JavaScript error";
            self.jobsFail([NSError errorWithDomain:JobsOCMarkdownViewErrorDomain
                                               code:3
                                           userInfo:@{NSLocalizedDescriptionKey :
                                                          [NSString stringWithFormat:@"Markdown 渲染失败：%@", description]}]);
        }
    };
}

-(jobsByErrBlock _Nonnull)jobsFail{
    @jobs_weakify(self)
    return ^(NSError * error){
        @jobs_strongify(self)
        if (!self) return;
        [self.loadingView stopAnimating];
        if ([self.delegate respondsToSelector:@selector(markdownView:didFailWithError:)]) {
            [self.delegate markdownView:self didFailWithError:error];
        }
    };
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

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCMarkdownView
-(JobsRetJobsOCMarkdownViewByBOOLBlock _Nonnull)byRuntimeReady{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownView * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setRuntimeReady:data];
        return self;
    };
}

-(JobsRetJobsOCMarkdownViewByJobsOCMarkdownConfigurationBlock _Nonnull)byMarkdownConfiguration{
    @jobs_weakify(self)
    return ^__kindof JobsOCMarkdownView * _Nullable(JobsOCMarkdownConfiguration * _Nullable data){
        @jobs_strongify(self)
        [self setMarkdownConfiguration:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCMarkdownView
@end

@implementation JobsOCMarkdownWeakMessageHandler

-(JobsRetIDByIDBlock _Nonnull)initWithTarget{
    JobsOCMarkdownWeakMessageHandler *object = [super init];
    return ^id(id<WKScriptMessageHandler> target){
        object.byTarget(target);
        return object;
    };
}

-(JobsRetIDByIDBlock _Nonnull)byTarget{
    @jobs_weakify(self)
    return ^id(id<WKScriptMessageHandler> target){
        @jobs_strongify(self)
        self.target = target;
        return self;
    };
}

-(void)userContentController:(WKUserContentController *)userContentController
      didReceiveScriptMessage:(WKScriptMessage *)message{
    [self.target userContentController:userContentController didReceiveScriptMessage:message];
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN WKFindConfiguration
@implementation WKFindConfiguration (JobsLocalPropertyDSLAutogen_45eafab8f8)
-(JobsRetWKFindConfigurationByBOOLBlock _Nonnull)byBackwards{
    @jobs_weakify(self)
    return ^__kindof WKFindConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setBackwards:data];
        return self;
    };
}

-(JobsRetWKFindConfigurationByBOOLBlock _Nonnull)byWraps{
    @jobs_weakify(self)
    return ^__kindof WKFindConfiguration * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setWraps:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END WKFindConfiguration
