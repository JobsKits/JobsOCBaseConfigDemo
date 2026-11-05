//
//  JobsMicroSessionDemoVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroSessionDemoVC.h"

/// 招聘里的“多开”在正常 iOS API 范围内可落为宿主内多账户 / profile，并非克隆其它 App。
/// 每账户独立 WKWebsiteDataStore + 业务 token/数据库目录；WKProcessPool 不是 Cookie 隔离边界。
/// 本页使用两个 nonPersistentDataStore，Cookie 在进程结束后丢弃，原生计数按账户持久化。
/// iOS 17+ 可用固定 UUID 的 dataStoreForIdentifier: 持久化 Web profile；生产 token 放 Keychain。
/// 参考：https://webkit.org/blog/14423/building-profiles-with-new-webkit-api/
@interface JobsMicroSessionDemoVC ()

Prop_strong()NSArray<WKWebView *> *sessionWebViews;
Prop_strong()JobsMicroSandboxStore *sessionStore;
Prop_strong()UILabel *sessionIdentity;
Prop_assign()NSInteger currentSession;
Prop_assign()NSInteger readGeneration;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;
-(JobsRetStrByVoidBlock _Nonnull)sessionName;
-(jobsByVoidBlock _Nonnull)writeSessionSnapshot;
-(jobsByVoidBlock _Nonnull)readSessionSnapshot;

@end

@implementation JobsMicroSessionDemoVC

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"多账户 / 会话隔离";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"两个账户各有独立 Web Cookie 仓库和原生存储目录。先写 A，再切 B 读取；退出重进后原生记录仍在，临时 Web 会话会重置。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self->_sessionStore = JobsMicroSandboxStore.new;
        self->_sessionWebViews = @[
            [WKWebView jobsMicroWebViewWithStore:WKWebsiteDataStore.nonPersistentDataStore handler:nil],
            [WKWebView jobsMicroWebViewWithStore:WKWebsiteDataStore.nonPersistentDataStore handler:nil]
        ];
        self->_sessionIdentity = [self learningLabelWithText:@"当前账户：A" secondary:NO];
        self.appendLearningView(self.sessionIdentity);
        self.appendLearningView([self learningButtonWithTitle:@"切换到账户 A" identifier:@"lab.sessionA" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self->_currentSession = 0;
            self.sessionIdentity.byText(@"当前账户：A");
            self.readSessionSnapshot();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"切换到账户 B" identifier:@"lab.sessionB" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self->_currentSession = 1;
            self.sessionIdentity.byText(@"当前账户：B");
            self.readSessionSnapshot();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"写入当前账户 +1 / Cookie" identifier:@"lab.sessionWrite" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.writeSessionSnapshot();
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"读取当前账户（验证隔离）" identifier:@"lab.sessionRead" action:^(UIButton *sender) {
            @jobs_strongify(self)
            self.readSessionSnapshot();
        }]);
        self.readSessionSnapshot();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)sessionName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        return self.currentSession == 0 ? @"account-A" : @"account-B";
    };
}

-(jobsByVoidBlock _Nonnull)writeSessionSnapshot{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSString *account = self.sessionName();
        NSString *previous = [self.sessionStore readTextForApplication:account fileName:@"counter.txt" error:nil];
        NSString *next = [NSString stringWithFormat:@"%ld", (long)previous.integerValue + 1];
        NSError *error;
        if (![self.sessionStore writeText:next application:account fileName:@"counter.txt" error:&error]) {
            self.reportLearningStatus(error.localizedDescription);
            return;
        }
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:@{NSHTTPCookieName:@"learning_session", NSHTTPCookieValue:account, NSHTTPCookieDomain:@"sessions.jobs.invalid", NSHTTPCookiePath:@"/", NSHTTPCookieSecure:@"TRUE"}];
        WKHTTPCookieStore *cookies = self.sessionWebViews[self.currentSession].configuration.websiteDataStore.httpCookieStore;
        [cookies setCookie:cookie completionHandler:^{
            @jobs_strongify(self)
            if (self) {
                self.readSessionSnapshot();
            }
        }];
    };
}

-(jobsByVoidBlock _Nonnull)readSessionSnapshot{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        NSInteger generation = ++self->_readGeneration;
        NSString *account = self.sessionName();
        NSString *count = [self.sessionStore readTextForApplication:account fileName:@"counter.txt" error:nil] ?: @"0（无数据，可点击写入）";
        WKHTTPCookieStore *cookies = self.sessionWebViews[self.currentSession].configuration.websiteDataStore.httpCookieStore;
        [cookies getAllCookies:^(NSArray<NSHTTPCookie *> *allCookies) {
            @jobs_strongify(self)
            if (!self || generation != self.readGeneration) {
                return;
            }
            NSString *value = @"空（未写入）";
            for (NSHTTPCookie *cookie in allCookies) {
                if ([cookie.name isEqualToString:@"learning_session"]) {
                    value = cookie.value;
                }
            }
            self.reportLearningStatus([NSString stringWithFormat:@"账户：%@\n原生计数：%@\nWeb Cookie：%@\n独立目录：Tenants/%@/", account, count, value, account]);
        }];
    };
}

@end
