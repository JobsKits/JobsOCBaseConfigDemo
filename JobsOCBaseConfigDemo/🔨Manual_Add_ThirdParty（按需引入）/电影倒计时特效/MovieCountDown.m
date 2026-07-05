//
//  MovieCountDown.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MovieCountDown.h"

@interface MovieCountDown ()
/// UI
Prop_strong()UILabel *countDown;
Prop_strong()UIView *aphView;

@end

@implementation MovieCountDown

-(instancetype)init{
    if (self = [super init]) {
    };return self;
}
#pragma mark —— 一些私有方法
-(void)倒计时放大特效{
    [self.timer start];
    [self secountDown];
}

-(void)secountDown{
    if (!self.effectView) {
        NSAssert(0,@"检查属性 effectView 不能为空");
    }
}

-(void)getCuntDown:(NSInteger)second{
    self.countDown.text = toStringByLong(second);
    self.countDown.byAlpha(1);

    self.aphView.byAlpha(0);

    @jobs_weakify(self)
    [UIView animateWithDuration:0.8
                     animations:^{
        @jobs_strongify(self)
        self.countDown.byAlpha(0.8);//透明度
        self.aphView.byAlpha(0.1);

        self.countDown.transform = CGAffineTransformMakeScale(1.5, 1.5);//放大值
        self.aphView.transform = CGAffineTransformMakeScale(10, 10);//放大值
    } completion:^(BOOL finished) {
        @jobs_strongify(self)
        self.aphView.byAlpha(self.countDown.alpha =  0);

        self.countDown.transform = self.aphView.transform = CGAffineTransformIdentity;//回复原大小
    }];
}
#pragma mark —— lazyLoad
-(UILabel *)countDown{
    if (!_countDown) {
        @jobs_weakify(self)
        _countDown = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(self.countDownTextColor)
                .byFont([UIFont boldSystemFontOfSize:100])
                .byTextAlignment(1)
                .byX((JobsMainScreen_WIDTH() - 100) / 2)
                .byY((JobsMainScreen_HEIGHT() - 100) / 2)
                .bySize(CGSizeMake(100, 100))
                .addOn(self.effectView);
        });
    };return _countDown;
}

-(UIView *)aphView{
    if (!_aphView) {
        @jobs_weakify(self)
        _aphView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            @jobs_strongify(self)
            view
                .byBgColor(self.aphViewBackgroundColor)
                .byFrame(jobsMakeFrameByLocationModelBlock(^(__kindof JobsLocationModel * _Nullable data) {
                    data.jobsWidth = data.jobsHeight = JobsWidth(100);
                }))
                .byCenterX(self->_countDown.centerX)
                .byCenterY(self->_countDown.centerY)
                .byAlpha(0)
                .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                    data.byCornerRadiusValue(50.f);
                }))
                .addOn(self.effectView);
        });
    };return _aphView;
}

-(UIColor *)countDownTextColor{
    if (!_countDownTextColor) {
        _countDownTextColor = JobsRedColor;
    };return _countDownTextColor;
}

-(UIColor *)aphViewBackgroundColor{
    if (!_aphViewBackgroundColor) {
        _aphViewBackgroundColor = JobsClearColor;
    };return _aphViewBackgroundColor;
}

-(CGFloat)countDownTime{
    if (_countDownTime == 0) {
        _countDownTime = 5;
    };return _countDownTime;
}
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_anticlockwise) // 倒计时模式
            .byTimeInterval(1)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(10)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                JobsLog(@"正在倒计时...");
                [self getCuntDown:timer.time];
                if (self.objBlock) self.objBlock(timer);
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"倒计时结束...");
                if (self.objBlock) self.objBlock(timer);
            });

            timer.accumulatedElapsed       = 0;
            timer.lastStartDate            = nil;
        });
    };return _timer;
}

@end
