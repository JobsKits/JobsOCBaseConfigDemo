//
//  JobsSwiftParityOpenDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityOpenDemoVC.h"

@implementation JobsSwiftParityOpenDemoVC

-(NSString *)demoNavigationTitle{
    return @"JobsOpen";
}

-(NSString *)demoDescription{
    return @"通过 JobsOCOpen 统一入口打开外部 URL。";
}

-(NSString *)demoIconName{
    return @"arrow.up.right.square.fill";
}

-(NSString *)primaryActionTitle{
    return @"打开 Apple 官网";
}

-(void)performPrimaryAction{
    JobsOCOpenResult result = @"https://www.apple.com".jobs_open;
    self.previewImageView.byImage(@"arrow.up.right.square".sys_img);
    self.previewTitleLab.byText(@"JobsOpen：打开 https://www.apple.com");
    [self updateStatus:result == JobsOCOpenResultOpened ? @"JobsOpen 已受理" : @"JobsOpen 无法打开目标"];
}

@end
