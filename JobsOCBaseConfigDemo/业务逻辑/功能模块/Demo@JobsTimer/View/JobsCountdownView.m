//
//  JobsCountdownView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCountdownView.h"

@interface JobsCountdownView ()
/// UI
Prop_strong()UILabel *titleLab;
Prop_strong()UILabel *countdownTimeLab;
/// Data
Prop_strong()JobsTimeModel *formatTime;
Prop_strong()UIButtonModel *timerProcessModel;
Prop_copy()NSString *minutesStr;
Prop_copy()NSString *secondStr;
Prop_strong()NSMutableArray <JobsRichTextConfig *>*richTextConfigMutArr;
Prop_strong()NSMutableArray <NSString *>*richTextMutArr;
Prop_strong()NSMutableParagraphStyle *paragraphStyle;

-(jobsByCGFloatBlock _Nonnull)updateElapsedDisplayWithTime;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCountdownView
@interface JobsCountdownView (JobsPropertyDSLSetterAutogen_1ce2da27f5)
-(void)setMinutesStr:(NSString * _Nullable)data;
-(void)setRichTextConfigMutArr:(NSMutableArray <JobsRichTextConfig *>* _Nullable)data;
-(void)setRichTextMutArr:(NSMutableArray <NSString *>* _Nullable)data;
-(void)setSecondStr:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCountdownView

@implementation JobsCountdownView
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    if (self.timer) self.timer.jobsStop();
}
#pragma mark —— BaseProtocol
/// 单例化和销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCountdownView.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        static_countdownViewOnceToken = 0;
        static_countdownView = nil;
    };
}

static JobsCountdownView *static_countdownView = nil;
static dispatch_once_t static_countdownViewOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCountdownView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&static_countdownViewOnceToken, ^{
            static_countdownView = JobsCountdownView.new;
        });return static_countdownView;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCountdownView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
        self.byBgColor(JobsSecondarySystemBackgroundColor);
    };return self;
}
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.byViewModel(model ? : jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {}));
        MakeDataNull
        self.refreshData();
        self.titleLab.byVisible(YES);
        self.countdownTimeLab.byVisible(YES);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsWidth(343), JobsWidth(184));
    };
}
#pragma mark —— 公共方法
-(jobsByVoidBlock _Nonnull)refreshData{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byMinutesStr(nil);
        self.bySecondStr(nil);
        self.byRichTextConfigMutArr(nil);
        self.byRichTextMutArr(nil);
        self.countdownTimeLab.byAttributedString([self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                                     paragraphStyle:self.paragraphStyle]);
    };
}

-(jobsByCGFloatBlock _Nonnull)updateElapsedDisplayWithTime{
    @jobs_weakify(self)
    return ^(CGFloat time){
        @jobs_strongify(self)
        if (!self) return;
        NSInteger totalSeconds = MAX(0, (NSInteger)time);
        self.byMinutesStr([NSString stringWithFormat:@"%02ld",(long)(totalSeconds / 60)]);
        self.bySecondStr([NSString stringWithFormat:@"%02ld",(long)(totalSeconds % 60)]);
        self.countdownTimeLab.byAttributedString([self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                                     paragraphStyle:self.paragraphStyle]);
    };
}
#pragma mark —— lazyLoad
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer
            /// 必须配置的项
                .byTimerType(JobsTimerTypeNSTimer)
           // 计时器核心选择
                .byTimerStyle(TimerStyle_clockwise)
          // 正计时模式
                .byTimeInterval(1)
                           // 跳动步长（频率间距）
                .byStartTime(0)
                        // 从 0 秒开始正计时
                .byTimeSecIntervalSinceDate(0)
               // 手动点击后立即开始
                .byQueue(dispatch_get_main_queue())
                .byOnTick(^(CGFloat time){
                    @jobs_strongify(self)
                    self.updateElapsedDisplayWithTime(time);
                    if (self.objBlock) self.objBlock(@(time));
                })
                .byOnFinish(^(__kindof JobsTimer * _Nullable t){
                    @jobs_strongify(self)
                    if (self.objBlock) self.objBlock(t);
                })
            /// 这些是内部状态初始化，不暴露成 DSL 也可以

                .byAccumulatedElapsed(0)
                .byLastStartDate(nil);
        });
    };return _timer;
}

