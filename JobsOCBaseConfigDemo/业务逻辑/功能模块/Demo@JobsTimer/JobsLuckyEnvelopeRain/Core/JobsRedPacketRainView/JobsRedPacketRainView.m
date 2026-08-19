//
//  JobsRedPacketRainView.m
//  JobsLuckyEnvelopeRain
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsRedPacketRainView.h"

static NSString *const JobsRedPacketRainMotionSpawnTimeKey = @"spawnTime";
static NSString *const JobsRedPacketRainMotionDurationKey = @"duration";
static NSString *const JobsRedPacketRainMotionStartCenterKey = @"startCenter";
static NSString *const JobsRedPacketRainMotionEndCenterKey = @"endCenter";

@interface JobsRedPacketRainView ()

Prop_strong()JobsTimer *spawnTimer;
Prop_strong()JobsTimer *fallTimer;
Prop_strong()NSMutableArray<UIButton *>*activePackets;
Prop_strong()NSMutableDictionary<NSValue *, NSDictionary<NSString *, id> *>*packetMotions;
Prop_assign(readwrite,getter=isRunning)BOOL running;
Prop_assign(readwrite)NSUInteger tappedCount;

-(jobsByVoidBlock _Nonnull)commonInit;
-(jobsByVoidBlock _Nonnull)buildTimerIfNeeded;
-(jobsByVoidBlock _Nonnull)spawnPacketIfNeeded;
-(jobsByVoidBlock _Nonnull)updatePackets;
-(jobsByVoidBlock _Nonnull)clearAllPackets;
-(jobsByBtnBlock _Nonnull)removePacket;
-(JobsRetImageByVoidBlock _Nonnull)defaultPacketImage;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsRedPacketRainView
@interface JobsRedPacketRainView (JobsPropertyDSLSetterAutogen_5ae2acb993)
-(void)setFallTimer:(JobsTimer * _Nullable)data;
-(void)setSpawnTimer:(JobsTimer * _Nullable)data;
-(void)setTapCallback:(void (^ _Nullable)(__kindof JobsRedPacketRainView *rainView, NSUInteger tappedCount))data;
-(void)setTappedCount:(NSUInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsRedPacketRainView

@implementation JobsRedPacketRainView
-(JobsRetJobsRedPacketRainViewByBOOLBlock _Nonnull)byRunning{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainView *_Nullable(BOOL running){
        @jobs_strongify(self)
        [self setRunning:running];
        return self;
    };
}

+(JobsRetIDByJobsRedPacketRainConfigBlock _Nonnull)rainViewWithConfig{
    return ^id(JobsRedPacketRainConfig * config){
        return [[JobsRedPacketRainView alloc] initWithFrame:CGRectZero
                                                     config:config];
    };
}

-(instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                        config:nil];
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        _config = JobsRedPacketRainConfig.defaultConfig();
        self.commonInit();
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame
                      config:(JobsRedPacketRainConfig *)config{
    if (self = [super initWithFrame:frame]) {
        _config = config ? [config copy] : JobsRedPacketRainConfig.defaultConfig();
        self.commonInit();
    };return self;
}

-(void)dealloc{
    if (self.spawnTimer) self.spawnTimer.jobsStop();
    if (self.fallTimer) self.fallTimer.jobsStop();
}

-(JobsRetIDByvoidJobsRedPacketRainViewNSUIntegerBlock _Nonnull)onPacketTap{
    @jobs_weakify(self)
    return ^id(void (^callback)(__kindof JobsRedPacketRainView * _Nonnull, NSUInteger)){
        @jobs_strongify(self)
        if (!self) return nil;
        self.byTapCallback(callback);
        return self;
    };
}

-(jobsByVoidBlock _Nonnull)start{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.isRunning) return;
        self.buildTimerIfNeeded();
        self.byRunning(YES);
        self.spawnTimer.start();
        self.fallTimer.start();
    };
}

-(jobsByVoidBlock _Nonnull)pause{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isRunning) return;
        self.byRunning(NO);
        if (self.spawnTimer) self.spawnTimer.pause();
        if (self.fallTimer) self.fallTimer.pause();
    };
}

-(jobsByVoidBlock _Nonnull)resume{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.isRunning) return;
        self.buildTimerIfNeeded();
        self.byRunning(YES);
        if (self.spawnTimer) self.spawnTimer.resume();
        if (self.fallTimer) self.fallTimer.resume();
    };
}

-(jobsByBOOLBlock _Nonnull)stopWithClear{
    @jobs_weakify(self)
    return ^(BOOL clear){
        @jobs_strongify(self)
        if (!self) return;
        self.byRunning(NO);
        if (self.spawnTimer) self.spawnTimer.jobsStop();
        self.bySpawnTimer(nil);
        if (clear) {
            if (self.fallTimer) self.fallTimer.jobsStop();
            self.byFallTimer(nil);
            self.clearAllPackets();
        }else if (!self.activePackets.count){
            if (self.fallTimer) self.fallTimer.jobsStop();
            self.byFallTimer(nil);
        }
    };
}

