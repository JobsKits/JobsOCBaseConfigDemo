//
//  JobsSwiftParityToastDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityToastDemoVC.h"

@implementation JobsSwiftParityToastDemoVC

-(NSString *)demoNavigationTitle{
    return @"Toast";
}

-(NSString *)demoDescription{
    return @"通过 Jobs Toast 封装显示轻量提示。";
}

-(NSString *)demoIconName{
    return @"text.bubble.fill";
}

-(NSString *)primaryActionTitle{
    return @"显示 Toast";
}

-(void)performPrimaryAction{
    @"Toast 提示已显示".tr.toast();
    self.previewImageView.byImage(@"text.bubble.fill".sys_img);
    self.previewTitleLab.byText(@"Toast 已显示");
    [self updateStatus:@"Toast 能力执行完成"];
}

@end
