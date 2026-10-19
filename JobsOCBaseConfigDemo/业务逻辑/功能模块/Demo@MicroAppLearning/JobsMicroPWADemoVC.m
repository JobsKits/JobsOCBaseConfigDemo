//
//  JobsMicroPWADemoVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroPWADemoVC.h"

/// PWA = 渐进式 Web 应用：manifest 描述安装信息，Service Worker 用 Cache Storage 管离线请求。
/// 历史：在线 H5 → 原生离线包 → 可信 origin 上的 SW 生命周期；二者不能混称。
/// 本页 file:// 入口是 Native 本地包演示，不会注册 SW。index/manifest/sw 可原样部署同一 HTTPS 目录。
/// 真 PWA：填写自有 HTTPS index.html → 首次在线安装 SW → 重载获得 controller → 断网再重载验证。
/// WKWebView 的 SW 可用性还受系统版本 / App-Bound Domains 配置限制；自有域部署需按 Apple 文档配置。
/// “查看状态”读取真实注册/Cache API，不能用 navigator.onLine 证明离线命中；在线失败回退本地包。
/// 生产：离线包签名和原子激活、缓存版本清理、敏感 API 不缓存、HTTPS、后台执行限制。
/// 参考：https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerContainer/register
/// 参考：https://webkit.org/blog/10882/app-bound-domains/
@interface JobsMicroPWADemoVC ()

Prop_strong()WKWebView *pwaWebView;
Prop_strong()UITextField *pwaURL;
Prop_strong()NSURL *nativeOfflineDirectory;
Prop_assign()BOOL loadingNativeOffline;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByVoidBlock _Nonnull)loadNativeOfflinePackage;
-(jobsByVoidBlock _Nonnull)loadHTTPSPWA;
-(jobsByVoidBlock _Nonnull)inspectPWAState;

@end

@implementation JobsMicroPWADemoVC

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"PWA / 离线资源";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"内置包可直接断网使用，属于 Native 离线资源。真实 Service Worker 需可信 HTTP(S) origin；输入自有 HTTPS 部署地址后查看实际注册和缓存。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSURL *support = [NSFileManager.defaultManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;
        self->_nativeOfflineDirectory = [[support URLByAppendingPathComponent:@"JobsMicroLearning" isDirectory:YES] URLByAppendingPathComponent:@"NativeOffline-v1" isDirectory:YES];
        self->_pwaURL = [self learningFieldWithText:@"" placeholder:@"自有 HTTPS 地址，例如 https://your-domain/pwa/" identifier:@"lab.pwaURL"];
        self.appendLearningView(self.pwaURL);
        self.appendLearningView([self learningButtonWithTitle:@"加载 HTTPS PWA（先部署资源）" identifier:@"lab.pwaOnline" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.loadHTTPSPWA();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"打开 / 重载本地离线包" identifier:@"lab.pwaOffline" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.loadNativeOfflinePackage();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"查看 SW / Cache 真实状态" identifier:@"lab.pwaInspect" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.inspectPWAState();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"重置本地离线包（重新从 bundle 安装）" identifier:@"lab.pwaReset" action:^(UIButton *sender) {
            @jobs_strongify(self)
            NSError *error;
            if ([NSFileManager.defaultManager fileExistsAtPath:self.nativeOfflineDirectory.path]) {
                [NSFileManager.defaultManager removeItemAtURL:self.nativeOfflineDirectory error:&error];
            }
            if (error) {
                self.reportLearningStatus(error.localizedDescription);
                return;
            }
            self.loadNativeOfflinePackage();
        }]);
        self->_pwaWebView = [WKWebView jobsMicroWebViewWithStore:WKWebsiteDataStore.nonPersistentDataStore handler:nil];
        self.pwaWebView
            .byNavigationDelegate(self)
            .byAccessibilityIdentifier(@"lab.web");
        [JobsThemeCenter.shared bindObject:self.pwaWebView
                                     slot:@"JobsMicroLearning.webTheme"
                                    apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            (void)center;
            ((WKWebView *)object).jobsMicroApplyHostTheme();
        }];
        self.appendLearningView(self.pwaWebView);
        [self.pwaWebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(300);
        }];
        self.loadNativeOfflinePackage();
    };
}

