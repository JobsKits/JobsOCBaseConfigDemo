//
//  LuckyWheelView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LuckyWheelView.h"

@interface LuckyWheelView ()

Prop_strong()UIView *plateView;
Prop_strong()UIButton *centerButton;
Prop_strong()CAShapeLayer *pointerLayer;
/// 真正画扇形的图层
Prop_strong()NSMutableArray<CAShapeLayer *> *sliceLayers;
/// 当前盘面角度（rad）
Prop_assign()CGFloat currentAngle;
/// 减速器
Prop_strong(nullable)ScrollDecelerator *decelerator;
/// 定时器（使用 CADisplayLink 模拟 JobsTimer.displayLink）
Prop_strong(nullable)CADisplayLink *displayLink;
Prop_assign()CGFloat timerInterval;
/// 手势
Prop_strong()UIPanGestureRecognizer *panGesture;
Prop_strong()UITapGestureRecognizer *tapRecognizer;
Prop_strong()UILongPressGestureRecognizer *longPressRecognizer;
/// Pan 拖动计算
Prop_assign()CGFloat lastTouchAngle;
Prop_assign()CFTimeInterval lastTouchTimestamp;
Prop_assign()CGFloat angularVelocityFromPan;
/// 减速率（默认 UIScrollViewDecelerationRateNormal）
Prop_assign()CGFloat decelerationRate;
/// 认为“停下”的角速度阈值（rad/s）
Prop_assign()CGFloat stopThreshold;
/// 是否正在自动旋转
Prop_assign(readwrite, getter=isSpinning)BOOL spinning;
/// 回调
Prop_copy(nullable)void (^segmentTapHandlerInternal)(LuckyWheelSegment *segment);
Prop_copy(nullable)void (^segmentLongPressHandlerInternal)(LuckyWheelSegment *segment,
                                                           UILongPressGestureRecognizer *gr);

- (void)updateCenterButtonBySpinning:(BOOL)spinning;
- (void)updateSpinningState:(BOOL)spinning;
- (void)notifyCurrentSegmentIfNeeded;

@end

@implementation LuckyWheelView
#pragma mark —— Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    };return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self commonInit];
    };return self;
}

- (instancetype)onSegmentTap:(jobsByLuckyWheelSegmentBlock)handler {
    self.segmentTapHandler = handler;
    return self;
}

- (instancetype)onSegmentLongPress:(jobsByLuckyWheelSegmentAndLPGesturerBlock)handler {
    self.segmentLongPressHandler = handler;
    return self;
}

- (instancetype)onSpinningStateChanged:(jobsByBOOLBlock)handler {
    self.spinningStateChangedHandler = handler;
    return self;
}

- (void)commonInit {
    self.byBgColor([UIColor clearColor]);
    self.byClipsToBounds(NO);
    self.layer.byMasksToBounds(NO);
    _pointerDirection     = JobsDirectionUp;
    _panRotationEnabled   = YES;
    _decelerationRate     = UIScrollViewDecelerationRateNormal;
    /// 盘面
    self.plateView.byVisible(YES);
    /// 中心按钮
    self.centerButton.byVisible(YES);
    [self updateCenterButtonBySpinning:NO];
    /// 手势
    self.addGesture(self.tapRecognizer);
    self.addGesture(self.panGesture);
    self.addGesture(self.longPressRecognizer);
    // Tap / LongPress 与 Pan 冲突时，让 Pan 优先
    [self.tapRecognizer requireGestureRecognizerToFail:self.panGesture];
    [self.longPressRecognizer requireGestureRecognizerToFail:self.panGesture];
}
#pragma mark —— Property
- (void)setSegments:(NSArray<LuckyWheelSegment *> *)segments {
    _segments = [segments copy];
    [self setNeedsLayout];
}

- (NSArray<UIColor *> *)colors {
    @jobs_weakify(self)
    return jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        @jobs_strongify(self)
        for (LuckyWheelSegment *seg in self.segments) {
            arr.add(seg.backgroundColor ?: JobsClearColor);
        }
    });
}

