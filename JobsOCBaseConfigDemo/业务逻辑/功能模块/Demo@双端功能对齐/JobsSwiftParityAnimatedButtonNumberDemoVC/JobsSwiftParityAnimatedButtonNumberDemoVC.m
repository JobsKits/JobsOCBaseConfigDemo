//
//  JobsSwiftParityAnimatedButtonNumberDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityAnimatedButtonNumberDemoVC.h"

@interface JobsSwiftParityAnimatedButtonNumberDemoVC ()

Prop_strong()UIButton *animatedNumberBtn;

@end

@implementation JobsSwiftParityAnimatedButtonNumberDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"动效数字按钮";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"把按钮标题从 0 平滑递增到 2026。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"textformat.123";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"重新播放数字动效";
    };
}

-(jobsByVoidBlock _Nonnull)configureDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.previewImageView.byHidden(YES);
        self.previewTitleLab.byText(@"按钮标题数字动效");
        self.animatedNumberBtn.byHidden(NO);
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.animatedNumberBtn.jobsResetBtnTitle(@"0");
        UILabel *label = [self.animatedNumberBtn.titleLabel byAnimatedTextNumberFrom:@0
                                                                               step:nil
                                                                           duration:1.2
                                                                    minimumInterval:1.0 / 60.0
                                                                         completion:nil];
        label.byStartAnimatedTextNumber(@"2026");
        self.updateStatus(@"按钮标题正从 0 动效递增至 2026");
    };
}
#pragma mark —— LazyLoad
-(UIButton *)animatedNumberBtn{
    if (!_animatedNumberBtn) {
        _animatedNumberBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"0")
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(24))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgCor(HEXCOLOR(0xEA580C))
                .jobsResetBtnCornerRadiusValue(JobsWidth(12))
                .byClipsToBounds(YES);
        });
        _animatedNumberBtn
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.previewView);
                make.bottom.equalTo(self.previewView).inset(JobsWidth(28));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(180), JobsWidth(56)));
            });
    };return _animatedNumberBtn;
}

@end
