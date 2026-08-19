//
//  JobsClockView.m
//  JobsClockView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsClockView.h"

@interface JobsClockView ()
/// 外圈表盘
Prop_strong() CAShapeLayer *dialLayer;
/// 12 个整点刻度
Prop_strong() CAShapeLayer *tickLayer;
/// 中心小圆点
Prop_strong() CAShapeLayer *centerDotLayer;
/// 1～12 数字标签
Prop_strong() NSArray<UILabel *> *numberLabels;
/// 时针 / 分针 / 秒针
Prop_strong() CALayer *hourHand;
Prop_strong() CALayer *minuteHand;
Prop_strong() CALayer *secondHand;
/// OC 版 JobsTimer
Prop_strong() JobsTimer *timer;

-(jobsByVoidBlock _Nonnull)applyTheme;
-(JobsRetIDByIDBlock _Nonnull)byTimer;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsClockView
@interface JobsClockView (JobsPropertyDSLSetterAutogen_4b5930ae8b)
-(void)setCenterDotLayer:(CAShapeLayer * _Nullable)data;
-(void)setDialLayer:(CAShapeLayer * _Nullable)data;
-(void)setHourHand:(CALayer * _Nullable)data;
-(void)setMinuteHand:(CALayer * _Nullable)data;
-(void)setNumberLabels:(NSArray<UILabel *> * _Nullable)data;
-(void)setSecondHand:(CALayer * _Nullable)data;
-(void)setTickLayer:(CAShapeLayer * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsClockView

@implementation JobsClockView
-(JobsRetIDByIDBlock _Nonnull)byTimer{
    @jobs_weakify(self)
    return ^id(JobsTimer *timer){
        @jobs_strongify(self)
        self.timer = timer;
        return self;
    };
}

- (void)dealloc {
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockView.class, @selector(jobsStop)))(self, @selector(jobsStop)))();
}

-(instancetype)init{
    if(self = [super init]){
        self.byBgColor(UIColor.clearColor);
        self.setupDialLayers();
        self.setupNumberLabels();
        self.setupHandLayers();
        self.applyTheme();
    };return self;
}

#pragma mark —— Setup

- (jobsByVoidBlock _Nonnull)setupDialLayers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byDialLayer([CAShapeLayer layer]);
        self.dialLayer.byFillColor(UIColor.clearColor.CGColor);
        self.dialLayer.byStrokeColor(JobsLabelColor.CGColor);
        self.dialLayer.byLineWidth(2.0);
        [self.layer addSublayer:self.dialLayer];
        self.byTickLayer([CAShapeLayer layer]);
        self.tickLayer.byFillColor(UIColor.clearColor.CGColor);
        self.tickLayer.byStrokeColor(JobsLabelColor.CGColor);
        self.tickLayer.byLineWidth(2.0);
        [self.layer addSublayer:self.tickLayer];
        self.byCenterDotLayer([CAShapeLayer layer]);
        self.centerDotLayer.byFillColor(JobsLabelColor.CGColor);
        self.centerDotLayer.byStrokeColor(UIColor.clearColor.CGColor);
        [self.layer addSublayer:self.centerDotLayer];
    };
}

- (jobsByVoidBlock _Nonnull)setupNumberLabels {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSMutableArray<UILabel *> *arr = NSMutableArray.array;
        for (NSInteger i = 1; i <= 12; i++) {
            UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byText([NSString stringWithFormat:@"%ld", (long)i])
                    .byFont(UIFontWeightMediumSize(12))
                    .byTextCor(JobsLabelColor)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .addOn(self);
            });
            [arr addObject:label];
        }
        self.byNumberLabels(arr.copy);
    };
}

- (jobsByVoidBlock _Nonnull)setupHandLayers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byHourHand([CALayer layer]);
        self.hourHand.byBgColor(JobsLabelColor.CGColor);
        self.hourHand.byCornerRadius(3.0);
        [self.layer addSublayer:self.hourHand];
        self.byMinuteHand([CALayer layer]);
        self.minuteHand.byBgColor(JobsSecondaryLabelColor.CGColor);
        self.minuteHand.byCornerRadius(2.0);
        [self.layer addSublayer:self.minuteHand];
        self.bySecondHand([CALayer layer]);
        self.secondHand.byBgColor([UIColor redColor].CGColor);
        self.secondHand.byCornerRadius(1.0);
        [self.layer addSublayer:self.secondHand];
    };
}
#pragma mark —— Layout
- (void)layoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        self.applyTheme();
        self.layoutDialAndNumbers();
        self.layoutHandLayers();
        self.updateHandsAnimated(NO);
    };
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockView.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        if (@available(iOS 13.0, *)) {
            if (![self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) return;
        }
        self.applyTheme();
    };
}