- (void)setColors:(NSArray<UIColor *> *)colors {
    self.segments = jobsMakeMutArr(^(__kindof NSMutableArray<LuckyWheelSegment *> * _Nullable arr) {
        for (UIColor *color in colors) {
            arr.add([[LuckyWheelSegment alloc] initWithText:nil
                                                   textFont:UIFontSystemFontOfSize(14)
                                                  textColor:JobsBlackColor
                                             attributedText:nil
                                            backgroundColor:color
                                           placeholderImage:nil
                                             imageURLString:nil]);
        }
    });
}

- (void)setPanRotationEnabled:(BOOL)panRotationEnabled {
    _panRotationEnabled = panRotationEnabled;
    self.panGesture.byEnabled(panRotationEnabled);
}

- (void)setSegmentTapHandler:(jobsByLuckyWheelSegmentBlock)segmentTapHandler {
    _segmentTapHandler = [segmentTapHandler copy];
    self.segmentTapHandlerInternal = _segmentTapHandler;
}

- (void)setSegmentLongPressHandler:(jobsByLuckyWheelSegmentAndLPGesturerBlock)segmentLongPressHandler {
    _segmentLongPressHandler = [segmentLongPressHandler copy];
    self.segmentLongPressHandlerInternal = _segmentLongPressHandler;
}
#pragma mark —— Layout / Draw
- (void)layoutSubviews {
    [super layoutSubviews];
    self.plateView.byFrame(self.bounds);
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0;
    self.plateView.layer.byCornerRadius(radius);
    self.plateView.layer.byMasksToBounds(YES);
    self.layer
        .byShadowColor(HEXCOLOR(0x8B5E1D).CGColor)
        .byShadowOpacity(0.22)
        .byShadowOffset(CGSizeMake(0, JobsWidth(14)))
        .byShadowRadius(JobsWidth(22))
        .byShadowPath(UIBezierPath.byBezierPathWithOvalInRect(self.bounds).CGPath);
    [self rebuildSlices];
    [self updatePointerLayer];
    [self bringSubviewToFront:self.centerButton];
}

- (void)updatePointerLayer {
    if (CGRectIsEmpty(self.bounds)) return;
    CGFloat centerX = CGRectGetMidX(self.bounds);
    CGFloat top = JobsWidth(8);
    UIBezierPath *path = jobsMakeBezierPath(nil);
    path
        .byMoveToPoint(CGPointMake(centerX - JobsWidth(13), top))
        .byAddLineToPoint(CGPointMake(centerX + JobsWidth(13), top))
        .byAddLineToPoint(CGPointMake(centerX, top + JobsWidth(28)))
        .byClosePath();
    self.pointerLayer
        .byPath(path.CGPath)
        .byFillColor(HEXCOLOR(0xFF9F1C).CGColor)
        .byStrokeColor(JobsWhiteColor.CGColor)
        .byLineWidth(JobsWidth(2))
        .byShadowColor(HEXCOLOR(0x7A4A10).CGColor)
        .byShadowOpacity(0.22)
        .byShadowOffset(CGSizeMake(0, JobsWidth(3)))
        .byShadowRadius(JobsWidth(5));
    if (!self.pointerLayer.superlayer) [self.layer addSublayer:self.pointerLayer];
}

