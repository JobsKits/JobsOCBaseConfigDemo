//
//  JobsMicroAppDemoVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroAppDemoVC.h"

/// 微应用源于 Hybrid：宿主提供导航/登录/网络，HTML+JS 承载可独立发布的业务。
/// 小程序通常再加受限 JS API、包管理与审核；一个 WKWebView 本身不等同完整小程序平台。
/// 用法：先允许调用 getHostInfo，再试 forbidden，观察 Native 白名单和 requestID 回包。
/// 接入：把签名校验后的业务包加载到 WKWebView，按 appID 分配能力；禁止任意 selector/反射桥。
/// 生产需补包签名、版本回滚、origin 校验、用户授权和资源访问控制。
/// 参考：https://developer.apple.com/documentation/webkit/wkscriptmessagehandler
@interface JobsMicroAppDemoVC ()

Prop_strong()WKWebView *microWebView;
Prop_strong()NSURL *microEntryURL;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByVoidBlock _Nonnull)reloadMicroPackage;

@end

@implementation JobsMicroAppDemoVC

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"微应用 / Native-JS Bridge";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"同一个宿主加载独立 HTML 业务包。JS 只能调用宿主开放的能力；下面对比允许与拒绝两条真实消息链。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self->_microEntryURL = [self learningResourceWithName:@"index.html" directory:@"MicroApp"];
        JobsMicroWeakScriptHandler *handler = [[JobsMicroWeakScriptHandler alloc] initWithTarget:self];
        self->_microWebView = [WKWebView jobsMicroWebViewWithStore:WKWebsiteDataStore.nonPersistentDataStore handler:handler];
        self.microWebView
            .byNavigationDelegate(self)
            .byAccessibilityIdentifier(@"lab.web");
        [JobsThemeCenter.shared bindObject:self.microWebView
                                     slot:@"JobsMicroLearning.webTheme"
                                    apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            (void)center;
            ((WKWebView *)object).jobsMicroApplyHostTheme();
        }];
        self.appendLearningView(self.microWebView);
        [self.microWebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(230);
        }];
        self.appendLearningView([self learningButtonWithTitle:@"① JS 调用允许的 getHostInfo" identifier:@"lab.bridgeAllowed" action:^(UIButton *sender) {
            @jobs_strongify(self)
            [self.microWebView evaluateJavaScript:@"window.callHost('getHostInfo')" completionHandler:nil];
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"② JS 调用未授权 forbidden" identifier:@"lab.bridgeDenied" action:^(UIButton *sender) {
            @jobs_strongify(self)
            [self.microWebView evaluateJavaScript:@"window.callHost('forbidden')" completionHandler:nil];
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"重新加载业务包" identifier:@"lab.reload" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.reloadMicroPackage();
        }]);
        self.reloadMicroPackage();
    };
}

-(jobsByVoidBlock _Nonnull)reloadMicroPackage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        if (!self.microEntryURL || ![NSFileManager.defaultManager isReadableFileAtPath:self.microEntryURL.path]) {
            self.reportLearningStatus(@"业务包为空或未打包。点击重新加载，检查 JobsMicroLearning.bundle 的 target membership。");
            return;
        }
        [self.microWebView loadFileURL:self.microEntryURL allowingReadAccessToURL:self.microEntryURL.URLByDeletingLastPathComponent];
        self.reportLearningStatus(@"已加载本地微应用包 appID=learning.bridge，等待 JS 调用。");
    };
}

-(void)userContentController:(WKUserContentController *)controller didReceiveScriptMessage:(WKScriptMessage *)message{
    NSDictionary *body = [message.body isKindOfClass:NSDictionary.class] ? message.body : nil;
    NSString *requestID = [body[@"id"] isKindOfClass:NSString.class] ? body[@"id"] : nil;
    NSString *command = [body[@"command"] isKindOfClass:NSString.class] ? body[@"command"] : nil;
    NSURL *source = message.frameInfo.request.URL;
    BOOL trusted = message.frameInfo.isMainFrame && source.isFileURL && [source.URLByStandardizingPath.path isEqualToString:self.microEntryURL.URLByStandardizingPath.path];
    if (!trusted || !requestID.length || requestID.length > 64 || !command.length) {
        self.reportLearningStatus(@"已拒绝：来源或消息格式不合法。");
        return;
    }
    BOOL allowed = [command isEqualToString:@"getHostInfo"];
    NSDictionary *response = @{@"id":requestID, @"ok":@(allowed), @"result":allowed ? @"Native 已响应：Jobs iOS 宿主 / API v1" : @"已拒绝：能力不在白名单"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:response options:0 error:nil];
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [self.microWebView evaluateJavaScript:[NSString stringWithFormat:@"window.jobsReceive(%@)", json] completionHandler:nil];
    self.reportLearningStatus([NSString stringWithFormat:@"%@\nrequestID=%@\ncommand=%@", response[@"result"], requestID, command]);
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)action decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    // 把可信页面锁在本地入口；新页面不能继承这个 bridge 的权限。
    BOOL trusted = action.request.URL.isFileURL && [action.request.URL.URLByStandardizingPath.path isEqualToString:self.microEntryURL.URLByStandardizingPath.path];
    decisionHandler(trusted ? WKNavigationActionPolicyAllow : WKNavigationActionPolicyCancel);
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    self.reportLearningStatus([NSString stringWithFormat:@"加载失败：%@。可点击重新加载。", error.localizedDescription]);
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    webView.jobsMicroApplyHostTheme();
}

-(void)dealloc{
    [_microWebView.configuration.userContentController removeScriptMessageHandlerForName:@"jobsMicro"];
}

@end