-(jobsByVoidBlock _Nonnull)applyTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *labelColor = JobsLabelColor;
        UIColor *secondaryLabelColor = JobsSecondaryLabelColor;
        if (@available(iOS 13.0, *)) {
            labelColor = [labelColor resolvedColorWithTraitCollection:self.traitCollection];
            secondaryLabelColor = [secondaryLabelColor resolvedColorWithTraitCollection:self.traitCollection];
        }
        self.dialLayer.byStrokeColor([labelColor colorWithAlphaComponent:0.2].CGColor);
        self.tickLayer.byStrokeColor(labelColor.CGColor);
        self.centerDotLayer.byFillColor(labelColor.CGColor);
        self.hourHand.byBackgroundColor(labelColor.CGColor);
        self.minuteHand.byBackgroundColor(secondaryLabelColor.CGColor);
    };
}
/// 布局表盘 + 刻度 + 数字
- (jobsByVoidBlock _Nonnull)layoutDialAndNumbers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat width  = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        CGFloat size   = MIN(width, height);
        if (size <= 0) return;
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),
                                     CGRectGetMidY(self.bounds));
        CGFloat inset  = size * 0.05;
        CGFloat radius = size / 2.0 - inset;
        // 表盘外圈
        CGRect circleRect = CGRectMake(center.x - radius,
                                       center.y - radius,
                                       radius * 2.0,
                                       radius * 2.0);
        UIBezierPath *circlePath = UIBezierPath.byBezierPathWithOvalInRect(circleRect);
        self.dialLayer.byFrame(self.bounds);
        self.dialLayer.byPath(circlePath.CGPath);
        // 12 个整点刻度
        UIBezierPath *tickPath = jobsMakeBezierPath(nil);
        CGFloat tickLen = 8.0;
        for (NSInteger i = 0; i < 12; i++) {
            // 0 -> 12 点，顺时针
            CGFloat angle = (CGFloat)i / 12.0 * 2.0 * M_PI - M_PI_2;
            CGPoint outer = CGPointMake(center.x + cos(angle) * radius,
                                        center.y + sin(angle) * radius);
            CGPoint inner = CGPointMake(center.x + cos(angle) * (radius - tickLen),
                                        center.y + sin(angle) * (radius - tickLen));
            [tickPath moveToPoint:inner];
            [tickPath addLineToPoint:outer];
        }
        self.tickLayer.byFrame(self.bounds);
        self.tickLayer.byPath(tickPath.CGPath);
        // 中心小圆点
        CGFloat dotRadius = 4.0;
        CGRect dotRect = CGRectMake(center.x - dotRadius,
                                    center.y - dotRadius,
                                    dotRadius * 2.0,
                                    dotRadius * 2.0);
        UIBezierPath *dotPath = UIBezierPath.byBezierPathWithOvalInRect(dotRect);
        self.centerDotLayer.byFrame(self.bounds);
        self.centerDotLayer.byPath(dotPath.CGPath);
        // 1～12 数字布局
        CGFloat numberRadius = radius - 20.0;
        [self.numberLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull label,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
            CGFloat value = (CGFloat)(idx + 1); // 1...12
            CGFloat angle = value / 12.0 * 2.0 * M_PI - M_PI_2;
            CGPoint labelCenter = CGPointMake(center.x + cos(angle) * numberRadius,
                                              center.y + sin(angle) * numberRadius);
            CGSize labelSize;
            if ([label respondsToSelector:@selector(intrinsicContentSize)]) {
                labelSize = label.intrinsicContentSize;
            } else {
                label.bySizeToFit();
                labelSize = label.bounds.size;
            }
            label.byFrame(CGRectMake(labelCenter.x - labelSize.width / 2.0,
                                     labelCenter.y - labelSize.height / 2.0,
                                     labelSize.width,
                                     labelSize.height));
        }];
    };
}
/// 布局三根指针
- (jobsByVoidBlock _Nonnull)layoutHandLayers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat width  = CGRectGetWidth(self.bounds);
        CGFloat height = CGRectGetHeight(self.bounds);
        CGFloat size   = MIN(width, height);
        if (size <= 0) return;
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds),
                                     CGRectGetMidY(self.bounds));
        CGFloat hourLen   = size * 0.25;
        CGFloat minuteLen = size * 0.35;
        CGFloat secondLen = size * 0.40;
        self.hourHand.byBounds(CGRectMake(0, 0, 6.0, hourLen));
        self.minuteHand.byBounds(CGRectMake(0, 0, 4.0, minuteLen));
        self.secondHand.byBounds(CGRectMake(0, 0, 2.0, secondLen));
        NSArray<CALayer *> *hands = @[self.hourHand, self.minuteHand, self.secondHand];
        for (CALayer *hand in hands) {
            hand.byAnchorPoint(CGPointMake(0.5, 1.0));
            hand.byPosition(center);
        }
    };
}
#pragma mark —— 一些公共方法
-(jobsByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.startByTimerType(JobsTimerTypeGCD);
    };
}

