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
Prop_strong() UIView *innerCircleView;
Prop_strong() UILongPressGestureRecognizer *longPressGesture;

@end

@implementation JobsOCVideoRecorderRecordButton
-(JobsRetJobsOCVideoRecorderRecordButtonByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderRecordButton *_Nullable(id<JobsOCVideoRecorderRecordButtonDelegate> _Nullable data){
        @jobs_strongify(self)
        self.delegate = data;
        return self;
    };
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.byBgColor(UIColor.clearColor);
        [self.layer addSublayer:self.trackLayer];
        [self.layer addSublayer:self.progressLayer];
        self.innerCircleView.addOn(self);
        [self addGestureRecognizer:self.longPressGesture];
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderRecordButton.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        CGFloat lineWidth = JobsWidth(4);
        CGFloat diameter = MIN(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        CGFloat radius = MAX(0, (diameter - lineWidth) * 0.5);
        UIBezierPath *path = UIBezierPath.byBezierPathWithArcCenter(center,
                                                                   radius,
                                                                   -M_PI_2,
                                                                   M_PI * 1.5,
                                                                   YES);
        self.trackLayer.byFrame(self.bounds);
        self.trackLayer.byPath(path.CGPath);
        self.trackLayer.byLineWidth(lineWidth);
        self.progressLayer.byFrame(self.bounds);
        self.progressLayer.byPath(path.CGPath);
        self.progressLayer.byLineWidth(lineWidth);
        CGRect innerFrame = CGRectInset(self.bounds, JobsWidth(14), JobsWidth(14));
        self.innerCircleView.byFrame(innerFrame);
        self.innerCircleView.layer.byCornerRadius(CGRectGetWidth(innerFrame) * 0.5);
    };
}

-(jobsByTimeIntervalBlock _Nonnull)startProgressWithDuration{
    @jobs_weakify(self)
    return ^(NSTimeInterval duration){
        @jobs_strongify(self)
        if (!self) return;
        [self.progressLayer removeAllAnimations];
        self.byProgress(1);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.byFromValue(@0);
        animation.byToValue(@1);
        animation.byDuration(MAX(duration, 0.1));
        animation.byRemovedOnCompletion(NO);
        animation.byFillMode(kCAFillModeForwards);
        [self.progressLayer addAnimation:animation forKey:@"JobsOCVideoRecorderProgress"];
    };
}

-(jobsByVoidBlock _Nonnull)stopProgress{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.progressLayer removeAllAnimations];
    };
}

-(jobsByVoidBlock _Nonnull)resetProgress{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [self.progressLayer removeAllAnimations];
        self.byProgress(0);
    };
}

-(void)setProgress:(CGFloat)progress{
    _progress = MIN(1, MAX(0, progress));
    self.progressLayer.byStrokeEnd(_progress);
}

-(JobsRetJobsOCVideoRecorderRecordButtonByCGFloatBlock _Nonnull)byProgress{
    @jobs_weakify(self)
    return ^__kindof JobsOCVideoRecorderRecordButton *_Nullable(CGFloat progress){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setProgress:progress];
        return self;
    };
}

-(void)longPressAction:(UILongPressGestureRecognizer *)gesture{
    jobsByLongPressGestureRecognizerBlock action = ((jobsByLongPressGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCVideoRecorderRecordButton.class, @selector(jobsLongPressAction)))(self, @selector(jobsLongPressAction));
    if (action) action(gesture);
}

-(jobsByLongPressGestureRecognizerBlock _Nonnull)jobsLongPressAction{
    @jobs_weakify(self)
    return ^(UILongPressGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
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
    };
}

-(CAShapeLayer *)trackLayer{
    if (!_trackLayer) {
        _trackLayer = CAShapeLayer.layer;
        _trackLayer.byFillColor(UIColor.clearColor.CGColor);
        _trackLayer.byStrokeColor(UIColor.whiteColor.CGColor);
        _trackLayer.byLineCap(kCALineCapRound);
        _trackLayer.byStrokeEnd(1);
    };return _trackLayer;
}

-(CAShapeLayer *)progressLayer{
    if (!_progressLayer) {
        _progressLayer = CAShapeLayer.layer;
        _progressLayer.byFillColor(UIColor.clearColor.CGColor);
        _progressLayer.byStrokeColor(UIColor.redColor.CGColor);
        _progressLayer.byLineCap(kCALineCapRound);
        _progressLayer.byStrokeEnd(0);
    };return _progressLayer;
}

-(UIView *)innerCircleView{
    if (!_innerCircleView) {
        _innerCircleView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byUserInteractionEnabled(NO);
        });
    };return _innerCircleView;
}

-(UILongPressGestureRecognizer *)longPressGesture{
    if (!_longPressGesture) {
        _longPressGesture = jobsMakeLongPressGesture(^(__kindof UILongPressGestureRecognizer * _Nullable gesture) {
            gesture.byMinimumPressDuration(0.15);
            [gesture addTarget:self action:@selector(longPressAction:)];
        });
    };return _longPressGesture;
}

@end
