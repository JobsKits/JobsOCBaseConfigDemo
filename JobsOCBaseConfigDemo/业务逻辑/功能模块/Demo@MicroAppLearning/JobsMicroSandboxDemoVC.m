//
//  JobsMicroSandboxDemoVC.m
//  JobsMicroAppLearning
//
//  Created by Jobs on 2026年10月19日，星期一.
//

#import "JobsMicroSandboxDemoVC.h"

/// iOS OS 沙箱由系统强制限制 App 访问；本页目录分区是宿主自己的逻辑隔离。
/// 演进：单业务 Documents → 多业务按 appID 分区 → 独立授权 / 配额 / 加密 / 审计。
/// 用法：改写内容、写入 A、读取 B、尝试 ../ 越界；相同文件名不会串数据。
/// 接入：所有微应用文件请求必须经过此类可信宿主服务，不向 JS 暴露绝对路径或任意原生执行。
/// 生产还需处理配额、备份策略、Data Protection、符号链接 / TOCTOU；本例不是任意代码安全执行容器。
/// 参考：https://support.apple.com/guide/security/security-of-runtime-process-sec15bfe098e/web
@interface JobsMicroSandboxDemoVC ()

Prop_strong()JobsMicroSandboxStore *sandboxStore;
Prop_strong()UITextField *sandboxText;

-(JobsRetStrByVoidBlock _Nonnull)learningTitle;
-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction;
-(jobsByVoidBlock _Nonnull)buildLearningContent;

@end

@implementation JobsMicroSandboxDemoVC

-(JobsRetStrByVoidBlock _Nonnull)learningTitle{
    return ^NSString *{
        return @"沙箱 / 逻辑目录隔离";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)learningIntroduction{
    return ^NSString *{
        return @"系统沙箱保护整个 App。这里在 App 容器内再按 appID 隔离文件访问，亲手验证 A 写入、B 不可见、../ 被拒绝。";
    };
}

-(jobsByVoidBlock _Nonnull)buildLearningContent{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self->_sandboxStore = JobsMicroSandboxStore.new;
        self->_sandboxText = [self learningFieldWithText:@"这是业务 A 的私有草稿" placeholder:@"输入草稿内容" identifier:@"lab.sandboxText"];
        self.appendLearningView(self.sandboxText);
        self.appendLearningView([self learningButtonWithTitle:@"① 写入 A / draft.txt" identifier:@"lab.sandboxWrite" action:^(UIButton *sender) {
            @jobs_strongify(self)
            NSError *error;
            BOOL ok = [self.sandboxStore writeText:self.sandboxText.text ?: @"" application:@"sandbox-A" fileName:@"draft.txt" error:&error];
            self.reportLearningStatus(ok ? @"写入成功：Tenants/sandbox-A/draft.txt" : error.localizedDescription);
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"② 读取 A / draft.txt" identifier:@"lab.sandboxRead" action:^(UIButton *sender) {
            @jobs_strongify(self)
            [self showSandboxForApplication:@"sandbox-A" fileName:@"draft.txt"];
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"③ 读取 B 的同名文件" identifier:@"lab.sandboxOther" action:^(UIButton *sender) {
            @jobs_strongify(self)
            [self showSandboxForApplication:@"sandbox-B" fileName:@"draft.txt"];
        }]);
        self.appendLearningView([self learningButtonWithTitle:@"④ 尝试 ../sandbox-A/draft.txt" identifier:@"lab.sandboxEscape" action:^(UIButton *sender) {
            @jobs_strongify(self)
            [self showSandboxForApplication:@"sandbox-B" fileName:@"../sandbox-A/draft.txt"];
        }]);
    };
}

-(void)showSandboxForApplication:(NSString *)appID fileName:(NSString *)fileName{
    NSError *error;
    NSString *value = [self.sandboxStore readTextForApplication:appID fileName:fileName error:&error];
    self.reportLearningStatus(value ? [NSString stringWithFormat:@"%@ 读取成功：\n%@", appID, value] : [NSString stringWithFormat:@"%@\n%@\n可返回 A 写入后重新读取。", appID, error.code == NSFileReadNoSuchFileError ? @"无数据：该业务还没有自己的文件" : error.localizedDescription]);
}

@end