- (void)rebuildSlices {
    /// 清理旧图层
    for (CAShapeLayer *layer in self.sliceLayers) {
        [layer removeFromSuperlayer];
    }
    [self.sliceLayers removeAllObjects];
    /// 清理旧 label / imageView
    NSArray<UIView *> *subviewsCopy = [self.plateView.subviews copy];
    for (UIView *v in subviewsCopy) {
        [v removeFromSuperview];
    }
    if (self.segments.count == 0 ||
        self.plateView.bounds.size.width <= 0 ||
        self.plateView.bounds.size.height <= 0) {
        return;
    }
    CGRect bounds = self.plateView.bounds;
    CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0 - JobsWidth(8);
    NSInteger count = self.segments.count;
    CGFloat twoPi = (CGFloat)(M_PI * 2.0);
    CGFloat anglePerSlice = twoPi / (CGFloat)count;
    for (NSInteger index = 0; index < count; index++) {
        LuckyWheelSegment *segment = self.segments[index];
        CGFloat startAngle = (CGFloat)(-M_PI_2) + (CGFloat)index * anglePerSlice;
        CGFloat endAngle = startAngle + anglePerSlice;
        UIBezierPath *path = jobsMakeBezierPath(nil);
        path
            .byMoveToPoint(center)
            .byAddArcWithCenter(center, radius, startAngle, endAngle, YES)
            .byClosePath();
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        UIColor *fillColor = segment.backgroundColor ?: [UIColor clearColor];
        layer.fillColor = fillColor.CGColor;
        layer.strokeColor = [JobsWhiteColor colorWithAlphaComponent:0.25].CGColor;
        layer.lineWidth = JobsWidth(0.5);
        [self.plateView.layer addSublayer:layer];
        [self.sliceLayers addObject:layer];
        // ===== 文本：整体“对准圆心” =====================
        CGFloat midAngle = (startAngle + endAngle) / 2.0;
        NSAttributedString *attr = [self attributedStringForSegment:segment];
        if (attr.length > 0) {
            UILabel *label = jobsMakeLabel(^(__kindof UILabel * _Nullable lab) {
                lab
                    .byNumberOfLines(0)
                    .byTextAlignment(NSTextAlignmentCenter)
                    .byAttributedString(attr)
                    .byBgColor(JobsClearColor);
            });
            CGFloat textRadius = radius * 0.55;
            CGPoint textCenter = CGPointMake(center.x + cos(midAngle) * textRadius,
                                             center.y + sin(midAngle) * textRadius);
            CGFloat maxTextWidth = anglePerSlice * radius * 0.5;
            CGFloat maxTextHeight = radius * 1.4;
            CGSize maxSize = CGSizeMake(maxTextWidth, maxTextHeight);
            CGRect rect = [attr boundingRectWithSize:maxSize
                                             options:(NSStringDrawingUsesLineFragmentOrigin |
                                                      NSStringDrawingUsesFontLeading)
                                             context:nil];
            CGFloat w = MIN(maxTextWidth, ceil(rect.size.width));
            CGFloat h = MIN(maxTextHeight, ceil(rect.size.height));
            CGFloat rotation = midAngle - (CGFloat)M_PI_2;
            label
                .byBounds(CGRectMake(0, 0, w, h))
                .byCenterPoint(textCenter)
                .byTransform(CGAffineTransformMakeRotation(rotation))
                .addOn(self.plateView);
        }
        // ===== 图片：文字外侧的圆形 ImageView ============
        if (segment.placeholderImage) {
            CGFloat imageRadius = radius * 0.8;
            CGPoint imageCenter = CGPointMake(center.x + cos(midAngle) * imageRadius,
                                              center.y + sin(midAngle) * imageRadius);
            CGFloat imageSize = radius * 0.22;
            jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                imageView
                    .byImage([segment.placeholderImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate])
                    .byTintColor(HEXCOLOR(0x9A6A2E))
                    .byBgColor([JobsWhiteColor colorWithAlphaComponent:0.48])
                    .byContentMode(UIViewContentModeScaleAspectFill)
                    .byClipsToBounds(YES)
                    .byBounds(CGRectMake(0, 0, imageSize, imageSize))
                    .byCenterPoint(imageCenter)
                    .byLayer(^(__kindof CALayer * _Nullable layer) {
                        layer
                            .byCornerRadius(imageSize / 2.0)
                            .byBorderWidth(JobsWidth(1))
                            .byBorderColor([JobsWhiteColor colorWithAlphaComponent:0.72].CGColor);
                    })
                    .addOn(self.plateView);
                // 如果希望支持网络图，可以在这里用你项目里的图片加载库：
                // [imageView <xxx_setImageWithURL:[NSURL URLWithString:segment.imageURLString] placeholderImage:segment.placeholderImage>];
            });
        }
    }
    for (NSInteger index = 0; index < count; index++) {
        CGFloat angle = (CGFloat)(-M_PI_2) + (CGFloat)index * anglePerSlice;
        UIBezierPath *linePath = jobsMakeBezierPath(nil);
        linePath
            .byMoveToPoint(center)
            .byAddLineToPoint(CGPointMake(center.x + cos(angle) * radius,
                                          center.y + sin(angle) * radius));
        CAShapeLayer *lineLayer = CAShapeLayer.layer;
        lineLayer
            .byPath(linePath.CGPath)
            .byFillColor(JobsClearColor.CGColor)
            .byStrokeColor([JobsWhiteColor colorWithAlphaComponent:0.68].CGColor)
            .byLineWidth(JobsWidth(1.2));
        [self.plateView.layer addSublayer:lineLayer];
        [self.sliceLayers addObject:lineLayer];
    }
    CGRect ringRect = CGRectMake(center.x - radius,
                                 center.y - radius,
                                 radius * 2.0,
                                 radius * 2.0);
    CAShapeLayer *outerRingLayer = CAShapeLayer.layer;
    outerRingLayer
        .byPath(UIBezierPath.byBezierPathWithOvalInRect(ringRect).CGPath)
        .byFillColor(JobsClearColor.CGColor)
        .byStrokeColor(JobsWhiteColor.CGColor)
        .byLineWidth(JobsWidth(8));
    [self.plateView.layer addSublayer:outerRingLayer];
    [self.sliceLayers addObject:outerRingLayer];
    CAShapeLayer *innerRingLayer = CAShapeLayer.layer;
    innerRingLayer
        .byPath(UIBezierPath.byBezierPathWithOvalInRect(CGRectInset(ringRect, JobsWidth(6), JobsWidth(6))).CGPath)
        .byFillColor(JobsClearColor.CGColor)
        .byStrokeColor([HEXCOLOR(0xE8B86B) colorWithAlphaComponent:0.72].CGColor)
        .byLineWidth(JobsWidth(1.2));
    [self.plateView.layer addSublayer:innerRingLayer];
    [self.sliceLayers addObject:innerRingLayer];
}

