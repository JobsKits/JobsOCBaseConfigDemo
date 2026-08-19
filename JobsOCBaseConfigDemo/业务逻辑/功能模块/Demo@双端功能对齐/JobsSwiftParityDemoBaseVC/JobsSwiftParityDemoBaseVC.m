//
//  JobsSwiftParityDemoBaseVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityDemoBaseVC.h"

@implementation JobsSwiftParityDemoBaseVC

-(void)dealloc{
    _primaryActionBtn.jobs_removeAllHandlers();
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityDemoBaseVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(self.demoNavigationTitle().jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(UIColor.labelColor);
            })
            .byBgCor(UIColor.systemGroupedBackgroundColor)
            .byNavBgCor(UIColor.systemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsSwiftParityDemoBaseVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.view.byBgColor(UIColor.systemGroupedBackgroundColor);
        self.parityScrollView.byHidden(NO);
        self.contentView.byHidden(NO);
        self.introLab.byHidden(NO);
        self.previewView.byHidden(NO);
        self.previewImageView.byHidden(NO);
        self.previewTitleLab.byHidden(NO);
        self.primaryActionBtn.byHidden(NO);
        self.statusLab.byHidden(NO);
        self.configureDemo();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"功能演示";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoDescription{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"该页面用于展示一项独立功能。";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)demoIconName{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"arrow.left.arrow.right.circle";
    };
}

-(JobsRetStrByVoidBlock _Nonnull)primaryActionTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return @"执行 Demo";
    };
}

-(jobsByVoidBlock _Nonnull)configureDemo{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    };
}

-(jobsByVoidBlock _Nonnull)performPrimaryAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    };
}

-(jobsByStrBlock _Nonnull)updateStatus{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        self.statusLab.byText([NSString stringWithFormat:@"状态：%@",text]);
    };
}
#pragma mark —— LazyLoad
-(UIScrollView *)parityScrollView{
    if (!_parityScrollView) {
        _parityScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever);
        });
        _parityScrollView
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom);
            });
    };return _parityScrollView;
}

-(UIView *)contentView{
    if (!_contentView) {
        _contentView = jobsMakeView(nil);
        _contentView
            .addOn(self.parityScrollView)
            .byAdd(^(MASConstraintMaker *make) {
                make.edges.equalTo(self.parityScrollView);
                make.width.equalTo(self.parityScrollView);
            });
    };return _contentView;
}

-(UILabel *)introLab{
    if (!_introLab) {
        _introLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(self.demoDescription().jobsTr())
                .byNumberOfLines(0)
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(UIColor.secondaryLabelColor);
        });
        _introLab
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView).offset(JobsWidth(18));
                make.left.right.equalTo(self.contentView).inset(JobsWidth(18));
            });
    };return _introLab;
}

-(UIView *)previewView{
    if (!_previewView) {
        _previewView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.secondarySystemGroupedBackgroundColor)
                .byCornerRadius(JobsWidth(14))
                .byClipsToBounds(YES);
        });
        _previewView
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.introLab.mas_bottom).offset(JobsWidth(14));
                make.left.right.equalTo(self.contentView).inset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(260));
            });
    };return _previewView;
}

-(UIImageView *)previewImageView{
    if (!_previewImageView) {
        _previewImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(self.demoIconName().sys_img)
                .byContentMode(UIViewContentModeScaleAspectFit)
                .byTintColor(UIColor.systemBlueColor)
                .byClipsToBounds(YES);
        });
        _previewImageView
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.previewView).offset(JobsWidth(26));
                make.centerX.equalTo(self.previewView);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(88)));
            });
    };return _previewImageView;
}

-(UILabel *)previewTitleLab{
    if (!_previewTitleLab) {
        _previewTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(self.demoNavigationTitle().jobsTr())
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .byFont(UIFontWeightSemiboldSize(17))
                .byTextCor(UIColor.labelColor);
        });
        _previewTitleLab
            .addOn(self.previewView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.previewImageView.mas_bottom).offset(JobsWidth(18));
                make.left.right.equalTo(self.previewView).inset(JobsWidth(18));
                make.bottom.lessThanOrEqualTo(self.previewView).inset(JobsWidth(22));
            });
    };return _previewTitleLab;
}

-(UIButton *)primaryActionBtn{
    if (!_primaryActionBtn) {
        @jobs_weakify(self)
        _primaryActionBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(self.primaryActionTitle().jobsTr())
                .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnBgCor(UIColor.systemBlueColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                .onClickBy(^(__kindof UIButton * _Nullable button) {
                    [weak_self performPrimaryAction];
                })
                .byClipsToBounds(YES);
        });
        _primaryActionBtn
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.previewView.mas_bottom).offset(JobsWidth(14));
                make.left.right.equalTo(self.contentView).inset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(48));
            });
    };return _primaryActionBtn;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"状态：等待操作")
                .byNumberOfLines(0)
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(UIColor.secondaryLabelColor)
                .byBgColor(UIColor.tertiarySystemGroupedBackgroundColor)
                .byCornerRadius(JobsWidth(10))
                .byClipsToBounds(YES);
        });
        _statusLab
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.primaryActionBtn.mas_bottom).offset(JobsWidth(12));
                make.left.right.equalTo(self.contentView).inset(JobsWidth(18));
                make.height.mas_greaterThanOrEqualTo(JobsWidth(72));
                make.bottom.equalTo(self.contentView).inset(JobsWidth(30));
            });
    };return _statusLab;
}

@end
