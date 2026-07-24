//
//  JobsSwiftParityEditProfileDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityEditProfileDemoVC.h"

@interface JobsSwiftParityEditProfileDemoVC ()

Prop_strong()UITextField *profileTF;

@end

@implementation JobsSwiftParityEditProfileDemoVC

-(NSString *)demoNavigationTitle{
    return @"编辑个人资料";
}

-(NSString *)demoDescription{
    return @"编辑昵称并保存到 UserDefaults，再次进入时自动回填。";
}

-(NSString *)demoIconName{
    return @"person.crop.circle.badge.checkmark";
}

-(NSString *)primaryActionTitle{
    return @"保存个人资料";
}

-(void)configureDemo{
    NSString *savedName = [NSUserDefaults.standardUserDefaults stringForKey:@"JobsSwiftParityEditProfileDemoVC.ProfileName"];
    self.previewImageView.byHidden(YES);
    self.previewTitleLab.byText(@"编辑昵称并保存到 UserDefaults");
    self.profileTF
        .byText(savedName)
        .byHidden(NO);
}

-(void)performPrimaryAction{
    NSString *name = self.profileTF.text.length ? self.profileTF.text : @"Jobs";
    @"JobsSwiftParityEditProfileDemoVC.ProfileName".userDefaultsByObj(name);
    [self.view endEditing:YES];
    [self updateStatus:[NSString stringWithFormat:@"个人资料已保存：%@",name]];
}
#pragma mark —— LazyLoad
-(UITextField *)profileTF{
    if (!_profileTF) {
        _profileTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"请输入昵称".tr)
                .byTextAlignment(NSTextAlignmentCenter)
                .byBgColor(UIColor.systemBackgroundColor)
                .byCornerRadius(JobsWidth(8));
        });
        _profileTF
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.previewView).inset(JobsWidth(24));
                make.top.equalTo(self.previewTitleLab.mas_bottom).offset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(44));
            });
    };return _profileTF;
}

@end