- (NSAttributedString *)attributedStringForSegment:(LuckyWheelSegment *)segment {
    if (segment.attributedText.length > 0) return segment.attributedText;
    if (segment.text.length == 0) return nil;
    UIFont *font = segment.textFont ?: UIFontWeightMediumSize(12);
    UIColor *color = segment.textColor ?: [UIColor blackColor];
    return [NSAttributedString.alloc initWithString:segment.text attributes:@{
        NSFontAttributeName: font,
        NSForegroundColorAttributeName: color
    }];
}
#pragma mark —— 旋转逻辑（减速）
- (void)startSpinWithScrollLikeDeceleration {
    [self startSpinWithScrollLikeDecelerationWithInitialVelocity:NAN];
}

- (void)startSpinWithScrollLikeDecelerationWithInitialVelocity:(CGFloat)initialVelocity {
    if (self.isSpinning || self.displayLink) return; // 已经在自动旋转中
    CGFloat v0 = 0;
    if (!isnan(initialVelocity)) {
        v0 = initialVelocity;
    } else if (self.customInitialVelocity != nil) {
        v0 = (CGFloat)self.customInitialVelocity.doubleValue;
    } else {
        v0 = self.velocityForTargetDuration(self.spinDuration);
    }
    [self updateCenterButtonBySpinning:YES];
    self.decelerator = [ScrollDecelerator.alloc initWithVelocity:v0 decelerationRate:self.decelerationRate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
    if (@available(iOS 10.0, *)) {
        self.displayLink.preferredFramesPerSecond = 60;
    }
    [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop
                           forMode:NSRunLoopCommonModes];
    [self updateSpinningState:YES];
}

-(JobsRetCGFloatByDoubleBlock _Nonnull)velocityForTargetDuration{
    @jobs_weakify(self)
    return ^CGFloat(NSTimeInterval duration){
        @jobs_strongify(self)
        // 防御：限制时间范围，避免数值爆炸
        double T = MAX(0.1, MIN(duration, 6.0));
        CGFloat d = self.decelerationRate;
        CGFloat eps = self.stopThreshold;
        double denom = pow(d, 1000.0 * T);
        if (denom < 1e-4) {
            return eps / 1e-4;
        } else {
            return (CGFloat)(eps / denom);
        }
    };
}

- (void)handleDisplayLink:(CADisplayLink *)link {
    if (!self.decelerator) {
        [self stopSpin];
        return;
    }
    CGFloat dt = self.timerInterval;
    CGFloat deltaAngle = self.decelerator.stepVtDt(dt);
    self.currentAngle += deltaAngle;
    self.plateView.transform = CGAffineTransformMakeRotation(self.currentAngle);
    if (self.decelerator.isStoppedByThreshold(self.stopThreshold)) {
        [self stopSpin];
        [self notifyCurrentSegmentIfNeeded];
    }
}

- (void)toggleSpin {
    if (self.isSpinning || self.displayLink) {
        [self stopSpin];
        [self notifyCurrentSegmentIfNeeded];
    } else {
        [self startSpinWithScrollLikeDeceleration];
    }
}

- (void)stopSpin {
    [self.displayLink invalidate];
    self.displayLink = nil;
    self.decelerator = nil;
    [self updateCenterButtonBySpinning:NO];
    [self updateSpinningState:NO];
}

- (void)updateCenterButtonBySpinning:(BOOL)spinning {
    self.centerButton.bySelected(spinning);
    self.centerButton.userInteractionEnabled = YES;
    self.centerButton.jobsResetBtnTitle(spinning ? @"停止\n抽奖".tr : @"开始\n抽奖".tr);
    self.centerButton.jobsResetBtnBgCor(spinning ? HEXCOLOR(0xC97812) : HEXCOLOR(0xFF9F1C));
}

- (void)updateSpinningState:(BOOL)spinning {
    [self updateCenterButtonBySpinning:spinning];
    if (self.spinning == spinning) return;
    self.spinning = spinning;
    if (self.spinningStateChangedHandler) {
        self.spinningStateChangedHandler(spinning);
    }
}

- (void)notifyCurrentSegmentIfNeeded {
    NSInteger idx = self.currentSegmentIndexForDirection(self.pointerDirection);
    if (idx >= 0 && idx < (NSInteger)self.segments.count) {
        LuckyWheelSegment *segment = self.segments[idx];
        jobsByLuckyWheelSegmentBlock handler = self.segmentTapHandlerInternal ? : self.segmentTapHandler;
        if (handler) handler(segment);
    }
}
#pragma mark —— Segment 命中计算
-(JobsRetNSIntegerByPointBlock _Nonnull)segmentIndexForPoint{
    @jobs_weakify(self)
    return ^NSInteger(CGPoint point){
        @jobs_strongify(self)
        if (self.segments.count == 0 ||
            self.bounds.size.width <= 0 ||
            self.bounds.size.height <= 0) {
            return -1;
        }
        CGRect bounds = self.bounds;
        CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
        CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
        CGFloat dx = point.x - center.x;
        CGFloat dy = point.y - center.y;
        CGFloat distance = hypot(dx, dy);
        if (distance > radius) {
            return -1;
        }
        // 触点相对圆心的绝对角度（世界坐标），[-π, π]
        CGFloat touchAngle = atan2(dy, dx);
        // 盘面已经被 currentAngle 旋转了；把触点角度“反旋转”回静止态
        CGFloat angle0 = touchAngle - self.currentAngle;
        CGFloat twoPi = (CGFloat)(M_PI * 2.0);
        while (angle0 < 0) angle0 += twoPi;
        while (angle0 >= twoPi) angle0 -= twoPi;
        // 静止态下，0 对应 -π/2（正上方）
        CGFloat startFromTop = (CGFloat)(-M_PI_2);
        CGFloat relative = angle0 - startFromTop;
        while (relative < 0) relative += twoPi;
        while (relative >= twoPi) relative -= twoPi;
        NSInteger count = self.segments.count;
        CGFloat anglePerSlice = twoPi / (CGFloat)count;
        NSInteger idx = (NSInteger)(relative / anglePerSlice);
        if (idx >= 0 && idx < count) {
            return idx;
        };return -1;
    };
}

-(JobsRetByNSIntegerBlock _Nonnull)currentSegmentIndexForDirection{
    @jobs_weakify(self)
    return ^NSInteger(JobsDirectionType direction){
        @jobs_strongify(self)
        if (self.segments.count == 0 ||
            self.bounds.size.width <= 0 ||
            self.bounds.size.height <= 0) {
            return -1;
        }
        CGRect bounds = self.bounds;
        CGPoint center = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
        CGFloat radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
        CGFloat inset = 1.0;
        CGPoint p;
        switch (direction) {
            case JobsDirectionUp:
                p = CGPointMake(center.x, center.y - radius + inset);
                break;
            case JobsDirectionDown:
                p = CGPointMake(center.x, center.y + radius - inset);
                break;
            case JobsDirectionLeft:
                p = CGPointMake(center.x - radius + inset, center.y);
                break;
            case JobsDirectionRight:
                p = CGPointMake(center.x + radius - inset, center.y);
                break;
        };return self.segmentIndexForPoint(p);
    };
}
#pragma mark —— DSL
/// DSL@设置指针方向
-(JobsRetLuckyWheelViewByPointerDirectionBlock _Nonnull)byPointerDirection{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(JobsDirectionType direction){
        @jobs_strongify(self)
        self.pointerDirection = direction;
        return self;
    };
}
/// DSL@设置完整 segments
-(JobsRetLuckyWheelViewBySegmentsBlock _Nonnull)bySegments{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(NSArray<LuckyWheelSegment *> *_Nullable segments){
        @jobs_strongify(self)
        self.segments = segments;
        return self;
    };
}
/// DSL@设置颜色数组（向下兼容）
/// 你内部如果有：根据 colors 生成 segments 的逻辑，可以放在 setter 里
-(JobsRetLuckyWheelViewByColorsBlock _Nonnull)byColors{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(NSArray<UIColor *> *_Nullable colors){
        @jobs_strongify(self)
        self.colors = colors;
        return self;
    };
}
/// DSL@设置旋转持续时间（秒）
-(JobsRetLuckyWheelViewByTimeIntervalBlock _Nonnull)bySpinDuration{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(NSTimeInterval duration){
        @jobs_strongify(self)
        self.spinDuration = duration;
        return self;
    };
}
/// DSL@设置自定义初始角速度（rad/s）
-(JobsRetLuckyWheelViewByNumberBlock _Nonnull)byCustomInitialVelocity{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(NSNumber *_Nullable value){
        @jobs_strongify(self)
        self.customInitialVelocity = value;
        return self;
    };
}
/// DSL@设置是否允许手势拖动旋转
-(JobsRetLuckyWheelViewByBOOLBlock _Nonnull)byPanRotationEnabled{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView *_Nullable(BOOL flag){
        @jobs_strongify(self)
        self.panRotationEnabled = flag;
        return self;
    };
}
/// DSL@配置短按回调
- (JobsRetLuckyWheelViewBySegmentTapDSLBlock _Nonnull)bySegmentTap{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView * _Nullable(jobsByLuckyWheelSegmentBlock handler){
        @jobs_strongify(self)
        [self onSegmentTap:handler];   // 复用原来的实现
        return self;
    };
}
/// DSL@配置长按回调
- (JobsRetLuckyWheelViewBySegmentLongPressDSLBlock _Nonnull)bySegmentLongPress{
    @jobs_weakify(self)
    return ^__kindof LuckyWheelView * _Nullable(jobsByLuckyWheelSegmentAndLPGesturerBlock handler){
        @jobs_strongify(self)
        [self onSegmentLongPress:handler]; // 复用原来的实现
        return self;
    };
}
#pragma mark —— lazyLoad
/// 旋转持续时间（秒，近似控制）
-(NSTimeInterval)spinDuration{
    if(!_spinDuration){
        _spinDuration = 3.0;
    };return _spinDuration;
}

-(CGFloat)timerInterval{
    if(!_timerInterval){
        _timerInterval = 1.0 / 60.0;
    };return _timerInterval;
}

-(CGFloat)stopThreshold{
    if(!_stopThreshold){
        _stopThreshold = 0.05;
    };return _stopThreshold;
}

-(NSMutableArray<CAShapeLayer *> *)sliceLayers{
    if(!_sliceLayers){
        _sliceLayers = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
        });
    };return _sliceLayers;
}

