//
//  JobsOCVideoRecorderRecordButton.m
//  JobsOCVideoRecorder
//
//  Created by Jobs on 2026年7月3日，星期五.
//

#import "JobsOCVideoRecorderRecordButton.h"

@interface JobsOCVideoRecorderRecordButton ()

Prop_strong() CAShapeLayer *trackLayer;
Prop_strong() CAShapeLayer *progressLayer;
Prop_strong() UIView *redCircleView;
Prop_strong() UILongPressGestureRecognizer *longPressGesture;

@end

@implementation JobsOCVideoRecorderRecordButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.clearColor;
        [self.layer addSublayer:self.trackLayer];
        [self.layer addSublayer:self.progressLayer];
        [self addSubview:self.redCircleView];
        [self addGestureRecognizer:self.longPressGesture];
    };return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat lineWidth = JobsWidth(5);
    CGFloat diameter = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGFloat radius = MAX(0, (diameter - lineWidth) * 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:radius
                                                    startAngle:-M_PI_2
                                                      endAngle:M_PI * 1.5
                                                     clockwise:YES];
    self.trackLayer.frame = self.bounds;
    self.trackLayer.path = path.CGPath;
    self.trackLayer.lineWidth = lineWidth;

    self.progressLayer.frame = self.bounds;
    self.progressLayer.path = path.CGPath;
    self.progressLayer.lineWidth = lineWidth;

    CGRect redFrame = CGRectInset(self.bounds, JobsWidth(14), JobsWidth(14));
    self.redCircleView.frame = redFrame;
    self.redCircleView.layer.cornerRadius = CGRectGetWidth(redFrame) * 0.5;
}

-(void)startProgressWithDuration:(NSTimeInterval)duration{
    [self.progressLayer removeAllAnimations];
    self.progress = 1;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = MAX(duration, 0.1);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.progressLayer addAnimation:animation forKey:@"JobsOCVideoRecorderProgress"];
}

-(void)stopProgress{
    [self.progressLayer removeAllAnimations];
}

-(void)resetProgress{
    [self.progressLayer removeAllAnimations];
    self.progress = 0;
}

-(void)setProgress:(CGFloat)progress{
    _progress = MIN(1, MAX(0, progress));
    self.progressLayer.strokeEnd = _progress;
}

-(void)longPressAction:(UILongPressGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(recordButtonDidBeginLongPress:)]) {
            [self.delegate recordButtonDidBeginLongPress:self];
        }
    }else if (gesture.state == UIGestureRecognizerStateEnded ||
              gesture.state == UIGestureRecognizerStateCancelled ||
              gesture.state == UIGestureRecognizerStateFailed){
        if ([self.delegate respondsToSelector:@selector(recordButtonDidEndLongPress:)]) {
            [self.delegate recordButtonDidEndLongPress:self];
        }
    }
}

-(CAShapeLayer *)trackLayer{
    if (!_trackLayer) {
        _trackLayer = CAShapeLayer.layer;
        _trackLayer.fillColor = UIColor.clearColor.CGColor;
        _trackLayer.strokeColor = UIColor.whiteColor.CGColor;
        _trackLayer.lineCap = kCALineCapRound;
        _trackLayer.strokeEnd = 1;
    };return _trackLayer;
}

-(CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        _progressLayer = CAShapeLayer.layer;
        _progressLayer.fillColor = UIColor.clearColor.CGColor;
        _progressLayer.strokeColor = UIColor.redColor.CGColor;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.strokeEnd = 0;
    };return _progressLayer;
}

-(UIView *)redCircleView{
    if (!_redCircleView) {
        _redCircleView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.backgroundColor = UIColor.redColor;
            view.userInteractionEnabled = NO;
        });
    };return _redCircleView;
}

-(UILongPressGestureRecognizer *)longPressGesture{
    if (!_longPressGesture) {
        _longPressGesture = jobsMakeLongPressGesture(^(__kindof UILongPressGestureRecognizer * _Nullable gesture) {
            gesture.minimumPressDuration = 0.15;
            [gesture addTarget:self action:@selector(longPressAction:)];
        });
    };return _longPressGesture;
}

@end