-(jobsByVoidBlock _Nonnull)reset{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.stopWithClear(YES);
        self.byTappedCount(0);
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)commonInit{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byClipsToBounds(YES);
        self.byUserInteractionEnabled(YES);
    };
}

-(jobsByVoidBlock _Nonnull)buildTimerIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        if (!self.spawnTimer) {
            self.spawnTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
                timer.byTimerType(JobsTimerTypeGCD)
                    .byTimerStyle(TimerStyle_clockwise)
                    .byStartTime(0)
                    .byTimeInterval(MAX(0.05, self.config.spawnInterval))
                    .byQueue(dispatch_get_main_queue())
                    .byOnTick(^(CGFloat time) {
                        @jobs_strongify(self)
                        self.spawnPacketIfNeeded();
                    });
            });
        }
        if (!self.fallTimer) {
            self.fallTimer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
                timer.byTimerType(JobsTimerTypeGCD)
                    .byTimerStyle(TimerStyle_clockwise)
                    .byStartTime(0)
                    .byTimeInterval(1.0 / 60.0)
                    .byQueue(dispatch_get_main_queue())
                    .byOnTick(^(CGFloat time) {
                        @jobs_strongify(self)
                        self.updatePackets();
                    });
            });
        }
    };
}

-(jobsByVoidBlock _Nonnull)spawnPacketIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isRunning || CGRectGetWidth(self.bounds) <= 0 || CGRectGetHeight(self.bounds) <= 0) return;
        if (self.activePackets.count >= self.config.maxConcurrentCount) return;
        CGFloat validWidth = CGRectGetWidth(self.bounds) - self.config.spawnInsets.left - self.config.spawnInsets.right;
        if (validWidth <= 0) return;
        CGFloat maxX = MAX(0, validWidth - self.config.packetSize.width);
        CGFloat randomX = self.config.spawnInsets.left + ((CGFloat)arc4random_uniform(10000) / 10000.0) * maxX;
        CGRect startFrame = CGRectMake(randomX,
                                       -self.config.packetSize.height,
                                       self.config.packetSize.width,
                                       self.config.packetSize.height);
        UIButton *packet = [UIButton buttonWithType:UIButtonTypeCustom];
        packet.byFrame(startFrame);
        packet.byUserInteractionEnabled(self.config.tapEnabled);
        packet.byClipsToBounds(YES);
        if (self.config.packetImage) {
            [packet setBackgroundImage:self.config.packetImage
                              forState:UIControlStateNormal];
            packet.imageView.byContentMode(UIViewContentModeScaleAspectFit);
        }else{
            [packet setBackgroundImage:self.defaultPacketImage()
                              forState:UIControlStateNormal];
        }
        if (self.config.tapEnabled) {
            [packet addTarget:self
                       action:@selector(packetTapAction:)
             forControlEvents:UIControlEventTouchUpInside];
        }
        NSTimeInterval minDuration = MIN(self.config.minFallDuration, self.config.maxFallDuration);
        NSTimeInterval maxDuration = MAX(self.config.minFallDuration, self.config.maxFallDuration);
        NSTimeInterval duration = minDuration + ((double)arc4random_uniform(10000) / 10000.0) * (maxDuration - minDuration);
        CGFloat drift = (((CGFloat)arc4random_uniform(10000) / 10000.0) * 80.0) - 40.0;
        CGRect endFrame = startFrame;
        endFrame.origin.y = CGRectGetHeight(self.bounds) + self.config.packetSize.height;
        endFrame.origin.x = MIN(MAX(self.config.spawnInsets.left, endFrame.origin.x + drift),
                                CGRectGetWidth(self.bounds) - self.config.spawnInsets.right - self.config.packetSize.width);
        CGFloat angle = (((CGFloat)arc4random_uniform(10000) / 10000.0) * 0.5) - 0.25;
        packet.byTransform(CGAffineTransformMakeRotation(angle));
        [self addSubview:packet];
        [self.activePackets addObject:packet];
        self.packetMotions[[NSValue valueWithNonretainedObject:packet]] = @{
            JobsRedPacketRainMotionSpawnTimeKey : @(CACurrentMediaTime()),
            JobsRedPacketRainMotionDurationKey : @(MAX(0.1, duration)),
            JobsRedPacketRainMotionStartCenterKey : [NSValue valueWithCGPoint:packet.center],
            JobsRedPacketRainMotionEndCenterKey : [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(endFrame), CGRectGetMidY(endFrame))]
        };
    };
}

