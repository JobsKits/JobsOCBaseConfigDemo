//
//  PHCycleView.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PHCycleView.h"

@interface PHCycleView()

Prop_strong()CAShapeLayer *outLayer;
Prop_strong()CAShapeLayer *progressLayer;
Prop_strong()UILabel *progressLabel;
Prop_strong()UILabel *describeLabel;
Prop_strong()UIBezierPath *outsidePath;
Prop_strong()UIBezierPath *insidePath;
Prop_strong()CAShapeLayer *insideLayer;
Prop_assign()CGFloat currentProgress;

-(void)_updateProgress:(CGFloat)progress animated:(BOOL)animated;
-(jobsByUITouchBlock _Nonnull)_updateProgressWithTouch;
-(JobsRetByCGPointBlock _Nonnull)_progressWithTouchPoint;
-(JobsRetCGFloatByCGFloatBlock _Nonnull)_safeProgress;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN PHCycleView
@interface PHCycleView (JobsPropertyDSLSetterAutogen_e812d12dcb)
-(void)setCurrentProgress:(CGFloat)data;
-(void)setDescribeFont:(UIFont * _Nullable)data;
-(void)setDescribeStr:(NSString * _Nullable)data;
-(void)setDescribeTextColor:(UIColor * _Nullable)data;
-(void)setOutLayerColor:(UIColor * _Nullable)data;
-(void)setProgressFont:(UIFont * _Nullable)data;
-(void)setProgressTextColor:(UIColor * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END PHCycleView

@implementation PHCycleView
static CGFloat const PHCycleViewMinProgress = 0.0f;
static CGFloat const PHCycleViewMaxProgress = 100.0f;
static CGFloat const PHCycleViewStrokeStart = M_PI / 12.0;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byMultipleTouchEnabled(NO);
        self.byUserInteractionEnabled(YES);
        self.drawProgress();
    };return self;
}
/// 核心代码
-(CALayer*)_createLinesLayerWithFrame:(CGRect)frame
                             preAngle:(CGFloat)angle
                             lineSize:(CGSize)size
                                color:(UIColor *)color{
    CALayer *linesLayer = CALayer.layer;
    linesLayer.byFrame(frame);
    for (int i = 0; i < (int)(360 / angle); i++) {
        CGFloat curAngle = i * angle;
        if (curAngle > 225 && curAngle < 315) continue;
        CGPoint layerCenter = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
        linesLayer.addSublayer(jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            layer.byStrokeColor(color.CGColor)
                .byLineWidth(size.width)
            .byLineCap(kCALineCapRound)
            .byPath(jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable data) {
                data.moveTo([self _calcCircleCoordinateWithCenter:layerCenter
                                                            angle:i * angle
                                                           radius:layerCenter.x]);
                data.add([self _calcCircleCoordinateWithCenter:layerCenter
                                                         angle:i * angle
                                                        radius:layerCenter.x - size.height]);
            }).CGPath);
        }));
    };return linesLayer;
}

-(CGPoint)_calcCircleCoordinateWithCenter:(CGPoint)ct
                                    angle:(CGFloat)angle
                                   radius:(CGFloat)radius{
    CGFloat x2 = radius * cosf(angle * M_PI / 180);
    CGFloat y2 = radius * sinf(angle * M_PI / 180);
    return CGPointMake(ct.x + x2, ct.y - y2);
}
//外界调用
-(jobsByCGFloatBlock _Nonnull)updateProgress{
    @jobs_weakify(self)
    return ^(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return;
        [self _updateProgress:progress animated:YES];
    };
}

