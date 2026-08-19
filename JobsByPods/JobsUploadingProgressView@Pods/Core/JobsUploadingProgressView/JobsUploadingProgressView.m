//
//  JobsUploadingProgressView.m
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsUploadingProgressView.h"

@interface JobsUploadingProgressView()
/// UI
Prop_strong()UIBezierPath *bezier;
Prop_strong()UILabel *refreshLabel;
Prop_strong()UILabel *subrefreshLabel;
Prop_strong()UIImageView *imgeV;
Prop_strong()UIView *backView;
Prop_strong()UIView *shapLayerView;
Prop_strong()CAShapeLayer *shapLayer;
Prop_strong()CAKeyframeAnimation *anim;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsUploadingProgressView
@interface JobsUploadingProgressView (JobsPropertyDSLSetterAutogen_3bca37b444)
-(void)setAnim:(CAKeyframeAnimation * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsUploadingProgressView

@implementation JobsUploadingProgressView
static JobsUploadingProgressView *static_uploadingProgressView = nil;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsUploadingProgressView.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        @synchronized(self){
            if (!static_uploadingProgressView) {
                static_uploadingProgressView = [JobsUploadingProgressView.alloc initWithFrame:CGRectMake((JobsMainScreen_WIDTH() - 267) / 2,
                                                                                                       JobsMainScreen_HEIGHT() / 2 - 76,
                                                                                                       267,
                                                                                                       76)];
            }
        };return static_uploadingProgressView;
    };
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        static_uploadingProgressView = self;
        self.addOn(jobsGetMainWindow());
        [jobsGetMainWindow() bringSubviewToFront:self];
        self.imge = @"icon_upload_imge".img;
        self.byStrokeColor(self.byPatternImage(@"gradualColor".img.imageResize(CGSizeMake(50, 25))));
        self.radius = 34;
        self.byHidden(YES);
        self.byBgColor(JobsSecondarySystemBackgroundColor.colorWithAlphaComponentBy(.9f));
        self.layer.byCornerRadius(10);
        self.byClipsToBounds(YES);
    };return self;
}

-(JobsRetJobsUploadingProgressViewByCorBlock _Nonnull)byStrokeColor{
    @jobs_weakify(self)
    return ^__kindof JobsUploadingProgressView *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setStrokeColor:color];
        return self;
    };
}
#pragma mark —— 一些公有方法
-(jobsByStrBlock _Nonnull)updateProgressText{
    @jobs_weakify(self)
    return ^(NSString * progressText){
        @jobs_strongify(self)
        if (!self) return;
        self.byHidden(NO);
        self.backView.byHidden(NO);
        self.subrefreshLabel.byText(progressText);
        self.starAnimation();
    };
}
#pragma mark —— 一些私有方法
/// 创建动画
- (jobsByVoidBlock _Nonnull)starAnimation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.shapLayer.byHidden(NO);
        self.imgeV.byAlpha(1);
    };
}

-(void)dismiss{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsUploadingProgressView.class, @selector(jobsDismiss)))(self, @selector(jobsDismiss));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDismiss{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byHidden(YES);
        self.backView.byHidden(YES);
        [self.shapLayer removeAnimationForKey:@"CLAnimation"];
        if (self.timer) self.timer.jobsStop();
        self.byAnim(nil);
    };
}
#pragma mark —— lazyLoad
@synthesize timer = _timer;
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer.byTimerType(JobsTimerTypeNSTimer)
            .byTimerStyle(TimerStyle_clockwise) // 倒计时模式
            .byTimeInterval(1)
            .byTimeSecIntervalSinceDate(0)
            .byQueue(dispatch_get_main_queue())
            .byTimerState(JobsTimerStateIdle)
            .byStartTime(0)
            .byTime(0)
            .byOnTick(^(CGFloat time){
                @jobs_strongify(self)
                self.refreshLabel.byText(@"正在上传...".jobsTr());
                if (self.objBlock) self.objBlock(timer);
            })
            .byOnFinish(^(JobsTimer *_Nullable timer){
                @jobs_strongify(self)
                JobsLog(@"倒计时结束...");
                if (self.objBlock) self.objBlock(timer);
            })

                .byAccumulatedElapsed(0)
                .byLastStartDate(nil);
        });
    };return _timer;
}