-(JobsTimeModel *)formatTime{
    if (!_formatTime) {
        _formatTime = jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
            data.byYear(@"".jobsTr())
                .byMonth(@"".jobsTr())
                .byDay(@"".jobsTr())
                .byHour(@"".jobsTr())
                .byMinute(@"分".jobsTr())
                .bySecond(@"秒".jobsTr());
        });
    };return _formatTime;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        @jobs_weakify(self)
        _titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"正计时已用时".jobsTr())
                .byFont(UIFontWeightMediumSize(15))
                .byTextCor(JobsSecondaryLabelColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self).offset(JobsWidth(28));
                    make.height.mas_equalTo(JobsWidth(14));
                })
                .makeLabelByShowingType(UILabelShowingType_03);
        });
    };return _titleLab;
}

-(UILabel *)countdownTimeLab{
    if (!_countdownTimeLab) {
        @jobs_weakify(self)
        _countdownTimeLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byAttributedString([self richTextWithDataConfigMutArr:self.richTextConfigMutArr
                                                        paragraphStyle:self.paragraphStyle])
                .byTextAlignment(NSTextAlignmentCenter)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self);
                    make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(16));
                    make.height.mas_equalTo(JobsWidth(60));
                    make.width.mas_equalTo(JobsCountdownView.viewSizeByModel(nil).width);
                });
        });
    };return _countdownTimeLab;
}

-(NSMutableArray<JobsRichTextConfig *> *)richTextConfigMutArr{
    JobsMutableArray(_richTextConfigMutArr);
    @jobs_weakify(self)
    _richTextConfigMutArr.add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        @jobs_strongify(self)
        data.byFont(UIFontWeightBoldSize(48))
            .byTextCor(HEXCOLOR(0x2F80ED))
            .byTargetString(self.minutesStr);
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.byFont(UIFontWeightRegularSize(12))
            .byTextCor(JobsSecondaryLabelColor)
            .byTargetString(@"分".jobsTr());
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.byFont(UIFontWeightBoldSize(48))
            .byTextCor(HEXCOLOR(0x2F80ED))
            .byTargetString(self.secondStr);
    }))
    .add(jobsMakeRichTextConfig(^(__kindof JobsRichTextConfig * _Nullable data) {
        data.byFont(UIFontWeightRegularSize(12))
            .byTextCor(JobsSecondaryLabelColor)
            .byTargetString(@"秒".jobsTr());
    }));return _richTextConfigMutArr;
}

-(NSMutableArray<NSString *> *)richTextMutArr{
    JobsMutableArray(_richTextMutArr);
    return _richTextMutArr
        .add(self.minutesStr)
        .add(@"分".jobsTr())
        .add(self.secondStr)
        .add(@"秒".jobsTr());
}

-(NSMutableParagraphStyle *)paragraphStyle{
    if (!_paragraphStyle) {
        _paragraphStyle = jobsMakeParagraphStyle(^(NSMutableParagraphStyle * _Nullable data) {
            data.byAlignment(NSTextAlignmentCenter);
        });
    };return _paragraphStyle;
}

-(NSString *)minutesStr{
    if (!_minutesStr) {
        _minutesStr = @"00".jobsTr();
    };return _minutesStr;
}

-(NSString *)secondStr{
    if (!_secondStr) {
        _secondStr = @"00".jobsTr();
    };return _secondStr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCountdownView
-(JobsRetJobsCountdownViewByNSMutableArrayJobsRichTextConfigBlock _Nonnull)byRichTextConfigMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsCountdownView * _Nullable(NSMutableArray <JobsRichTextConfig *>* _Nullable data){
        @jobs_strongify(self)
        [self setRichTextConfigMutArr:data];
        return self;
    };
}

-(JobsRetJobsCountdownViewByNSMutableArrayNSStringBlock _Nonnull)byRichTextMutArr{
    @jobs_weakify(self)
    return ^__kindof JobsCountdownView * _Nullable(NSMutableArray <NSString *>* _Nullable data){
        @jobs_strongify(self)
        [self setRichTextMutArr:data];
        return self;
    };
}

-(JobsRetJobsCountdownViewByNSStringBlock _Nonnull)byMinutesStr{
    @jobs_weakify(self)
    return ^__kindof JobsCountdownView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setMinutesStr:data];
        return self;
    };
}

-(JobsRetJobsCountdownViewByNSStringBlock _Nonnull)bySecondStr{
    @jobs_weakify(self)
    return ^__kindof JobsCountdownView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setSecondStr:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCountdownView
@end