-(jobsByVoidBlock _Nonnull)loadNativeOfflinePackage{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [self.pwaWebView stopLoading];
        NSURL *source = [[self learningResourceWithName:@"index.html" directory:@"PWA"] URLByDeletingLastPathComponent];
        NSError *error;
        if (![NSFileManager.defaultManager fileExistsAtPath:self.nativeOfflineDirectory.path]) {
            [NSFileManager.defaultManager createDirectoryAtURL:self.nativeOfflineDirectory.URLByDeletingLastPathComponent withIntermediateDirectories:YES attributes:nil error:&error];
            if (!error && source) {
                [NSFileManager.defaultManager copyItemAtURL:source toURL:self.nativeOfflineDirectory error:&error];
            }
        }
        NSURL *entry = [self.nativeOfflineDirectory URLByAppendingPathComponent:@"index.html"];
        if (error || ![NSFileManager.defaultManager isReadableFileAtPath:entry.path]) {
            self.reportLearningStatus([NSString stringWithFormat:@"离线包不可用：%@。点击重置重新安装。", error.localizedDescription ?: @"资源缺失"]);
            return;
        }
        self->_loadingNativeOffline = YES;
        [self.pwaWebView loadFileURL:entry allowingReadAccessToURL:self.nativeOfflineDirectory];
        self.reportLearningStatus(@"Native 离线包 v1 已加载，无需联网。file:// 不提供 Service Worker 注册。网页计数可点击体验；查看状态可核对模式。");
    };
}

-(jobsByVoidBlock _Nonnull)loadHTTPSPWA{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSURL *URL = [NSURL URLWithString:self.pwaURL.text];
        if (![URL.scheme.lowercaseString isEqualToString:@"https"] || !URL.host.length || URL.user.length || URL.password.length) {
            self.reportLearningStatus(@"请输入自有 HTTPS PWA 入口，再点击加载。需要把 PWA 目录的三个文件一起部署。");
            return;
        }
        self->_loadingNativeOffline = NO;
        self.reportLearningStatus(@"正在加载 HTTPS 页面。失败后自动回退本地包；成功后点击查看真实 SW / Cache 状态。");
        [self.pwaWebView loadRequest:[NSURLRequest requestWithURL:URL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:2]];
    };
}

-(jobsByVoidBlock _Nonnull)inspectPWAState{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [self.pwaWebView callAsyncJavaScript:@"return await (async()=>{let r={origin:location.origin,secure:window.isSecureContext,mode:location.protocol==='file:'?'Native offline (非 SW)':'HTTPS PWA',controller:!!navigator.serviceWorker?.controller};try{r.registrations=navigator.serviceWorker?(await navigator.serviceWorker.getRegistrations()).map(x=>({scope:x.scope,state:x.active?.state||x.installing?.state||'waiting'})):[];r.caches=window.caches?await caches.keys():[];}catch(e){r.error=String(e)}return JSON.stringify(r,null,2)})()" arguments:@{} inFrame:nil inContentWorld:WKContentWorld.pageWorld completionHandler:^(id result, NSError *error) {
            @jobs_strongify(self)
            if (self) {
                self.reportLearningStatus(error ? [NSString stringWithFormat:@"状态读取失败：%@，可重载后重试。", error.localizedDescription] : [NSString stringWithFormat:@"实际运行状态：\n%@", result]);
            }
        }];
    };
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    if (error.code == NSURLErrorCancelled) {
        return;
    }
    if (!self.loadingNativeOffline) {
        self.loadNativeOfflinePackage();
        self.reportLearningStatus([NSString stringWithFormat:@"HTTPS 加载失败，已回退 Native 离线包：%@", error.localizedDescription]);
    }
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    webView.jobsMicroApplyHostTheme();
}

@end
