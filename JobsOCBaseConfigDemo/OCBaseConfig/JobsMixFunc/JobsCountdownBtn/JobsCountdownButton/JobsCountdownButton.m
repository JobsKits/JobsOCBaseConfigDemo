//
//  JobsCountdownButton.m
//  JobsCountdownBtn
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsCountdownButton.h"

@interface JobsCountdownBtn ()

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
            .jobsResetBtnTitleCor([UIColor colorWithRed:225.0f / 255.0f green:205.0f / 255.0f blue:98.0f / 255.0f alpha:1])
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(11))
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
            })
            .onClickBy(^(__kindof UIButton *x) {
                @jobs_strongify(self)
                if (self.jobsCountdownClickBlock) self.jobsCountdownClickBlock(self);
                self.jobsStartCountdown();
            });
        self.byContentHorizontalAlignment(UIControlContentHorizontalAlignmentRight);
        self.titleLabel.byAdjustsFontSizeToFitWidth(YES);
        self.titleLabel.byLineBreakMode(NSLineBreakByTruncatingTail);
        self.titleLabel.byMinimumScaleFactor(0.7f);
        return self;
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
        return [NSString stringWithFormat:@"%ld %@",(long)MAX(0, seconds),@"秒".jobsTr()];
    };
}

@end