-(UIView *)plateView{
    if(!_plateView){
        @jobs_weakify(self)
        _plateView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsClearColor)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self);
                });
        });
    };return _plateView;
}

-(UIButton *)centerButton{
    if(!_centerButton){
        @jobs_weakify(self)
        _centerButton = UIButton.jobsInit()
            .bgColorBy(HEXCOLOR(0xFF9F1C))
            .jobsResetImagePlacement(NSDirectionalRectEdgeLeading)
            .jobsResetBtnCornerRadiusValue(JobsWidth(36))
            .makeNewLineShows(2)
            .jobsResetImagePadding(1)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .selectedStateTitleColorBy(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(16)))
            .jobsResetBtnTitle(@"开始\n抽奖".tr)
            .selectedStateTitleBy(@"停止\n抽奖".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self toggleSpin];
                // 如果你有通用弹跳 & 震动封装，可以在这里调用
                // [sender jobs_playTapBounceWithHaptic:JobsHapticLight];
            })
            .onClickAppendBy(^(UIButton *x){
                JobsLog(@"追加的点击事件");
            })
            .onLongPressGestureBy(^(UIButton *x){;
            })
            .makeBtnTitleByShowingType(UILabelShowingType_03)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self);
                make.width.mas_equalTo(JobsWidth(72));
                make.height.mas_equalTo(JobsWidth(72));
            });
        _centerButton.layer
            .byBorderWidth(JobsWidth(4))
            .byBorderColor(JobsWhiteColor.CGColor)
            .byShadowColor(HEXCOLOR(0x8B5E1D).CGColor)
            .byShadowOpacity(0.22)
            .byShadowOffset(CGSizeMake(0, JobsWidth(5)))
            .byShadowRadius(JobsWidth(8));
    };return _centerButton;
}

