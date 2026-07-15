//
//  JobsCountdownButton.m
//  JobsCountdownBtn
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#import "JobsCountdownButton.h"

@interface JobsCountdownBtn ()

-(void)jobs_prepareDefaultValue;
-(NSString *)jobs_countdownTitleWithSeconds:(NSInteger)seconds;

@end

@implementation JobsCountdownBtn
+(instancetype)verificationCodeButton {
    return self.new;
}

-(instancetype)init {
    if (self = [super init]) {
        [self jobsConfigAsVerificationCodeButton];
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self jobsConfigAsVerificationCodeButton];
    };return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self jobsConfigAsVerificationCodeButton];
}

-(instancetype)jobsConfigAsVerificationCodeButton {
    [self jobs_prepareDefaultValue];
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
            seconds ? self.jobsResetBtnTitle([self jobs_countdownTitleWithSeconds:seconds]) : [self jobsResetCountdownTitle];
        })
        .byOnFinish(^(JobsTimer *_Nullable timer) {
            @jobs_strongify(self)
            [self jobsResetCountdownTitle];
        })
        .onClickBy(^(__kindof UIButton *x) {
            @jobs_strongify(self)
            if (self.jobsCountdownClickBlock) self.jobsCountdownClickBlock(self);
            [self jobsStartCountdown];
        });
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleLabel.minimumScaleFactor = 0.7f;
    return self;
}

-(instancetype)byJobsCountdownDuration:(NSTimeInterval)duration {
    self.jobsCountdownDuration = MAX(1, duration);
    self.byStartTime(self.jobsCountdownDuration);
    return self;
}

-(instancetype)byJobsCountdownNormalTitle:(NSString *)title {
    self.jobsCountdownNormalTitle = title.length ? title : @"获取验证码".tr;
    [self jobsResetCountdownTitle];
    return self;
}

-(instancetype)byJobsCountdownClickBlock:(jobsByIDBlock)block {
    self.jobsCountdownClickBlock = block;
    return self;
}

-(void)jobsStartCountdown {
    [self jobs_prepareDefaultValue];
    if (self.timer.isRunning) return;
    self.byStartTime(self.jobsCountdownDuration);
    self.enabled = NO;
    self.jobsResetBtnTitle([self jobs_countdownTitleWithSeconds:(NSInteger)ceil(self.jobsCountdownDuration)]);
    self.startTimer();
}

-(void)jobsResetCountdownTitle {
    [self jobs_prepareDefaultValue];
    self.enabled = YES;
    self.jobsResetBtnTitle(self.jobsCountdownNormalTitle);
}

-(void)jobs_prepareDefaultValue {
    if (self.jobsCountdownDuration <= 0) self.jobsCountdownDuration = 60;
    if (!self.jobsCountdownNormalTitle.length) self.jobsCountdownNormalTitle = @"获取验证码".tr;
}

-(NSString *)jobs_countdownTitleWithSeconds:(NSInteger)seconds {
    return [NSString stringWithFormat:@"%ld %@",(long)MAX(0, seconds),@"秒".tr];
}

@end
