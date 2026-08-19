//
//  XLSphereView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "XLSphereView.h"

@interface XLSphereView(){
    NSMutableArray *tags;
    NSMutableArray *coordinate;
    XLPoint normalDirection;
    CGPoint last;
    CGFloat velocity;
    CADisplayLink *timer;
    CADisplayLink *inertia;
}

@end

@implementation XLSphereView
-(instancetype)init{
    if (self = [super init]) {
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:gesture];
    };return self;
}

#pragma mark —— initial set
-(jobsByNSArrayBlock _Nonnull)setItems{
    @jobs_weakify(self)
    return ^(NSArray * items){
        @jobs_strongify(self)
        if (!self) return;
        tags = [NSMutableArray arrayWithArray:items];
        coordinate = [NSMutableArray array];
        for (NSInteger i = 0; i < tags.count; i ++) {
            UIView *view = [tags objectAtIndex:i];
            view.byCenter(self.frame.size.width / 2., self.frame.size.height / 2.);
        }
        CGFloat p1 = M_PI * (3 - sqrt(5));
        CGFloat p2 = 2. / tags.count;
        for (NSInteger i = 0; i < tags.count; i ++) {
            CGFloat y = i * p2 - 1 + (p2 / 2);
            CGFloat r = sqrt(1 - y * y);
            CGFloat p3 = i * p1;
            CGFloat x = cos(p3) * r;
            CGFloat z = sin(p3) * r;
            XLPoint point = XLPointMake(x, y, z);
            NSValue *value = [NSValue value:&point
                               withObjCType:@encode(XLPoint)];
            [coordinate addObject:value];
            CGFloat time = (arc4random() % 10 + 10.) / 20.;
            [UIView animateWithDuration:time delay:0. options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self setTagOfPoint:point andIndex:i];
            } completion:^(BOOL finished) {
            }];
        }
        NSInteger a =  arc4random() % 10 - 5;
        NSInteger b =  arc4random() % 10 - 5;
        normalDirection = XLPointMake(a, b, 0);
        self.timerStart();
    };
}
#pragma mark —— set frame of point
- (void)updateFrameOfPoint:(NSInteger)index 
                 direction:(XLPoint)direction
                  andAngle:(CGFloat)angle{
    NSValue *value = [coordinate objectAtIndex:index];
    XLPoint point;
    [value getValue:&point];
    XLPoint rPoint = XLPointMakeRotation(point, direction, angle);
    value = [NSValue value:&rPoint withObjCType:@encode(XLPoint)];
    coordinate[index] = value;
    [self setTagOfPoint:rPoint andIndex:index];
}

- (void)setTagOfPoint:(XLPoint)point
             andIndex:(NSInteger)index{
    UIView *view = [tags objectAtIndex:index];
    view.byCenter((point.x + 1) * (self.frame.size.width / 2.), (point.y + 1) * self.frame.size.width / 2.);
    CGFloat transform = (point.z + 2) / 3;
    view.byTransform(CGAffineTransformScale(CGAffineTransformIdentity, transform, transform));
    view.layer.byZPosition(transform);
    view.byAlpha(transform);
    view.byUserInteractionEnabled(point.z >= 0);
}
#pragma mark —— autoTurnRotation
- (jobsByVoidBlock _Nonnull)timerStart{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(autoTurnRotation)];
        [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    };
}

- (jobsByVoidBlock _Nonnull)timerStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        timer.invalidate;
        timer = nil;
    };
}

- (void)autoTurnRotation{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(XLSphereView.class, @selector(jobsAutoTurnRotation)))(self, @selector(jobsAutoTurnRotation));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsAutoTurnRotation{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (NSInteger i = 0; i < tags.count; i ++) {
            [self updateFrameOfPoint:i direction:normalDirection andAngle:0.002];
        }
    };
}
#pragma mark —— inertia
- (jobsByVoidBlock _Nonnull)inertiaStart{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.timerStop();
        inertia = [CADisplayLink displayLinkWithTarget:self selector:@selector(inertiaStep)];
        [inertia addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    };
}

- (jobsByVoidBlock _Nonnull)inertiaStop{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        inertia.invalidate;
        inertia = nil;
        self.timerStart();
    };
}

- (void)inertiaStep{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(XLSphereView.class, @selector(jobsInertiaStep)))(self, @selector(jobsInertiaStep));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsInertiaStep{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (velocity <= 0) {
            self.inertiaStop();
        }else {
            velocity -= 70.;
            CGFloat angle = velocity / self.frame.size.width * 2. * inertia.duration;
            for (NSInteger i = 0; i < tags.count; i ++) {
                [self updateFrameOfPoint:i direction:normalDirection andAngle:angle];
            }
        }
    };
}
#pragma mark —— gesture selector
- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture{
    jobsByPanGestureRecognizerBlock action = ((jobsByPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(XLSphereView.class, @selector(jobsHandlePanGesture)))(self, @selector(jobsHandlePanGesture));
    if (action) action(gesture);
}

-(jobsByPanGestureRecognizerBlock _Nonnull)jobsHandlePanGesture{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer * gesture){
        @jobs_strongify(self)
        if (!self) return;
        if (gesture.state == UIGestureRecognizerStateBegan) {
            last = [gesture locationInView:self];
            self.timerStop();
            self.inertiaStop();
        }else if (gesture.state == UIGestureRecognizerStateChanged) {
            CGPoint current = [gesture locationInView:self];
            XLPoint direction = XLPointMake(last.y - current.y, current.x - last.x, 0);
            CGFloat distance = sqrt(direction.x * direction.x + direction.y * direction.y);
            CGFloat angle = distance / (self.frame.size.width / 2.);
            for (NSInteger i = 0; i < tags.count; i ++) {
                [self updateFrameOfPoint:i direction:direction andAngle:angle];
            }
            normalDirection = direction;
            last = current;
        }else if (gesture.state == UIGestureRecognizerStateEnded) {
            CGPoint velocityP = [gesture velocityInView:self];
            velocity = sqrt(velocityP.x * velocityP.x + velocityP.y * velocityP.y);
            self.inertiaStart();
        }
    };
}

@end
