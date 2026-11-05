//
//  JobsDeviceGuardDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import "JobsDeviceGuardDemoVC.h"

@interface JobsDeviceGuardDemoVC ()

Prop_strong()UIScrollView *guardScrollView;
Prop_strong()UIView *guardContentView;
Prop_strong()UILabel *guardIntroLabel;
Prop_strong()UILabel *guardReportLabel;
Prop_strong()UIButton *readOnlyButton;
Prop_strong()UIButton *writeProbeButton;
Prop_strong()UIButton *sensitiveActionButton;
Prop_assign()BOOL detecting;

@end

@implementation JobsDeviceGuardDemoVC

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle {
    return ^NSString * {
        return @"设备安全与越狱检测";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription {
    return ^NSString * {
        return @"多信号证据、重新检测与业务访问策略";
    };
}

-(jobsByVoidBlock _Nonnull)configureDemo {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self.parityScrollView.byRemove();
        self.guardScrollView.byHidden(NO);
        self.guardContentView.byHidden(NO);
        self.guardIntroLabel.byHidden(NO);
        self.readOnlyButton.byHidden(NO);
        self.writeProbeButton.byHidden(NO);
        self.sensitiveActionButton.byHidden(NO);
        self.guardReportLabel.byText(@"尚未检测。点击上方按钮开始；检测报告将在这里逐项展示。");
    };
}

-(void)runDetectionWithWriteProbe:(BOOL)writeProbe gateSensitiveAction:(BOOL)gate {
    if (_detecting) {
        return;
    }
    _detecting = YES;
    self.readOnlyButton.byEnabled(NO);
    self.writeProbeButton.byEnabled(NO);
    self.sensitiveActionButton.byEnabled(NO);
    self.guardReportLabel.byText(@"正在后台检测设备环境……");
    JobsOCDeviceGuardConfiguration *configuration = JobsOCDeviceGuardConfiguration.defaultConfiguration()
        .bySandboxWriteProbeEnabled(writeProbe);
    @jobs_weakify(self)
    [JobsOCDeviceGuardDetector detectAsyncWithConfiguration:configuration completion:^(JobsOCDeviceGuardReport *report) {
        @jobs_strongify(self)
        if (!self) {
            return;
        }
        self->_detecting = NO;
        NSString *action = gate ? (report.shouldRestrict ? @"业务门禁演示：已拒绝本次敏感操作。\n\n" : @"业务门禁演示：允许继续本地示例操作。\n\n") : @"";
        self.guardReportLabel.byText([action stringByAppendingString:report.summaryText]);
        self.readOnlyButton.byEnabled(YES);
        self.writeProbeButton.byEnabled(YES);
        self.sensitiveActionButton.byEnabled(YES);
    }];
}

-(UIScrollView *)guardScrollView {
    if (!_guardScrollView) {
        _guardScrollView = jobsMakeScrollView(^(__kindof UIScrollView *scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                    make.left.right.bottom.equalTo(self.view);
                });
        });
    }
    return _guardScrollView;
}

-(UIView *)guardContentView {
    if (!_guardContentView) {
        _guardContentView = jobsMakeView(^(__kindof UIView *view) {
            view.addOn(self.guardScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.guardScrollView);
                    make.width.equalTo(self.guardScrollView);
                });
        });
    }
    return _guardContentView;
}

-(UILabel *)guardIntroLabel {
    if (!_guardIntroLabel) {
        _guardIntroLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"组件在 App 运行后检测，无法阻止 iOS 安装。\n只读检查默认启用；写入探测需单独点击，会尝试创建并立即删除沙盒外测试文件。\n模拟器、Mac Catalyst、Mac上的iOS App返回不支持。单类别命中仅可疑，多类别才判越狱；失败与未完成不会当作通过。本地检测可能被绕过。")
                .byFont(UIFontWeightRegularSize(15))
                .byNumberOfLines(0)
                .byTextColor(JobsLabelColor)
                .addOn(self.guardContentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.left.equalTo(self.guardContentView).offset(JobsWidth(20));
                    make.right.equalTo(self.guardContentView).offset(-JobsWidth(20));
                });
        });
    }
    return _guardIntroLabel;
}

-(UIButton *)readOnlyButton {
    if (!_readOnlyButton) {
        @jobs_weakify(self)
        _readOnlyButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.jobsResetBtnTitle(@"重新检测（只读）")
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton *sender) {
                    @jobs_strongify(self)
                    if (self) {
                        [self runDetectionWithWriteProbe:NO gateSensitiveAction:NO];
                    }
                })
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.guardContentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.guardIntroLabel.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.guardIntroLabel);
                    make.height.mas_equalTo(JobsWidth(48));
                });
        });
    }
    return _readOnlyButton;
}

-(UIButton *)writeProbeButton {
    if (!_writeProbeButton) {
        @jobs_weakify(self)
        _writeProbeButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.jobsResetBtnTitle(@"检测并尝试沙盒外写入")
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton *sender) {
                    @jobs_strongify(self)
                    if (self) {
                        [self runDetectionWithWriteProbe:YES gateSensitiveAction:NO];
                    }
                })
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.guardContentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.readOnlyButton.mas_bottom).offset(JobsWidth(12));
                    make.left.right.height.equalTo(self.readOnlyButton);
                });
        });
    }
    return _writeProbeButton;
}

-(UIButton *)sensitiveActionButton {
    if (!_sensitiveActionButton) {
        @jobs_weakify(self)
        _sensitiveActionButton = jobsMakeButton(^(__kindof UIButton *button) {
            button.jobsResetBtnTitle(@"模拟敏感操作（先复检）")
                .jobsResetBtnTitleCor(JobsLabelColor)
                .jobsResetBtnTitleFont(UIFontWeightBoldSize(16))
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton *sender) {
                    @jobs_strongify(self)
                    if (self) {
                        [self runDetectionWithWriteProbe:NO gateSensitiveAction:YES];
                    }
                })
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .addOn(self.guardContentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.writeProbeButton.mas_bottom).offset(JobsWidth(12));
                    make.left.right.height.equalTo(self.readOnlyButton);
                });
        });
    }
    return _sensitiveActionButton;
}

-(UILabel *)guardReportLabel {
    if (!_guardReportLabel) {
        _guardReportLabel = jobsMakeLabel(^(__kindof UILabel *label) {
            label.byText(@"")
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0)
                .byTextColor(JobsLabelColor)
                .addOn(self.guardContentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.sensitiveActionButton.mas_bottom).offset(JobsWidth(20));
                    make.left.right.equalTo(self.guardIntroLabel);
                    make.bottom.equalTo(self.guardContentView).offset(-JobsWidth(24));
                });
        });
    }
    return _guardReportLabel;
}

@end
