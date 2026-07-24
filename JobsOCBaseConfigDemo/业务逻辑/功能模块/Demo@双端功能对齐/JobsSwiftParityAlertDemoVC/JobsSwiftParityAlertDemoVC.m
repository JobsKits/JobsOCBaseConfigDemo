//
//  JobsSwiftParityAlertDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityAlertDemoVC.h"

@implementation JobsSwiftParityAlertDemoVC

-(NSString *)demoNavigationTitle{
    return @"UIAlert";
}

-(NSString *)demoDescription{
    return @"使用 Jobs AlertModel 生成带确认和取消动作的系统弹框。";
}

-(NSString *)demoIconName{
    return @"exclamationmark.bubble.fill";
}

-(NSString *)primaryActionTitle{
    return @"显示 UIAlert";
}

-(void)performPrimaryAction{
    @jobs_weakify(self)
    UIAlertController *alertVC = self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
        data.byAlertControllerTitle(@"UIAlert 功能演示".tr)
            .byMessage(@"使用 Jobs Alert 封装生成带确认和取消动作的系统弹框。".tr)
            .byPreferredStyle(UIAlertControllerStyleAlert)
            .byAlertActionTitle(@"确定".tr)
            .byAlertActionStyle(UIAlertActionStyleDefault)
            .byAlertActionBlock(^(UIAlertAction * _Nullable action) {
                [weak_self updateStatus:@"UIAlert 已确认"];
            })
            .byCancelAlertActionTitle(@"取消".tr)
            .byCancelAlertActionStyle(UIAlertActionStyleCancel);
    }));
    self.comingToPresentVC(alertVC);
}

@end
