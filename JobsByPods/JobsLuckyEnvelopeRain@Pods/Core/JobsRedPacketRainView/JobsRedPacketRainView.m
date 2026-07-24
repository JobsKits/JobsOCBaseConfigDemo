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

-(void)commonInit;
-(void)buildTimerIfNeeded;
-(void)spawnPacketIfNeeded;
-(void)updatePackets;
-(void)clearAllPackets;
-(void)removePacket:(UIButton *)packet;
-(UIImage *)defaultPacketImage;

@end

@implementation JobsRedPacketRainView
+(instancetype)rainViewWithConfig:(JobsRedPacketRainConfig *)config{
    return [[JobsRedPacketRainView alloc] initWithFrame:CGRectZero
                                                 config:config];
}

-(instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                        config:nil];
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        _config = JobsRedPacketRainConfig.defaultConfig;
        [self commonInit];
    };return self;
}

-(instancetype)initWithFrame:(CGRect)frame
                      config:(JobsRedPacketRainConfig *)config{
    if (self = [super initWithFrame:frame]) {
        _config = config ? [config copy] : JobsRedPacketRainConfig.defaultConfig;
        [self commonInit];
    };return self;
}

-(void)dealloc{
    [self.spawnTimer stop];
    [self.fallTimer stop];
}

-(instancetype)onPacketTap:(void (^)(__kindof JobsRedPacketRainView * _Nonnull, NSUInteger))callback{
    self.tapCallback = callback;
    return self;
}

-(void)start{
    if (self.isRunning) return;
    [self buildTimerIfNeeded];
    self.running = YES;
    [self.spawnTimer start];
    [self.fallTimer start];
}

-(void)pause{
    if (!self.isRunning) return;
    self.running = NO;
    [self.spawnTimer pause];
    [self.fallTimer pause];
}

-(void)resume{
    if (self.isRunning) return;
    [self buildTimerIfNeeded];
    self.running = YES;
    [self.spawnTimer resume];
    [self.fallTimer resume];
}

-(void)stopWithClear:(BOOL)clear{
    self.running = NO;
    [self.spawnTimer stop];
    self.spawnTimer = nil;
    if (clear) {
        [self.fallTimer stop];
        self.fallTimer = nil;
        [self clearAllPackets];
    }else if (!self.activePackets.count){
        [self.fallTimer stop];
        self.fallTimer = nil;
    }
}

-(void)reset{
    [self stopWithClear:YES];
    self.tappedCount = 0;
}
#pragma mark —— 一些私有方法
-(void)commonInit{
    self.clipsToBounds = YES;
    self.userInteractionEnabled = YES;
}

-(void)buildTimerIfNeeded{
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
                    [self spawnPacketIfNeeded];
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
                    [self updatePackets];
                });
        });
    }
}

-(void)spawnPacketIfNeeded{
    @jobs_weakify(self)
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
    UIButton *packet = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnBgImage(self.config.packetImage ?: self.defaultPacketImage)
            .byImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView.byContentMode(UIViewContentModeScaleAspectFit);
            })
            .byUserInteractionEnabled(self.config.tapEnabled)
            .byClipsToBounds(YES)
            .byFrame(startFrame);
    });
    if (self.config.tapEnabled) {
        packet.onClickBy(^(__kindof UIButton * _Nullable button) {
            [weak_self packetTapAction:button];
        });
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
    packet.transform = CGAffineTransformMakeRotation(angle);
    packet.addOn(self);
    [self.activePackets addObject:packet];
    self.packetMotions[[NSValue valueWithNonretainedObject:packet]] = @{
        JobsRedPacketRainMotionSpawnTimeKey : @(CACurrentMediaTime()),
        JobsRedPacketRainMotionDurationKey : @(MAX(0.1, duration)),
        JobsRedPacketRainMotionStartCenterKey : [NSValue valueWithCGPoint:packet.center],
        JobsRedPacketRainMotionEndCenterKey : [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(endFrame), CGRectGetMidY(endFrame))]
    };
}

-(void)updatePackets{
    if (!self.activePackets.count) {
        if (!self.isRunning) {
            [self.fallTimer stop];
            self.fallTimer = nil;
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
        [self removePacket:packet];
    }
    if (!self.activePackets.count && !self.isRunning) {
        [self.fallTimer stop];
        self.fallTimer = nil;
    }
}

-(void)packetTapAction:(UIButton *)sender{
    [UIView animateWithDuration:0.08
                     animations:^{
        sender.transform = CGAffineTransformScale(sender.transform, 1.14, 1.14);
    } completion:^(__unused BOOL finished) {
        [UIView animateWithDuration:0.12
                         animations:^{
            sender.transform = CGAffineTransformScale(sender.transform, 0.01, 0.01);
            sender.alpha = 0;
        } completion:^(__unused BOOL finished) {
            [self removePacket:sender];
        }];
    }];
    self.tappedCount += 1;
    if (self.tapCallback) self.tapCallback(self, self.tappedCount);
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *feedback = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedback impactOccurred];
    }
}

-(void)clearAllPackets{
    for (UIButton *packet in self.activePackets.copy) {
        [packet removeFromSuperview];
    }
    [self.activePackets removeAllObjects];
    [self.packetMotions removeAllObjects];
}

-(void)removePacket:(UIButton *)packet{
    [self.activePackets removeObject:packet];
    [self.packetMotions removeObjectForKey:[NSValue valueWithNonretainedObject:packet]];
    [packet removeFromSuperview];
}

-(UIImage *)defaultPacketImage{
    CGSize size = CGSizeMake(44, 54);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = UIBezierPath.byBezierPathWithRoundedRect(CGRectMake(1, 1, size.width - 2, size.height - 2), 8);
    RGBA_COLOR(0.90 * 255.0, 0.05 * 255.0, 0.08 * 255.0, 1).setFill;
    [path fill];
    RGBA_COLOR(1.00 * 255.0, 0.82 * 255.0, 0.18 * 255.0, 1).setStroke;
    path.lineWidth = 2;
    [path stroke];
    CGContextSetFillColorWithColor(ctx, RGBA_COLOR(1.00 * 255.0, 0.82 * 255.0, 0.18 * 255.0, 1).CGColor);
    CGContextFillEllipseInRect(ctx, CGRectMake(10, 8, 24, 24));
    NSDictionary *attr = @{
        NSFontAttributeName: UIFontBoldSystemFontOfSize(18),
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

@end
