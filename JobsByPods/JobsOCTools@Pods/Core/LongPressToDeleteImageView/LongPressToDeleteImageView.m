//
//  LongPressToDeleteImageView.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LongPressToDeleteImageView.h"

#define angelToRandian(x) ((x)/180.0 * M_PI)

@implementation LongPressToDeleteImageView
- (instancetype)init{
    if (self = [super init]) {
        self.byUserInteractionEnabled(YES);
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                               action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];
    };return self;
}

-(void)longPress:(UILongPressGestureRecognizer*)longPress{
    jobsByLongPressGestureRecognizerBlock action = ((jobsByLongPressGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LongPressToDeleteImageView.class, @selector(jobsLongPress)))(self, @selector(jobsLongPress));
    if (action) action(longPress);
}

-(jobsByLongPressGestureRecognizerBlock _Nonnull)jobsLongPress{
    @jobs_weakify(self)
    return ^(UILongPressGestureRecognizer* longPress){
        @jobs_strongify(self)
        if (!self) return;
        if (longPress.state == UIGestureRecognizerStateBegan) {
            CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
            anim.byKeyPath(@"transform.rotation");
            anim.values = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
                data
                    .add(@(angelToRandian(-7)))
                    .add(@(angelToRandian(7)))
                    .add(@(angelToRandian(-7)));
            });
            anim.byRepeatCount(MAXFLOAT);
            anim.byDuration(0.2);
            [self.layer addAnimation:anim forKey:nil];
            self.byHidden(NO);
        }
    };
}
//// 恢复抖动
//view.layer.speed = 1.0;
//// 停止抖动
//view.layer.speed = 0.0; 

//- (IBAction)delete:(id)sender {
//    [self.imageView removeFromSuperview];
//    [self.btn removeFromSuperview];
//}

@end
