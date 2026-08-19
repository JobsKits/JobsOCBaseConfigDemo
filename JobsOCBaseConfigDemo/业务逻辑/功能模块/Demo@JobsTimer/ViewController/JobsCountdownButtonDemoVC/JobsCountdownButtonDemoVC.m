//
//  JobsCountdownButtonDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsCountdownButtonDemoVC.h"

@interface JobsCountdownButtonDemoVC ()

Prop_strong()UIButton *countdownBtn;
Prop_strong()UILabel *stateLab;
Prop_strong()UITextView *tipsTextView;

-(NSAttributedString *)normalTipAttributedStringWithText:(NSString *)text
                                                    font:(UIFont *)font
                                               textColor:(UIColor *)textColor;

@end

@implementation JobsCountdownButtonDemoVC
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    if (_countdownBtn) _countdownBtn.timerDestroy();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownButtonDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"倒计时按钮".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownButtonDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.countdownBtn.byVisible(YES);
        self.stateLab.byVisible(YES);
        self.tipsTextView.byVisible(YES);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownButtonDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        if (_countdownBtn) _countdownBtn.timerDestroy();
    };
}
#pragma mark —— 一些私有方法
-(NSAttributedString *)normalTipAttributedStringWithText:(NSString *)text
                                                    font:(UIFont *)font
                                               textColor:(UIColor *)textColor{
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.byAlignment(NSTextAlignmentLeft);
    paragraphStyle.byLineSpacing(JobsWidth(4));
    paragraphStyle.byParagraphSpacing(0);
    return [NSAttributedString.alloc initWithString:text ?: JobsEmpty
                                         attributes:@{
        NSFontAttributeName: font,
        NSForegroundColorAttributeName: textColor,
        NSKernAttributeName: @(0),
        NSParagraphStyleAttributeName: paragraphStyle
    }];
}
#pragma mark —— lazyLoad
-(UIButton *)countdownBtn{
    if (!_countdownBtn) {
        @jobs_weakify(self)
        _countdownBtn = UIButton.jobsInit()
            .jobsResetBtnBgCor(HEXCOLOR(0xAE8330))
            .jobsResetBtnTitle(@"获取验证码".jobsTr())
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(24))
            .byTimerStyle(TimerStyle_anticlockwise)
            .byStartTime(8)
            .byTimeInterval(1)
            .byClickWhenTimerCycle(YES)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                NSString *timeText = [NSString stringWithFormat:@"%d",(int)ceil(time)];
                self.countdownBtn.jobsResetBtnTitle(timeText.add(JobsSpace).add(@"秒"));
                self.stateLab.byText([NSString stringWithFormat:@"UIButton 内部 JobsTimer 正在倒计时：%@ 秒".jobsTr(),timeText]);
                if (time > 0) {
                    [NSString stringWithFormat:@"%@%@",timeText, @"秒到了，我被打印出来了！".jobsTr()].toast();
                }
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                self.countdownBtn.jobsResetBtnTitle(@"获取验证码".jobsTr());
                self.stateLab.byText(@"倒计时结束，可以重新获取验证码".jobsTr());
                // @"0秒到了，我被打印出来了！".jobsTr().toast();
                JobsLog(@"%@", @"0秒到了，我被打印出来了！".jobsTr());
            })
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.stateLab.byText(@"已启动倒计时，按钮点击会交给内部 JobsTimer 管理".jobsTr());
                x.startTimer();
            })
            .jobsResetBtnCornerRadiusValue(JobsWidth(18))
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerX.equalTo(self.view);
                make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(42));
                make.height.mas_equalTo(JobsWidth(80));
                make.width.mas_equalTo(JobsWidth(210));
            });
    };return _countdownBtn;
}

-(UILabel *)stateLab{
    if (!_stateLab) {
        @jobs_weakify(self)
        _stateLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"点击按钮开始验证码倒计时".jobsTr())
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.top.equalTo(self.countdownBtn.mas_bottom).offset(JobsWidth(18));
                });
        });
    };return _stateLab;
}

-(UITextView *)tipsTextView{
    if (!_tipsTextView) {
        @jobs_weakify(self)
        _tipsTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            UIFont *font = UIFontWeightRegularSize(14);
            UIColor *textColor = HEXCOLOR(0x5F6B7A);
            textView.byAttributedText([self normalTipAttributedStringWithText:@"这个 Demo 展示 JobsOCTimer 的衍生品：UIButton+JobsTimer。适合验证码、重新发送、支付等待这类“按钮自己进入倒计时状态”的场景。页面退出时要销毁按钮内部 timer，避免离开页面后继续回调 UI。".jobsTr()
                                                                         font:font
                                                                    textColor:textColor])
                .byTextAlignment(NSTextAlignmentLeft)
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(12), JobsWidth(12), JobsWidth(12), JobsWidth(12)))
                .byLineFragmentPadding(0)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(-JobsWidth(20));
                    make.top.equalTo(self.stateLab.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(120));
                });
        });
    };return _tipsTextView;
}

@end
