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
    return [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
}

-(jobsByVoidBlock _Nonnull)jobsMicroApplyHostTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSString *theme = JobsThemeCenter.shared.darkMode ? @"dark" : @"light";
        NSString *script = [NSString stringWithFormat:@"(()=>{const root=document.documentElement;if(root){root.dataset.theme='%@';root.style.colorScheme='%@';}})()", theme, theme];
        [self evaluateJavaScript:script completionHandler:nil];
    };
}

@end
