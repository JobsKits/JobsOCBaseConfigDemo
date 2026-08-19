//
//  AnimationLabel.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2022/6/13.
//

#import "JobsAnimationLabel.h"

@interface JobsAnimationLabel ()

Prop_strong()CADisplayLink *playLink;
Prop_assign()NSInteger displayPerSecond;
Prop_assign()CGFloat valueStart;
Prop_assign()CGFloat valueEnd;
Prop_assign()CGFloat valueLast;
Prop_assign()CGFloat valueStep;
Prop_assign()NSTimeInterval duration;
Prop_copy()void (^complete)(UILabel *label, CGFloat value);

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAnimationLabel
@interface JobsAnimationLabel (JobsPropertyDSLSetterAutogen_23653aaf1e)
-(void)setComplete:(void (^ _Nullable)(UILabel *label, CGFloat value))data;
-(void)setDisplayPerSecond:(NSInteger)data;
-(void)setPlayLink:(CADisplayLink * _Nullable)data;
-(void)setValueEnd:(CGFloat)data;
-(void)setValueLast:(CGFloat)data;
-(void)setValueStart:(CGFloat)data;
-(void)setValueStep:(CGFloat)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAnimationLabel

@implementation JobsAnimationLabel
-(JobsRetJobsAnimationLabelByCorBlock _Nonnull)byTextCor{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel *_Nullable(UIColor *_Nullable color){
        @jobs_strongify(self)
        self.textColor = color;
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byValue{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel *_Nullable(CGFloat value){
        @jobs_strongify(self)
        self.value = value;
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byLastValue{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel *_Nullable(CGFloat lastValue){
        @jobs_strongify(self)
        self.lastValue = lastValue;
        return self;
    };
}

-(JobsRetJobsAnimationLabelByNSTimeIntervalBlock _Nonnull)byDuration{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel *_Nullable(NSTimeInterval duration){
        @jobs_strongify(self)
        [self setDuration:duration];
        return self;
    };
}

/**
 动画数字改变
 
 @param fromValue 开始数值
 @param toValue 结束数值
 @param duration 动画时间
 @param complete 完成回调
 */
- (void)animationTextStartValue:(CGFloat)fromValue
                       endValue:(CGFloat)toValue
                       duration:(CGFloat)duration
                       complete:(void (^)(UILabel *label, CGFloat value))complete{
    self.byDuration(duration);
    if (self.duration <= 0.0) {
        self.byDuration(2.0);
    }
    self.byDisplayPerSecond(30);
    self.byValueStart(fromValue);
    self.byValueEnd(toValue);
    self.byComplete([complete copy]);
    self.byValueLast(self.valueStart);
    self.byValueStep((self.valueEnd - self.valueStart) / (self.duration==0 ? 1 : (self.displayPerSecond * self.duration)));
    if (self.playLink) {
        [self.playLink invalidate];
        self.byPlayLink(nil);
    }
    self.playLink = [CADisplayLink displayLinkWithTarget:self
                                                selector:@selector(countingAction)];
    if (@available(iOS 10.0, *)) {
        self.playLink.byPreferredFramesPerSecond(self.displayPerSecond);
    } else {
        SuppressWdeprecatedDeclarationsWarning(self.playLink.frameInterval = self.displayPerSecond;);
    }
    [self.playLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSDefaultRunLoopMode];
    [self.playLink addToRunLoop:NSRunLoop.mainRunLoop forMode:UITrackingRunLoopMode];
}

- (void)countingAction {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAnimationLabel.class, @selector(jobsCountingAction)))(self, @selector(jobsCountingAction));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsCountingAction{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.valueLast += self.valueStep;
        if (self.valueStart < self.valueEnd) {
            if (self.valueLast >= self.valueEnd) {
                self.stopDisplayLink();
            }
        } else {
            if (self.valueLast <= self.valueEnd) {
                self.stopDisplayLink();
            }
        }
        @jobs_weakify(self)
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (self.complete) self.complete(self, self.valueLast);
        });
    };
}

- (jobsByVoidBlock _Nonnull)stopDisplayLink{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.playLink) {
            [self.playLink invalidate];
            self.byPlayLink(nil);
        }self.valueLast = self.valueEnd;
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAnimationLabel
-(JobsRetJobsAnimationLabelByCADisplayLinkBlock _Nonnull)byPlayLink{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(CADisplayLink * _Nullable data){
        @jobs_strongify(self)
        [self setPlayLink:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byValueEnd{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setValueEnd:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byValueLast{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setValueLast:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byValueStart{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setValueStart:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByCGFloatBlock _Nonnull)byValueStep{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setValueStep:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByNSIntegerBlock _Nonnull)byDisplayPerSecond{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(NSInteger data){
        @jobs_strongify(self)
        [self setDisplayPerSecond:data];
        return self;
    };
}

-(JobsRetJobsAnimationLabelByvoidUILabellabelCGFloatvalueBlock _Nonnull)byComplete{
    @jobs_weakify(self)
    return ^__kindof JobsAnimationLabel * _Nullable(void (^ _Nullable data)(UILabel *label, CGFloat value)){
        @jobs_strongify(self)
        [self setComplete:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAnimationLabel
@end