-(CAShapeLayer *)pointerLayer{
    if(!_pointerLayer){
        _pointerLayer = CAShapeLayer.layer;
    };return _pointerLayer;
}

-(UIPanGestureRecognizer *)panGesture{
    if(!_panGesture){
        @jobs_weakify(self)
        _panGesture = [jobsMakePanGesture(^(__kindof UIPanGestureRecognizer * _Nullable gesture) {
            gesture.cancelsTouchesInView = YES;
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            if (!self.panRotationEnabled) return;
            if (![gesture isKindOfClass:UIPanGestureRecognizer.class]) return;
            CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
            CGPoint location = [gesture locationInView:self];
            if (gesture.state == UIGestureRecognizerStateBegan &&
                CGRectContainsPoint(self.centerButton.frame, location)) {
                // 从按钮区域开始的拖动忽略
                return;
            }
            if (gesture.state == UIGestureRecognizerStateBegan && self.displayLink) {
                [self stopSpin];
            } else if (self.displayLink) {
                return;
            }
            CGFloat dx = location.x - center.x;
            CGFloat dy = location.y - center.y;
            CGFloat angle = atan2(dy, dx);
            CFTimeInterval now = CACurrentMediaTime();
            switch (gesture.state) {
                case UIGestureRecognizerStateBegan: {
                    self.lastTouchAngle = angle;
                    self.lastTouchTimestamp = now;
                    self.angularVelocityFromPan = 0;
                } break;
                case UIGestureRecognizerStateChanged: {
                    CGFloat step = angle - self.lastTouchAngle;
                    CGFloat pi = (CGFloat)M_PI;
                    if (step > pi) {
                        step -= 2.0 * pi;
                    } else if (step < -pi) {
                        step += 2.0 * pi;
                    }
                    self.currentAngle += step;
                    self.plateView.transform = CGAffineTransformMakeRotation(self.currentAngle);
                    CFTimeInterval dt = now - self.lastTouchTimestamp;
                    if (dt > 0) {
                        self.angularVelocityFromPan = step / (CGFloat)dt;
                    }
                    self.lastTouchAngle = angle;
                    self.lastTouchTimestamp = now;
                } break;
                case UIGestureRecognizerStateEnded:
                case UIGestureRecognizerStateCancelled:
                case UIGestureRecognizerStateFailed: {
                    CGFloat v = self.angularVelocityFromPan;
                    self.angularVelocityFromPan = 0;
                    if (fabs(v) > 0.1) {
                        [self startSpinWithScrollLikeDecelerationWithInitialVelocity:v];
                    }
                } break;
                default:
                    break;
            }
        }];
    };return _panGesture;
}

-(UILongPressGestureRecognizer *)longPressRecognizer{
    if(!_longPressRecognizer){
        @jobs_weakify(self)
        _longPressRecognizer = [jobsMakeLongPressGesture(^(UILongPressGestureRecognizer * _Nullable gesture) {
            ///  这里写手势的配置
            gesture.minimumPressDuration = 0.5;
            gesture.allowableMovement = 12.0;
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            // 旋转中不响应长按
            if (self.displayLink) return;
            CGPoint point = [gesture locationInView:self];
            // 点到中心按钮区域 -> 不算扇形长按
            if (CGRectContainsPoint(self.centerButton.frame, point)) {
                return;
            }
            NSInteger index = self.segmentIndexForPoint(point);
            if (index < 0 || index >= (NSInteger)self.segments.count) return;
            LuckyWheelSegment *segment = self.segments[index];
            if (self.segmentLongPressHandlerInternal) {
                self.segmentLongPressHandlerInternal(segment, gesture);
            }
        }];
    };return _longPressRecognizer;
}

-(UITapGestureRecognizer *)tapRecognizer{
    if(!_tapRecognizer){
        @jobs_weakify(self)
        _tapRecognizer = [jobsMakeTapGesture(^(UITapGestureRecognizer * _Nullable gesture) {
            ///  这里写手势的配置
            gesture.cancelsTouchesInView = NO;
        }) GestureActionBy:^(__kindof UIGestureRecognizer * _Nullable gesture) {
            @jobs_strongify(self)
            /// 这里写手势的触发
            if (gesture.state != UIGestureRecognizerStateEnded) return;
            // 旋转中不响应点击
            if (self.displayLink) return;
            CGPoint point = [gesture locationInView:self];
            // 点到中心按钮区域 -> 交给按钮自己处理
            if (CGRectContainsPoint(self.centerButton.frame, point)) return;
            NSInteger index = self.segmentIndexForPoint(point);
            if (index < 0 || index >= (NSInteger)self.segments.count) return;
            LuckyWheelSegment *segment = self.segments[index];
            if (self.segmentTapHandlerInternal) {
                self.segmentTapHandlerInternal(segment);
            }
        }];
    };return _tapRecognizer;
}

@end
