//
//  HAHandleDemoView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "HAHandleDemoView.h"

static const NSTimeInterval duration = 1.f;
static const NSTimeInterval enlangerDuration = 0.05f;
static const NSTimeInterval shrinkDuration = 0.1f;

@interface HAHandleDemoView ()

Prop_strong()UIButton *handleDemoBtn;
Prop_strong()UIView *bgView;
Prop_strong()NSTimer *enlangerTimer;
Prop_strong()NSTimer *shrinkTimer;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN HAHandleDemoView
@interface HAHandleDemoView (JobsPropertyDSLSetterAutogen_f058a4f485)
-(void)setEnlangerTimer:(NSTimer * _Nullable)data;
-(void)setShrinkTimer:(NSTimer * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END HAHandleDemoView

@implementation HAHandleDemoView{
    CGFloat currentScale;
    CGFloat currentMaxSide;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake((CGRectGetWidth(frame) - CGRectGetHeight(frame)) * 0.5,
                                    0,
                                    CGRectGetHeight(frame),
                                    CGRectGetHeight(frame)))
                .byBgColor(JobsTertiarySystemBackgroundColor)
                .byCornerRadius(CGRectGetHeight(frame) / 2)
                .byHidden(YES)
                .addOn(self);
        });
    };return self;
}
// 点击放大
- (jobsByVoidBlock _Nonnull)handleBtnTouchDownAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        currentMaxSide = self.calculateMaxSide();
        self.bgView.byHidden(NO);
        self.byEnlangerTimer([NSTimer scheduledTimerWithTimeInterval:enlangerDuration target:self selector:@selector(handleEnlargerAction) userInfo:nil repeats:YES]);
    };
}
// 点击放大
- (void)handleEnlargerAction{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HAHandleDemoView.class, @selector(jobsHandleEnlargerAction)))(self, @selector(jobsHandleEnlargerAction));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsHandleEnlargerAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        CGFloat ratio = enlangerDuration / duration;
        CGFloat bgViewRadius = self.bgView.bounds.size.height * 0.5;
        currentScale += ratio * (currentMaxSide / bgViewRadius);
        self.bgView.byTransform(CGAffineTransformMakeScale(currentScale, currentScale));
        if (currentScale >= (currentMaxSide / bgViewRadius)) {
            self.enlangerTimer.invalidate;
            if (self.delegate && [self.delegate respondsToSelector:@selector(animationCompleted)]) {
                [self.delegate animationCompleted];
            }
        }
    };
}
// 松开缩小
- (jobsByVoidBlock _Nonnull)handleBtnTouchUpOutsideAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.enlangerTimer.invalidate;
    //    self.handleDemoBtn.userInteractionEnabled = NO;
        self.byShrinkTimer([NSTimer scheduledTimerWithTimeInterval:shrinkDuration target:self selector:@selector(handleShrinkAction) userInfo:nil repeats:YES]);
    };
}
// 松开缩小
- (void)handleShrinkAction{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(HAHandleDemoView.class, @selector(jobsHandleShrinkAction)))(self, @selector(jobsHandleShrinkAction));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsHandleShrinkAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            CGFloat ratio = shrinkDuration / duration;
            CGFloat bgViewRadius = self.bgView.bounds.size.height * 0.5;
            currentScale -= ratio * (currentMaxSide / bgViewRadius);
            self.bgView.byTransform(CGAffineTransformMakeScale(currentScale, currentScale));
            if (currentScale <= 0) {
                self.shrinkTimer.invalidate;
        //        self.handleDemoBtn.userInteractionEnabled = YES;
                self.bgView.byHidden(YES);
                self.bgView.byTransform(CGAffineTransformIdentity);
                if (self.delegate && [self.delegate respondsToSelector:@selector(animationCancel)]) {
                    [self.delegate animationCancel];
                }
            }
    };
}
//取得放大到最大后的边的长度
- (JobsRetCGFloatByVoidBlock _Nonnull)calculateMaxSide{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        CGPoint bgViewCenter = self.bgView.center;
        CGPoint svCenter = self.center;
        CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        CGFloat w;
        CGFloat h;
        if (bgViewCenter.x > svCenter.x) {
            if (bgViewCenter.y < svCenter.y) {
                //第一象限
                w = bgViewCenter.x;
                h = screenHeight - bgViewCenter.y;
            }else{
                //第四象限
                w = bgViewCenter.x;
                h = bgViewCenter.y;
            }
        } else {
            if (bgViewCenter.y < svCenter.y) {
                //第二象限
                w = screenWidth - bgViewCenter.x;
                h = screenHeight - bgViewCenter.y;
            } else {
                //第三象限
                w = screenWidth - bgViewCenter.x;
                h = bgViewCenter.y;
            }
        }
        CGFloat maxSide = sqrt(w*w+h*h);
        return maxSide;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN HAHandleDemoView
-(JobsRetHAHandleDemoViewByNSTimerBlock _Nonnull)byEnlangerTimer{
    @jobs_weakify(self)
    return ^__kindof HAHandleDemoView * _Nullable(NSTimer * _Nullable data){
        @jobs_strongify(self)
        [self setEnlangerTimer:data];
        return self;
    };
}

-(JobsRetHAHandleDemoViewByNSTimerBlock _Nonnull)byShrinkTimer{
    @jobs_weakify(self)
    return ^__kindof HAHandleDemoView * _Nullable(NSTimer * _Nullable data){
        @jobs_strongify(self)
        [self setShrinkTimer:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END HAHandleDemoView
@end