-(jobsByNSUIntegerBlock _Nonnull)startByTimerType{
    @jobs_weakify(self)
    return ^(JobsTimerType timerType){
        @jobs_strongify(self)
        self.jobsStop();
        // 先对齐当前时间
        self.updateHandsAnimated(NO);
        @jobs_weakify(self)
        self.byTimer(jobsMakeTimer(^(JobsTimer<TimerProtocol> * _Nullable timer) {
            @jobs_strongify(self)
            timer.byTimerType(timerType)
            .byTimeInterval(1.0)
                 // 每秒 tick 一次
            .byTimeSecIntervalSinceDate(0)       // 立即开始
            .byQueue(dispatch_get_main_queue())  // UI 更新必须主线程
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
                      // 非倒计时模式
            .byTime(0)
            .byOnTick(^(CGFloat time) {
                @jobs_strongify(self)
                if (!self) return;
                self.updateHandsAnimated(YES);
            })
            .byOnFinish(^(JobsTimer * _Nullable t) {
                // 正常走表这里一般不会走到（非倒计时模式）
            });
            // 内部时间基线
            timer
                .byAccumulatedElapsed(0)
                .byLastStartDate(nil);
        }));
        self.timer.start();
    };
}

-(jobsByVoidBlock _Nonnull)jobsStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.timer) {
            self.timer.jobsStop();
            self.byTimer(nil);
        }
    };
}
#pragma mark —— Private: 指针角度更新
-(jobsByBOOLBlock _Nonnull)updateHandsAnimated{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        NSDate *now = NSDate.date;
        NSCalendar *calendar = NSCalendar.currentCalendar;
        NSDateComponents *comps =
        [calendar components:(NSCalendarUnitHour |
                              NSCalendarUnitMinute |
                              NSCalendarUnitSecond)
                    fromDate:now];
        CGFloat hour   = comps.hour;   // 0...23
        CGFloat minute = comps.minute; // 0...59
        CGFloat second = comps.second; // 0...59
        CGFloat secAngle  = (second / 60.0) * 2.0 * M_PI;
        CGFloat minAngle  = ((minute + second / 60.0) / 60.0) * 2.0 * M_PI;
        CGFloat hourAngle = ((((int)hour % 12) + minute / 60.0 + second / 3600.0)
                             / 12.0) * 2.0 * M_PI;
        void (^applyTransforms)(void) = ^{
            self.hourHand.byTransform(CATransform3DMakeRotation(hourAngle, 0, 0, 1));
            self.minuteHand.byTransform(CATransform3DMakeRotation(minAngle, 0, 0, 1));
            self.secondHand.byTransform(CATransform3DMakeRotation(secAngle, 0, 0, 1));
        };
        [CATransaction begin];
        if (animated) {
            [CATransaction setAnimationDuration:0.2];
            [CATransaction setAnimationTimingFunction:
             [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        } else {
            [CATransaction setDisableActions:YES];
        }
        applyTransforms();
        [CATransaction commit];
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsClockView
-(JobsRetJobsClockViewByCALayerBlock _Nonnull)byHourHand{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CALayer * _Nullable data){
        @jobs_strongify(self)
        [self setHourHand:data];
        return self;
    };
}

-(JobsRetJobsClockViewByCALayerBlock _Nonnull)byMinuteHand{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CALayer * _Nullable data){
        @jobs_strongify(self)
        [self setMinuteHand:data];
        return self;
    };
}

-(JobsRetJobsClockViewByCALayerBlock _Nonnull)bySecondHand{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CALayer * _Nullable data){
        @jobs_strongify(self)
        [self setSecondHand:data];
        return self;
    };
}

-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byCenterDotLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setCenterDotLayer:data];
        return self;
    };
}

-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byDialLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setDialLayer:data];
        return self;
    };
}

-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byTickLayer{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(CAShapeLayer * _Nullable data){
        @jobs_strongify(self)
        [self setTickLayer:data];
        return self;
    };
}

-(JobsRetJobsClockViewByNSArrayUILabelBlock _Nonnull)byNumberLabels{
    @jobs_weakify(self)
    return ^__kindof JobsClockView * _Nullable(NSArray<UILabel *> * _Nullable data){
        @jobs_strongify(self)
        [self setNumberLabels:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsClockView
@end