-(jobsByVoidBlock _Nonnull)updatePackets{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.activePackets.count) {
            if (!self.isRunning) {
                if (self.fallTimer) self.fallTimer.jobsStop();
                self.byFallTimer(nil);
            };return;
        }
        CFTimeInterval now = CACurrentMediaTime();
        NSMutableArray<UIButton *>*finished = NSMutableArray.array;
        for (UIButton *packet in self.activePackets.copy) {
            NSDictionary<NSString *, id> *motion = self.packetMotions[[NSValue valueWithNonretainedObject:packet]];
            if (!motion) continue;
            NSTimeInterval spawnTime = [motion[JobsRedPacketRainMotionSpawnTimeKey] doubleValue];
            NSTimeInterval duration = [motion[JobsRedPacketRainMotionDurationKey] doubleValue];
            CGPoint startCenter = [motion[JobsRedPacketRainMotionStartCenterKey] CGPointValue];
            CGPoint endCenter = [motion[JobsRedPacketRainMotionEndCenterKey] CGPointValue];
            CGFloat progress = MIN(1.0, MAX(0, (now - spawnTime) / duration));
            packet.center = CGPointMake(startCenter.x + (endCenter.x - startCenter.x) * progress,
                                        startCenter.y + (endCenter.y - startCenter.y) * progress);
            if (progress >= 1.0) [finished addObject:packet];
        }
        for (UIButton *packet in finished) {
            self.removePacket(packet);
        }
        if (!self.activePackets.count && !self.isRunning) {
            if (self.fallTimer) self.fallTimer.jobsStop();
            self.byFallTimer(nil);
        }
    };
}

-(void)packetTapAction:(UIButton *)sender{
    jobsByBtnBlock action = ((jobsByBtnBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsRedPacketRainView.class, @selector(jobsPacketTapAction)))(self, @selector(jobsPacketTapAction));
    if (action) action(sender);
}

-(jobsByBtnBlock _Nonnull)jobsPacketTapAction{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        [UIView animateWithDuration:0.08
                         animations:^{
            sender.byTransform(CGAffineTransformScale(sender.transform, 1.14, 1.14));
        } completion:^(__unused BOOL finished) {
            [UIView animateWithDuration:0.12
                             animations:^{
                sender.byTransform(CGAffineTransformScale(sender.transform, 0.01, 0.01));
                sender.byAlpha(0);
            } completion:^(__unused BOOL finished) {
                self.removePacket(sender);
            }];
        }];
        self.tappedCount += 1;
        if (self.tapCallback) self.tapCallback(self, self.tappedCount);
        if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
            [feedback impactOccurred];
        }
    };
}

-(jobsByVoidBlock _Nonnull)clearAllPackets{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (UIButton *packet in self.activePackets.copy) {
            [packet removeFromSuperview];
        }
        [self.activePackets removeAllObjects];
        [self.packetMotions removeAllObjects];
    };
}

-(jobsByBtnBlock _Nonnull)removePacket{
    @jobs_weakify(self)
    return ^(UIButton * packet){
        @jobs_strongify(self)
        if (!self) return;
        [self.activePackets removeObject:packet];
        [self.packetMotions removeObjectForKey:[NSValue valueWithNonretainedObject:packet]];
        [packet removeFromSuperview];
    };
}

-(JobsRetImageByVoidBlock _Nonnull)defaultPacketImage{
    @jobs_weakify(self)
    return ^UIImage *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        CGSize size = CGSizeMake(44, 54);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1, 1, size.width - 2, size.height - 2)
                                                        cornerRadius:8];
        [UIColor colorWithRed:0.90 green:0.05 blue:0.08 alpha:1].setFill;
        [path fill];
        [UIColor colorWithRed:1.00 green:0.82 blue:0.18 alpha:1].setStroke;
        path.byLineWidth(2);
        [path stroke];
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:1.00 green:0.82 blue:0.18 alpha:1].CGColor);
        CGContextFillEllipseInRect(ctx, CGRectMake(10, 8, 24, 24));
        NSDictionary *attr = @{
            NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
            NSForegroundColorAttributeName: UIColor.redColor
        };
        NSString *text = @"¥";
        CGSize textSize = [text sizeWithAttributes:attr];
        [text drawInRect:CGRectMake((size.width - textSize.width) / 2.0,
                                    8 + (24 - textSize.height) / 2.0,
                                    textSize.width,
                                    textSize.height)
          withAttributes:attr];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<UIButton *> *)activePackets{
    if (!_activePackets) {
        _activePackets = NSMutableArray.array;
    };return _activePackets;
}

-(NSMutableDictionary<NSValue *,NSDictionary<NSString *,id> *> *)packetMotions{
    if (!_packetMotions) {
        _packetMotions = NSMutableDictionary.dictionary;
    };return _packetMotions;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsRedPacketRainView
-(JobsRetJobsRedPacketRainViewByJobsTimerBlock _Nonnull)byFallTimer{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainView * _Nullable(JobsTimer * _Nullable data){
        @jobs_strongify(self)
        [self setFallTimer:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainViewByJobsTimerBlock _Nonnull)bySpawnTimer{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainView * _Nullable(JobsTimer * _Nullable data){
        @jobs_strongify(self)
        [self setSpawnTimer:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainViewByNSUIntegerBlock _Nonnull)byTappedCount{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainView * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setTappedCount:data];
        return self;
    };
}

-(JobsRetJobsRedPacketRainViewByvoidJobsRedPacketRainViewrainViewNSUIntegertappedCountBlock _Nonnull)byTapCallback{
    @jobs_weakify(self)
    return ^__kindof JobsRedPacketRainView * _Nullable(void (^ _Nullable data)(__kindof JobsRedPacketRainView *rainView, NSUInteger tappedCount)){
        @jobs_strongify(self)
        [self setTapCallback:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsRedPacketRainView
@end
