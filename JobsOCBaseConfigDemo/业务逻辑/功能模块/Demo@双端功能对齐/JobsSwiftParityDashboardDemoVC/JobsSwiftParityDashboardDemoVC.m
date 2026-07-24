//
//  JobsSwiftParityDashboardDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityDashboardDemoVC.h"

@interface JobsSwiftParityDashboardDemoVC ()

Prop_strong()UIProgressView *dashboardProgressView;

@end

@implementation JobsSwiftParityDashboardDemoVC

-(NSString *)demoNavigationTitle{
    return @"仪表盘";
}

-(NSString *)demoDescription{
    return @"随机生成仪表盘进度并同步更新数值与动画。";
}

-(NSString *)demoIconName{
    return @"speedometer";
}

-(NSString *)primaryActionTitle{
    return @"刷新仪表盘数据";
}

-(void)configureDemo{
    self.dashboardProgressView.byHidden(NO);
}

-(void)performPrimaryAction{
    CGFloat progress = (CGFloat)arc4random_uniform(81) / 100.0 + 0.2;
    self.previewImageView.byImage(@"speedometer".sys_img);
    self.previewTitleLab.byText([NSString stringWithFormat:@"仪表盘：%.0f%%",progress * 100]);
    self.dashboardProgressView.byProgressAnimated(progress,YES);
    [self updateStatus:@"仪表盘数据已刷新"];
}
#pragma mark —— LazyLoad
-(UIProgressView *)dashboardProgressView{
    if (!_dashboardProgressView) {
        _dashboardProgressView = jobsMakeProgressView(^(__kindof UIProgressView * _Nullable progressView) {
            progressView
                .byProgressViewStyle(UIProgressViewStyleDefault)
                .byProgressTintColor(HEXCOLOR(0x22C55E))
                .byTrackTintColor(HEXCOLOR(0xD1D5DB));
        });
        _dashboardProgressView
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.previewView).inset(JobsWidth(30));
                make.bottom.equalTo(self.previewView).inset(JobsWidth(24));
            });
    };return _dashboardProgressView;
}

@end
