//
//  JobsSwiftParityMomentsPreviewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityMomentsPreviewDemoVC.h"

@interface JobsSwiftParityMomentsPreviewDemoVC ()

Prop_strong()UITapGestureRecognizer *momentsTapGesture;

@end

@implementation JobsSwiftParityMomentsPreviewDemoVC

-(NSString *)demoNavigationTitle{
    return @"朋友圈图文浏览与图片预览";
}

-(NSString *)demoDescription{
    return @"装载朋友圈图文卡片，并在点击图片区域时切换填充 / 适配预览模式。";
}

-(NSString *)demoIconName{
    return @"photo.stack";
}

-(NSString *)primaryActionTitle{
    return @"切换图片预览模式";
}

-(void)configureDemo{
    self.previewImageView
        .byImage(@"新首页的底图".img ?: @"photo.fill".sys_img)
        .byContentMode(UIViewContentModeScaleAspectFill);
    self.previewTitleLab.byText(@"朋友圈图文卡片\n点击图片区域或下方按钮切换预览模式");
    self.previewView.byUserInteractionEnabled(YES);
    self.previewView.addGesture(self.momentsTapGesture);
    [self updateStatus:@"朋友圈图文数据已装载"];
}

-(void)performPrimaryAction{
    UIViewContentMode contentMode =
        self.previewImageView.contentMode == UIViewContentModeScaleAspectFill
        ? UIViewContentModeScaleAspectFit
        : UIViewContentModeScaleAspectFill;
    self.previewImageView.byContentMode(contentMode);
    [self updateStatus:@"朋友圈图片预览模式已切换"];
}
#pragma mark —— LazyLoad
-(UITapGestureRecognizer *)momentsTapGesture{
    if (!_momentsTapGesture) {
        @jobs_weakify(self)
        _momentsTapGesture = [jobsMakeTapGesture(^(__kindof UITapGestureRecognizer * _Nullable gesture) {
            gesture.byCancelsTouchesInView(NO);
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            [weak_self performPrimaryAction];
        }];
    };return _momentsTapGesture;
}

@end