-(CAShapeLayer *)shapLayer{
    if (!_shapLayer) {
        @jobs_weakify(self)
        _shapLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer *_Nullable layer) {
            @jobs_strongify(self)
            layer
                .byFillColor(JobsClearColor.CGColor)
                .byLineWidth(2.0f)
                .byStrokeColor(self.strokeColor.CGColor) // 线条颜色
                .byPath(self.bezier.CGPath)
                .byStrokeStart(0)
                .byStrokeEnd(0.85)
                .byFrame(CGRectMake(0, 0, self.radius, self.radius))
                .byAddAnimation(self.anim, @"CLAnimation");
            self.shapLayerView.layer.addSublayer(layer);
        });
    };return _shapLayer;
}

-(UIBezierPath *)bezier{
    if (!_bezier) {
        _bezier = UIBezierPath.byBezierPathWithOvalInRect(CGRectMake(0,
                                                                    0,
                                                                    self.radius,
                                                                    self.radius));// 画个圆
    };return _bezier;
}

-(CAKeyframeAnimation *)anim{
    if (!_anim) {
        _anim = jobsMakeCAKeyframeAnimation(^(__kindof CAKeyframeAnimation *_Nullable animation) {
            animation
                .byValues(jobsMakeMutArr(^(NSMutableArray *_Nullable data) {
                    data
                        .add(@(M_PI / 4.0))
                        .add(@(M_PI * 2 / 4.0))
                        .add(@(M_PI * 3 / 4.0))
                        .add(@(4 * M_PI / 4.0))
                        .add(@(5 * M_PI / 4.0))
                        .add(@(6 * M_PI / 4.0))
                        .add(@(7 * M_PI / 4.0))
                        .add(@(8 * M_PI / 4.0))
                        .add(@(8 * M_PI / 4.0 + M_PI / 4.0));
                }))
                .byKeyPath(@"transform.rotation")
                .byRepeatCount(MAXFLOAT)
                .byDuration(1)
                .byRemovedOnCompletion(NO)
                .byFillMode(kCAFillModeForwards);
        });
    };return _anim;
}

-(UIView *)shapLayerView{
    if (!_shapLayerView) {
        @jobs_weakify(self)
        _shapLayerView = jobsMakeView(^(__kindof UIView *_Nullable view) {
            @jobs_strongify(self)
            view
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self);
                    make.left.equalTo(self).offset(JobsWidth(62));
                    make.height.offset(self.radius + JobsWidth(2));
                    make.width.offset(self.radius + JobsWidth(2));
                });
        });
    };return _shapLayerView;
}

-(UIImageView *)imgeV{
    if (!_imgeV) {
        @jobs_weakify(self)
        _imgeV = jobsMakeImageView(^(__kindof UIImageView *_Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(self.imge)
                .addOn(self.shapLayerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.shapLayerView).offset(-JobsWidth(2)); // 由于图片不是对称的，需要位置微调
                    make.centerX.equalTo(self.shapLayerView).offset(-JobsWidth(8)); // 位置微调
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(12), JobsWidth(20)));
                });
        });
    };return _imgeV;
}

-(UILabel *)refreshLabel{
    if (!_refreshLabel) {
        @jobs_weakify(self)
        _refreshLabel = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsWhiteColor)
                .byText(@"正在上传...".jobsTr())
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.shapLayerView.mas_right).offset(JobsWidth(12));
                    make.centerY.equalTo(self);
                });
        });
    };return _refreshLabel;
}

-(UILabel *)subrefreshLabel{
    if (!_subrefreshLabel) {
        @jobs_weakify(self)
        _subrefreshLabel = jobsMakeLabel(^(__kindof UILabel *_Nullable label) {
            @jobs_strongify(self)
            label
                .byTextCor(JobsWhiteColor)
                .byTextAlignment(NSTextAlignmentRight)
                .byFont(UIFontWeightBoldSize(JobsWidth(12)))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.right.equalTo(self).offset(-JobsWidth(8));
                    make.bottom.equalTo(self).offset(-JobsWidth(8));
                });
        });
    };return _subrefreshLabel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsUploadingProgressView
-(JobsRetJobsUploadingProgressViewByCAKeyframeAnimationBlock _Nonnull)byAnim{
    @jobs_weakify(self)
    return ^__kindof JobsUploadingProgressView * _Nullable(CAKeyframeAnimation * _Nullable data){
        @jobs_strongify(self)
        [self setAnim:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsUploadingProgressView
@end
