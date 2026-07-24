//
//  JobsSwiftParityControlEventsDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityControlEventsDemoVC.h"

@interface JobsSwiftParityControlEventsDemoVC ()

Prop_strong()UIButton *eventBtn;
Prop_assign()NSUInteger controlEventCount;

@end

@implementation JobsSwiftParityControlEventsDemoVC

-(void)dealloc{
    [_eventBtn jobs_removeAllHandlers];
}

-(NSString *)demoNavigationTitle{
    return @"ControlEvents";
}

-(NSString *)demoDescription{
    return @"程序化触发 TouchDown 与 TouchUpInside，并验证 once / on 语义。";
}

-(NSString *)demoIconName{
    return @"gamecontroller.fill";
}

-(NSString *)primaryActionTitle{
    return @"程序化触发 ControlEvents";
}

-(void)configureDemo{
    self.previewImageView.byHidden(YES);
    self.previewTitleLab.byText(@"TouchDown 仅响应一次\nTouchUpInside 持续累计");
    self.eventBtn.byHidden(NO);
}

-(void)performPrimaryAction{
    self.controlEventCount = 0;
    [self.eventBtn jobs_removeAllHandlers];
    @jobs_weakify(self)
    [self.eventBtn jobs_once:UIControlEventTouchDown
                       block:^(__kindof UIControl * _Nullable ctrl) {
        [weak_self updateStatus:@"ControlEvents：TouchDown 只响应一次"];
    }];
    [self.eventBtn jobs_on:UIControlEventTouchUpInside
                     block:^(__kindof UIControl * _Nullable ctrl) {
        weak_self.controlEventCount += 1;
        [weak_self updateStatus:[NSString stringWithFormat:@"ControlEvents：TouchUpInside 第 %lu 次",
                                 (unsigned long)weak_self.controlEventCount]];
    }];
    [self.eventBtn jobs_fire:UIControlEventTouchDown];
    [self.eventBtn jobs_fire:UIControlEventTouchDown];
    [self.eventBtn jobs_fire:UIControlEventTouchUpInside];
}
#pragma mark —— LazyLoad
-(UIButton *)eventBtn{
    if (!_eventBtn) {
        _eventBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"事件接收器")
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgCor(HEXCOLOR(0x0891B2))
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .byClipsToBounds(YES);
        });
        _eventBtn
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.previewView);
                make.bottom.equalTo(self.previewView).inset(JobsWidth(28));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(180), JobsWidth(48)));
            });
    };return _eventBtn;
}

@end
