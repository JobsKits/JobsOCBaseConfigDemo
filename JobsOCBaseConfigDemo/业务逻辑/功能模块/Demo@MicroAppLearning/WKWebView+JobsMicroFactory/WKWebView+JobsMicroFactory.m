//
//  WKWebView+JobsMicroFactory.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "WKWebView+JobsMicroFactory.h"

@implementation WKWebView (JobsMicroFactory)

+(WKWebView *)jobsMicroWebViewWithStore:(WKWebsiteDataStore *)store handler:(id<WKScriptMessageHandler>)handler{
    WKUserContentController *controller = jobsMakeUserContentController(^(WKUserContentController *controller) {
        if (handler) {
            [controller addScriptMessageHandler:handler name:@"jobsMicro"];
        }
    });
    WKWebViewConfiguration *configuration = jobsMakeWebViewConfiguration(^(WKWebViewConfiguration *configuration) {
        configuration.byUserContentController(controller);
        // 存储配置的工厂内核；每个会话传入独立的 nonPersistentDataStore。
        [configuration setWebsiteDataStore:store];
    });
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    [webView addNotificationName:语言切换 block:^(id object, id argument) {
        if ([object isKindOfClass:WKWebView.class]) {
            ((WKWebView *)object).jobsMicroApplyHostLocalization();
        }
    }];
    return webView;
}

-(jobsByVoidBlock _Nonnull)jobsMicroApplyHostTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self.jobsMicroApplyHostLocalization();
        NSString *theme = JobsThemeCenter.shared.darkMode ? @"dark" : @"light";
        NSString *script = [NSString stringWithFormat:@"(()=>{const root=document.documentElement;if(root){root.dataset.theme='%@';root.style.colorScheme='%@';}})()", theme, theme];
        [self evaluateJavaScript:script completionHandler:nil];
    };
}

-(jobsByVoidBlock _Nonnull)jobsMicroApplyHostLocalization{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.URL.isFileURL) {
            return;
        }
        NSArray<NSString *> *keys = @[
            @"独立业务包 · learning.bridge",
            @"网页渲染 UI，宿主只开放白名单能力。草稿保存后会由 Native 写入固定命名空间。",
            @"等待调用宿主…",
            @"Jobs PWA 离线实验",
            @"Jobs 离线交互实验",
            @"离线计数 +1",
            @"当前计数：%d",
            @"Native bundled 离线包：本地文件直接加载，无 Service Worker。",
            @"把本目录的 index.html、manifest.webmanifest、sw.js 部署到同一 HTTPS 目录，即可学习真实 SW。",
            @"HTTP(S) PWA：首次在线安装 SW，重载后检查 controller，再断网普通重载。",
            @"当前环境未开放 Service Worker；WKWebView 请核对 App-Bound Domains。",
            @"来自微应用的草稿",
            @"微应用草稿",
            @"保存草稿",
            @"需要 Jobs iOS 宿主"
        ];
        NSMutableDictionary<NSString *, NSString *> *strings = NSMutableDictionary.dictionary;
        for (NSString *key in keys) {
            strings[key] = key.jobsTr();
        }
        NSDictionary *payload = @{
            @"language": LanMgr.languageCodeByAppLanguage(LanMgr.language) ?: @"en",
            @"strings": strings
        };
        NSData *data = [NSJSONSerialization dataWithJSONObject:payload options:0 error:nil];
        NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (!json.length) {
            return;
        }
        NSString *script = [NSString stringWithFormat:@"(()=>{const payload=%@;window.jobsWebLocalization=payload;if(typeof window.jobsSetLocalization==='function'){window.jobsSetLocalization(payload);}})()", json];
        [self evaluateJavaScript:script completionHandler:nil];
    };
}

@end
