//
//  JobsMicroPlatformDemoVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroPlatformDemoVC.h"

/// mPaaS = mobile Platform as a Service：把容器、包管理、路由、网关、日志等共性能力平台化。
/// 本例是“架构适配练习”，未接入支付宝 mPaaS / Nebula 商用 SDK，不能当成真实 SDK 使用经验。
/// 用法：本地目录立即可见；刷新请求 {"apps":[{"appId":"learning.bridge","name":"...","version":"1.0"}]}。
/// 接入点：把 JobsMicroPlatformProviding 实现替换为真实平台的目录 / 包下载 / 开启服务。
/// 商用接入通常为控制台建应用和 .config → 官方 Pod/基线 → 初始化 Nebula → 发布 appId 离线包 → startTinyAppWithId。
/// 生产需证书、签名校验、灰度、回滚、网关鉴权与隐私审批；不要用本地类名映射执行服务端任意类。
/// 参考：https://help.aliyun.com/zh/document_detail/106682.html
@interface JobsMicroPlatformDemoVC ()

Prop_strong()id<JobsMicroPlatformProviding> platformProvider;
Prop_strong()UITextField *platformURL;
Prop_strong()UILabel *platformCatalog;
Prop_strong()NSArray<NSDictionary *> *platformApps;
Prop_assign()NSInteger catalogGeneration;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(jobsByVoidBlock _Nonnull)renderPlatformCatalog;
-(jobsByVoidBlock _Nonnull)refreshPlatformCatalog;
-(jobsByVoidBlock _Nonnull)openFirstPlatformApp;

@end

@implementation JobsMicroPlatformDemoVC

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"mPaaS / 平台适配教学";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"未接商用 SDK。这里用“能力协议 + 服务端目录 + appID 白名单路由”学习 mPaaS 的分层；API 失败立即回退本地。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self->_platformProvider = JobsMicroPlatformProvider.new;
        self->_platformApps = JobsMicroPlatformProvider.localCatalog();
        self->_platformURL = [self learningFieldWithText:@"https://example.invalid/api/microapps" placeholder:@"自有 HTTPS 目录 API" identifier:@"lab.mpaasURL"];
        self->_platformCatalog = [self learningLabelWithText:@"" secondary:NO];
        self.appendLearningView(self.platformURL);
        self.appendLearningView(self.platformCatalog);
        self.appendLearningView([self learningButtonWithTitle:@"刷新平台目录 / 重试 API" identifier:@"lab.reload" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.refreshPlatformCatalog();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"按 appID 打开目录第一项" identifier:@"lab.mpaasOpen" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.openFirstPlatformApp();
        }]);
        self.renderPlatformCatalog();
        self.refreshPlatformCatalog();
    };
}

-(jobsByVoidBlock _Nonnull)renderPlatformCatalog{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSMutableArray *lines = NSMutableArray.array;
        for (NSDictionary *app in self.platformApps) {
            [lines addObject:[NSString stringWithFormat:@"%@ · %@ · v%@", app[@"name"], app[@"appId"], app[@"version"]]];
        }
        self.platformCatalog.byText(lines.count ? [lines componentsJoinedByString:@"\n\n"] : @"暂无微应用\n点击“刷新平台目录 / 重试 API”重新加载。");
    };
}

-(jobsByVoidBlock _Nonnull)refreshPlatformCatalog{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSURL *URL = [NSURL URLWithString:self.platformURL.text];
        if (![URL.scheme.lowercaseString isEqualToString:@"https"] || !URL.host.length || URL.user.length || URL.password.length) {
            self.reportLearningStatus(@"目录地址必须是有效 HTTPS URL。请修改后重试。");
            return;
        }
        NSInteger generation = ++self->_catalogGeneration;
        self.reportLearningStatus(@"正在请求 API；当前可先体验本地目录。超时 1.5 秒。");
        [self.platformProvider fetchCatalogFromURL:URL completion:^(id payload) {
            @jobs_strongify(self)
            if (!self || generation != self.catalogGeneration) {
                return;
            }
            NSDictionary *result = payload;
            self->_platformApps = result[@"apps"];
            self.renderPlatformCatalog();
            self.reportLearningStatus([NSString stringWithFormat:@"目录来源：%@\n共 %lu 项；可按 appID 打开。", result[@"source"], (unsigned long)self.platformApps.count]);
        }];
    };
}

-(jobsByVoidBlock _Nonnull)openFirstPlatformApp{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSString *appID = self.platformApps.firstObject[@"appId"];
        NSDictionary *routes = @{@"learning.bridge":JobsMicroAppDemoVC.class, @"learning.sandbox":JobsMicroSandboxDemoVC.class, @"learning.pwa":JobsMicroPWADemoVC.class};
        Class controllerClass = routes[appID ?: @""];
        if (!controllerClass) {
            self.reportLearningStatus(@"目录为空，或 appID 不在宿主路由白名单。请刷新目录。");
            return;
        }
        [self.navigationController pushViewController:[controllerClass new] animated:YES];
    };
}

@end
