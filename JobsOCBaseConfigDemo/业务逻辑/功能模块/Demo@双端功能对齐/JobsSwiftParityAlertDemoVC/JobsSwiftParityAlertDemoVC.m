//
//  JobsSwiftParityAlertDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityAlertDemoVC.h"

@implementation JobsSwiftParityAlertDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"UIAlert";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"使用 Jobs AlertModel 生成带确认和取消动作的系统弹框。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"exclamationmark.bubble.fill";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"显示 UIAlert";
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        UIAlertController *alertVC = self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
            data.byAlertControllerTitle(@"UIAlert 功能演示".jobsTr())
                .byMessage(@"使用 Jobs Alert 封装生成带确认和取消动作的系统弹框。".jobsTr())
                .byPreferredStyle(UIAlertControllerStyleAlert)
                .byAlertActionTitle(@"确定".jobsTr())
                .byAlertActionStyle(UIAlertActionStyleDefault)
                .byAlertActionBlock(^(UIAlertAction * _Nullable action) {
                    weak_self.updateStatus(@"UIAlert 已确认");
                })
                .byCancelAlertActionTitle(@"取消".jobsTr())
                .byCancelAlertActionStyle(UIAlertActionStyleCancel);
        }));
        self.comingToPresentVC(alertVC);
    };
}

@end
