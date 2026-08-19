//
//  JobsCountdownButton.m
//  JobsCountdownBtn
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsCountdownButton.h"

@interface JobsCountdownBtn ()

Prop_strong(nullable)RACDisposable *jobsCountdownClickDisposable;

-(jobsByVoidBlock _Nonnull)jobs_prepareDefaultValue;
-(JobsRetStrByIntegerBlock _Nonnull)jobs_countdownTitleWithSeconds;

@end

@implementation JobsCountdownBtn
+(JobsRetIDByVoidBlock _Nonnull)verificationCodeButton {
    return ^id{
        return self.new;
    };
}

-(instancetype)init {
    if (self = [super init]) {
        self.jobsConfigAsVerificationCodeButton();
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.jobsConfigAsVerificationCodeButton();
    };return self;
}

-(void)awakeFromNib{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownBtn.class, @selector(jobsAwakeFromNib)))(self, @selector(jobsAwakeFromNib));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super awakeFromNib];
        self.jobsConfigAsVerificationCodeButton();
    };
}

-(JobsRetIDByVoidBlock _Nonnull)jobsConfigAsVerificationCodeButton {
    @jobs_weakify(self)
    return ^id{
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobs_prepareDefaultValue();
        @jobs_weakify(self)
        self
            .jobsResetBtnTitle(self.jobsCountdownNormalTitle)
            .jobsResetBtnTitleCor(RGBA_COLOR(225.0f, 205.0f, 98.0f, 1))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(10))
            .makeBtnTitleByShowingType(UILabelShowingType_04)
            .byTimerStyle(TimerStyle_anticlockwise)
            .byStartTime(self.jobsCountdownDuration)
            .byTimeInterval(1)
            .byClickWhenTimerCycle(NO)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                NSInteger seconds = MAX(0, (NSInteger)ceil(time));
                seconds ? self.jobsResetBtnTitle(self.jobs_countdownTitleWithSeconds(seconds)) : self.jobsResetCountdownTitle();
            })
            .byOnFinish(^(JobsTimer *_Nullable timer) {
                @jobs_strongify(self)
                self.jobsResetCountdownTitle();
            });
        [self.jobsCountdownClickDisposable dispose];
        self.jobsCountdownClickDisposable = [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
                                             subscribeNext:^(__unused __kindof UIButton *button) {
            @jobs_strongify(self)
            if (self.jobsCountdownClickBlock) self.jobsCountdownClickBlock(self);
            self.jobsStartCountdown();
        }];
        self
            .byTitleLabel(^(UILabel *label) {
                label
                    .byNumberOfLines(1)
                    .byFont(UIFontWeightRegularSize(10))
                    .byAdjustsFontSizeToFitWidth(YES)
                    .byLineBreakMode(NSLineBreakByClipping)
                    .byMinimumScaleFactor(0.75f);
            })
            .byContentHorizontalAlignment(UIControlContentHorizontalAlignmentCenter);
        if (@available(iOS 16.0, *)) {
            self.jobsResetTitleAlignment(UIButtonConfigurationTitleAlignmentCenter);
            self.jobsResetTitleLineBreakMode(NSLineBreakByClipping);
        };return self;
    };
}

-(JobsRetIDByNSTimeIntervalBlock _Nonnull)byJobsCountdownDuration{
    @jobs_weakify(self)
    return ^id(NSTimeInterval duration){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobsCountdownDuration = MAX(1, duration);
        self.byStartTime(self.jobsCountdownDuration);
        return self;
    };
}

-(JobsRetIDByStrBlock _Nonnull)byJobsCountdownNormalTitle{
    @jobs_weakify(self)
    return ^id(NSString * title){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobsCountdownNormalTitle = title.length ? title : @"获取验证码".jobsTr();
        self.jobsResetCountdownTitle();
        return self;
    };
}

-(JobsRetIDByVoidIDBlocks _Nonnull)byJobsCountdownClickBlock{
    @jobs_weakify(self)
    return ^id(jobsByIDBlock block){
        @jobs_strongify(self)
        if (!self) return nil;
        self.jobsCountdownClickBlock = block;
        return self;
    };
}

-(jobsByVoidBlock _Nonnull)jobsStartCountdown {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_prepareDefaultValue();
        if (self.timer.isRunning) return;
        self.byStartTime(self.jobsCountdownDuration);
        self.byEnabled(NO);
        self.jobsResetBtnTitle(self.jobs_countdownTitleWithSeconds((NSInteger)ceil(self.jobsCountdownDuration)));
        self.startTimer();
    };
}

-(jobsByVoidBlock _Nonnull)jobsResetCountdownTitle {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.jobs_prepareDefaultValue();
        self.byEnabled(YES);
        self.jobsResetBtnTitle(self.jobsCountdownNormalTitle);
    };
}

-(jobsByVoidBlock _Nonnull)jobs_prepareDefaultValue {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.jobsCountdownDuration <= 0) self.jobsCountdownDuration = 60;
        if (!self.jobsCountdownNormalTitle.length) self.jobsCountdownNormalTitle = @"获取验证码".jobsTr();
    };
}

-(JobsRetStrByIntegerBlock _Nonnull)jobs_countdownTitleWithSeconds{
    @jobs_weakify(self)
    return ^NSString *(NSInteger seconds){
        @jobs_strongify(self)
        if (!self) return nil;
        return [NSString stringWithFormat:@"还剩 %ld 秒".jobsTr(),(long)MAX(0, seconds)];
    };
}

@end
