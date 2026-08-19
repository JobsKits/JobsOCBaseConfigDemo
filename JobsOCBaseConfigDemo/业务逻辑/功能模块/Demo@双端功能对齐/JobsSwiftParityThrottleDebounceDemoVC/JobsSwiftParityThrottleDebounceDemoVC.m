//
//  JobsSwiftParityThrottleDebounceDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityThrottleDebounceDemoVC.h"

@interface JobsSwiftParityThrottleDebounceDemoVC ()

Prop_strong()UIButton *eventBtn;

@end

@implementation JobsSwiftParityThrottleDebounceDemoVC

-(void)dealloc{
    _eventBtn.jobs_removeAllHandlers();
}

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"节流、防抖";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"连续触发 5 次事件，分别观察节流只放行一次与防抖只执行末次。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"tortoise.fill";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"模拟连续触发 5 次";
    };
}

-(jobsByVoidBlock _Nonnull)configureDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.previewImageView.byHidden(YES);
        self.previewTitleLab.byText(@"TouchDown 用节流\nTouchUpInside 用防抖");
        self.eventBtn.byHidden(NO);
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.eventBtn.jobs_removeAllHandlers();
        @jobs_weakify(self)
        [self.eventBtn jobs_on:UIControlEventTouchDown
                      throttle:0.35
                         block:^(__kindof UIControl * _Nullable ctrl) {
            weak_self.updateStatus(@"节流命中：连续事件只放行一次");
        }];
        [self.eventBtn jobs_on:UIControlEventTouchUpInside
                      debounce:0.35
                         block:^(__kindof UIControl * _Nullable ctrl) {
            weak_self.updateStatus(@"防抖命中：停止触发后执行最后一次");
        }];
        for (NSUInteger index = 0; index < 5; index++) {
            self.eventBtn.jobs_fire(UIControlEventTouchDown);
            self.eventBtn.jobs_fire(UIControlEventTouchUpInside);
        }
    };
}
#pragma mark —— LazyLoad
-(UIButton *)eventBtn{
    if (!_eventBtn) {
        _eventBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"事件接收器")
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(15))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgCor(HEXCOLOR(0x7C3AED))
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