-(void)_updateProgress:(CGFloat)progress animated:(BOOL)animated{
    CGFloat safeProgress = self._safeProgress(progress);
    CGFloat strokeEnd = PHCycleViewStrokeStart + safeProgress / PHCycleViewMaxProgress * (1 - PHCycleViewStrokeStart);
    self.byCurrentProgress(safeProgress);
    [CATransaction begin];
    if (animated) {
        [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
        [CATransaction setAnimationDuration:0.5];
    }else{
        [CATransaction setDisableActions:YES];
    }
    self.progressLayer.byStrokeEnd(strokeEnd);
    [CATransaction commit];
    self.progressLabel.byText([NSString stringWithFormat:@"%.0f",safeProgress]);
}

-(jobsByUITouchBlock _Nonnull)_updateProgressWithTouch{
    @jobs_weakify(self)
    return ^(UITouch * touch){
        @jobs_strongify(self)
        if (!self) return;
        if (!touch) return;
        [self _updateProgress:self._progressWithTouchPoint([touch locationInView:self])
                     animated:NO];
    };
}

-(JobsRetByCGPointBlock _Nonnull)_progressWithTouchPoint{
    @jobs_weakify(self)
    return ^CGFloat(CGPoint point){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat deltaX = point.x - center.x;
        CGFloat deltaY = point.y - center.y;
        if (hypot(deltaX, deltaY) <= 1.0f) return self.currentProgress;
        CGFloat fraction = (atan2(deltaY, deltaX) + M_PI_2) / (M_PI * 2.0);
        if (fraction < 0) fraction += 1.0f;
        if (fraction < PHCycleViewStrokeStart) {
            fraction = fraction <= PHCycleViewStrokeStart * 0.5f ? 1.0f : PHCycleViewStrokeStart;
        };return (fraction - PHCycleViewStrokeStart) / (1 - PHCycleViewStrokeStart) * PHCycleViewMaxProgress;
    };
}

-(JobsRetCGFloatByCGFloatBlock _Nonnull)_safeProgress{
    @jobs_weakify(self)
    return ^CGFloat(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MAX(PHCycleViewMinProgress, MIN(PHCycleViewMaxProgress, progress));
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    self._updateProgressWithTouch(touches.anyObject);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    self._updateProgressWithTouch(touches.anyObject);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    self._updateProgressWithTouch(touches.anyObject);
}

//外界调用
-(void)setLinePreAngle:(CGFloat)preAngle
              lineSize:(CGSize)size
                 color:(UIColor *)color{
    CALayer *linesLayer = [self _createLinesLayerWithFrame:self.bounds
                                                  preAngle:preAngle
                                                  lineSize:size
                                                     color:color];
    linesLayer.transform = CATransform3DRotate(linesLayer.transform,
                                               M_PI / 0.8,
                                               0,
                                               0,
                                               1);
    self.layer.addSublayer(linesLayer);
}

-(jobsByVoidBlock _Nonnull)drawProgress{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byTransform(CGAffineTransformMakeRotation(-M_PI/0.8));
        self.insideLayer.byOpaque(1);
        self.outLayer.byOpaque(1);
        self.progressLayer.byOpaque(1);
        self.progressLabel.byAlpha(1);
        self.describeLabel.byAlpha(1);
    };
}
#pragma mark —— set方法
- (void)setProgressColor:(UIColor *)progressColor{
    (((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(PHCycleView.class, @selector(jobsSetProgressColor)))(self, @selector(jobsSetProgressColor)))(progressColor);
}
-(jobsByCorBlock _Nonnull)jobsSetProgressColor{
    @jobs_weakify(self)
    return ^(UIColor *progressColor){
        @jobs_strongify(self)
        if (!self) return;
        self.progressLayer.byStrokeColor(progressColor.CGColor);
    };
}

- (void)setProgressFont:(UIFont *)progressFont{
    self.progressLabel.byFont(progressFont);
}

-(void)setDescribeStr:(NSString *)describeStr{
    _describeStr = describeStr;
    self.describeLabel.byText(describeStr);
}

-(void)setDescribeFont:(UIFont *)describeFont{
    _describeFont = describeFont;
    self.describeLabel.byFont(describeFont);
}

-(void)setProgressTextColor:(UIColor *)progressTextColor{
    _progressTextColor = progressTextColor;
    self.progressLabel.byTextCor(progressTextColor);
}

-(void)setDescribeTextColor:(UIColor *)describeTextColor{
    _describeTextColor = describeTextColor;
    self.describeLabel.byTextCor(describeTextColor);
}

-(void)setOutLayerColor:(UIColor *)outLayerColor{
    _outLayerColor = outLayerColor;
    self.outLayer.byStrokeColor(outLayerColor.CGColor);
}
#pragma mark —— lazyLoad
- (UIBezierPath *)outsidePath{
    if (!_outsidePath) {
        _outsidePath = UIBezierPath.byBezierPathWithArcCenter(KCenter,
                                                              (self.bounds.size.width - 5) / 2.0 + 8,
                                                              -M_PI_2,
                                                              M_PI * 3.0 / 2.0,
                                                              YES);
    };return _outsidePath;
}

-(UIBezierPath *)insidePath{
    if (!_insidePath) {
        _insidePath = UIBezierPath.byBezierPathWithArcCenter(KCenter,
                                                             (self.bounds.size.width - 30) / 2.0,
                                                             -M_PI_2,
                                                             M_PI * 3.0 / 2.0,
                                                             YES);
    };return _insidePath;
}

-(CAShapeLayer *)insideLayer{
    if (!_insideLayer) {
        @jobs_weakify(self)
        _insideLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer
                .byStrokeColor(JobsClearColor.CGColor)
                .byLineWidth(kBorderWith)
                .byFillColor(RGBA_SAMECOLOR(255, 0.5).CGColor)
                .byPath(self.insidePath.CGPath)
                .addOn(self.layer);
        });
    };return _insideLayer;
}
/// 外圈
-(CAShapeLayer *)outLayer{
    if (!_outLayer) {
        @jobs_weakify(self)
        _outLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer
                .byLineWidth(3)
                .byStrokeColor(RGBA_COLOR(0, 0, 255, .3f).CGColor)
                .byFillColor(JobsClearColor.CGColor)
                .byPath(self.outsidePath.CGPath)
                .byStrokeStart(PHCycleViewStrokeStart)
                .byStrokeEnd(1)
                .addOn(self.layer);
        });
    };return _outLayer;
}
/// 进度条
-(CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        @jobs_weakify(self)
        _progressLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            @jobs_strongify(self)
            layer
                .byFillColor(JobsClearColor.CGColor)
                .byLineWidth(3)
                .byPath(self.outsidePath.CGPath)
                .byStrokeStart(PHCycleViewStrokeStart)
                .addOn(self.layer);
        });
    };return _progressLayer;
}
/// 进度Label
-(UILabel *)progressLabel{
    if (!_progressLabel) {
        @jobs_weakify(self)
        _progressLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byTransform(CGAffineTransformMakeRotation(M_PI / 0.8))
                .byFrame(CGRectMake(10,
                                    55,
                                    self.frame.size.width - 100,
                                    40))
                .addOn(self);
        });
    };return _progressLabel;
}
/// 描述Label
-(UILabel *)describeLabel{
    if (!_describeLabel) {
        @jobs_weakify(self)
        _describeLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byTextAlignment(NSTextAlignmentCenter)
                .byTransform(CGAffineTransformMakeRotation(M_PI / 0.8))
                .byFrame(CGRectMake(30,
                                    40,
                                    self.frame.size.width - 100,
                                    30))
                .addOn(self);
        });
    };return _describeLabel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN PHCycleView
-(JobsRetPHCycleViewByCGFloatBlock _Nonnull)byCurrentProgress{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setCurrentProgress:data];
        return self;
    };
}

-(JobsRetPHCycleViewByNSStringBlock _Nonnull)byDescribeStr{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeStr:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byDescribeTextColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeTextColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byOutLayerColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setOutLayerColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIColorBlock _Nonnull)byProgressTextColor{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIColor * _Nullable data){
        @jobs_strongify(self)
        [self setProgressTextColor:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byDescribeFont{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setDescribeFont:data];
        return self;
    };
}

-(JobsRetPHCycleViewByUIFontBlock _Nonnull)byProgressFont{
    @jobs_weakify(self)
    return ^__kindof PHCycleView * _Nullable(UIFont * _Nullable data){
        @jobs_strongify(self)
        [self setProgressFont:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END PHCycleView
@end
