//
//  JobsOCDeviceGuardBlockedVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsOCDeviceGuardBlockedVC.h"

@interface JobsOCDeviceGuardBlockedVC ()

Prop_strong()UIView *messageContainer;
Prop_strong()UIImageView *shieldImageView;
Prop_strong()UILabel *titleLabel;
Prop_strong()UILabel *messageLabel;
Prop_strong()UILabel *detailLabel;

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad;
-(jobsByVoidBlock _Nonnull)applyGuardTheme;

@end

@implementation JobsOCDeviceGuardBlockedVC

-(instancetype)initWithReport:(JobsOCDeviceGuardReport *)report {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _report = report;
    }
    return self;
}

-(void)dealloc {
    [JobsThemeCenter.shared unbindObject:self slot:@"JobsOCDeviceGuardBlockedVC.theme"];
}

-(void)viewDidLoad {
    jobsByVoidBlock action =
        ((jobsByVoidBlock (*)(__typeof__(self), SEL))
         JobsBlockInstanceMethodIMP(JobsOCDeviceGuardBlockedVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) {
        action();
    }
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        [super viewDidLoad];
        // 被拦分支只准备主题资源，不调用AppDelegate的业务初始化。
        NSError *themeError = nil;
        [JobsThemeCenter.shared configureWithResource:@"JobsThemeResources"
                                       fileExtension:@"json"
                                              bundle:NSBundle.mainBundle
                                               error:&themeError];
        self.view.byAccessibilityIdentifier(@"JobsDeviceGuardBlockedRoot");
        self.messageContainer.byHidden(NO);
        self.shieldImageView.byHidden(NO);
        self.titleLabel.byHidden(NO);
        self.messageLabel.byHidden(NO);
        self.detailLabel.byHidden(NO);
        [JobsThemeCenter.shared bindObject:self
                                     slot:@"JobsOCDeviceGuardBlockedVC.theme"
                                    apply:^(__kindof NSObject *object, JobsThemeCenter *center) {
            (void)center;
            ((JobsOCDeviceGuardBlockedVC *)object).applyGuardTheme();
        }];
    };
}

-(jobsByVoidBlock _Nonnull)applyGuardTheme {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        JobsThemeCenter *center = JobsThemeCenter.shared;
        self.view.byBgColor(center.resolvedColorForKey(JobsThemeColorKeyBackgroundPrimary));
        self.titleLabel.byTextCor(center.resolvedColorForKey(JobsThemeColorKeyTextPrimary));
        self.messageLabel.byTextCor(center.resolvedColorForKey(JobsThemeColorKeyTextPrimary));
        self.detailLabel.byTextCor(center.resolvedColorForKey(JobsThemeColorKeyTextPrimary));
        self.shieldImageView.byTintColor(center.resolvedColorForKey(JobsThemeColorKeyTextPrimary));
    };
}

-(UIView *)messageContainer {
    if (!_messageContainer) {
        _messageContainer = jobsMakeView(^(__kindof UIView *view) {
            view.addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self.view);
                    make.left.equalTo(self.view).offset(28);
                    make.right.equalTo(self.view).offset(-28);
                });
        });
    }
    return _messageContainer;
}

-(UIImageView *)shieldImageView {
    if (!_shieldImageView) {
        _shieldImageView = jobsMakeImageView(^(__kindof UIImageView *imageView) {
            imageView.byImage(@"JobsDeviceGuardShield".img)
                .byContentMode(UIViewContentModeScaleAspectFit)
                .addOn(self.messageContainer)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.centerX.equalTo(self.messageContainer);
                    make.size.mas_equalTo(CGSizeMake(76, 76));
                });
        });
    }
    return _shieldImageView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"设备安全限制")
                .byFont(UIFontWeightBoldSize(24))
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .byAccessibilityIdentifier(@"JobsDeviceGuardBlockedTitle")
                .addOn(self.messageContainer)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.shieldImageView.mas_bottom).offset(24);
                    make.left.right.equalTo(self.messageContainer);
                });
        });
    }
    return _titleLabel;
}

-(UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(self.report.isJailbroken ?
                    @"检测到越狱特征，当前设备无法继续使用本应用。" :
                    @"当前设备环境不符合应用安全策略，暂时无法继续。")
                .byFont(UIFontWeightRegularSize(17))
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.messageContainer)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.titleLabel.mas_bottom).offset(18);
                    make.left.right.equalTo(self.messageContainer);
                });
        });
    }
    return _messageLabel;
}

-(UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"本次启动已停止业务初始化。请恢复可信设备环境后重新启动应用。")
                .byFont(UIFontWeightRegularSize(15))
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self.messageContainer)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.messageLabel.mas_bottom).offset(20);
                    make.left.right.bottom.equalTo(self.messageContainer);
                });
        });
    }
    return _detailLabel;
}

@end
