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

@end

@implementation PHCycleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self drawProgress];
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
                .byLineWidth(size.width);
            layer.lineCap = kCALineCapRound;
            layer.byPath(jobsMakeBezierPath(^(__kindof UIBezierPath * _Nullable data) {
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
-(void)updateProgress:(CGFloat)progress{
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd =  (progress + 13) / 100.0;
    [CATransaction commit];
    self.progressLabel.byText([NSString stringWithFormat:@"%.0f",progress]);

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

-(void)drawProgress{
    self.transform = CGAffineTransformMakeRotation(-M_PI/0.8);
    self.insideLayer.opaque = 1;
    self.outLayer.opaque = 1;
    self.progressLayer.opaque = 1;
    self.progressLabel.byAlpha(1);

    self.describeLabel.byAlpha(1);

}
#pragma mark —— set方法
- (void)setProgressColor:(UIColor *)progressColor{
    self.progressLayer.strokeColor = progressColor.CGColor;
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
    self.outLayer.strokeColor = outLayerColor.CGColor;
}
#pragma mark —— lazyLoad
- (UIBezierPath *)outsidePath{
    if (!_outsidePath) {
        _outsidePath = [UIBezierPath bezierPathWithArcCenter:KCenter
                                                      radius:(self.bounds.size.width - 5)/ 2.0 + 8
                                                  startAngle:-M_PI_2
                                                    endAngle:M_PI * 3.0 / 2.0
                                                   clockwise:YES];
    };return _outsidePath;
}

-(UIBezierPath *)insidePath{
    if (!_insidePath) {
        _insidePath = [UIBezierPath bezierPathWithArcCenter:KCenter
                                                     radius:(self.bounds.size.width - 30)/ 2.0
                                                 startAngle:-M_PI_2
                                                   endAngle:M_PI * 3.0 / 2.0
                                                  clockwise:YES];
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
                .byFillColor([UIColor colorWithWhite:1 alpha:0.5].CGColor)
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
                .byStrokeStart(M_PI / 12)
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
                .byStrokeStart(M_PI / 12)
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

@end
