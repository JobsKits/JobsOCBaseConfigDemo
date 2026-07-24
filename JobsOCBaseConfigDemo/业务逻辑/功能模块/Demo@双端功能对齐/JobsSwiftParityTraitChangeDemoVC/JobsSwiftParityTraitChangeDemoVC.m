//
//  JobsSwiftParityTraitChangeDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityTraitChangeDemoVC.h"

@implementation JobsSwiftParityTraitChangeDemoVC

-(NSString *)demoNavigationTitle{
    return @"TraitChange";
}

-(NSString *)demoDescription{
    return @"主动切换深浅色外观，并在 Trait 变化回调中反馈当前模式。";
}

-(NSString *)demoIconName{
    return @"circle.lefthalf.fill";
}

-(NSString *)primaryActionTitle{
    return @"切换深色 / 浅色模式";
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    [super traitCollectionDidChange:previousTraitCollection];
    if (previousTraitCollection.userInterfaceStyle == self.traitCollection.userInterfaceStyle) return;
    NSString *style = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? @"深色" : @"浅色";
    [self updateStatus:[NSString stringWithFormat:@"TraitChange 已响应：%@模式",style]];
}

-(void)performPrimaryAction{
    UIUserInterfaceStyle currentStyle = self.view.window.overrideUserInterfaceStyle;
    UIUserInterfaceStyle targetStyle =
        currentStyle == UIUserInterfaceStyleDark
        ? UIUserInterfaceStyleLight
        : UIUserInterfaceStyleDark;
    self.view.window.byOverrideUserInterfaceStyle(targetStyle);
    self.previewImageView.byImage(@"circle.lefthalf.fill".sys_img);
    self.previewTitleLab.byText(targetStyle == UIUserInterfaceStyleDark ? @"目标：深色模式" : @"目标：浅色模式");
    [self updateStatus:@"已请求 TraitChange"];
}

@end
