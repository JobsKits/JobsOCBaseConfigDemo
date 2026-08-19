//
//  UIView+AOP.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+AOP.h"
#import "UIView+Extra.h"

/// 文本选择器的自定义颜色，因为是内部类，所以需要用runtime来修改
@implementation UIView (AOP)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self.class,
                      @selector(setBackgroundColor:),
                      @selector(aop_setBackgroundColor:));
        MethodSwizzle(self.class,
                      @selector(willMoveToSuperview:),
                      @selector(aop_willMoveToSuperview:));
    });
}
//中间的遮罩
- (void)aop_setBackgroundColor:(UIColor *)color{
    jobsByCorBlock action = ((jobsByCorBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIView.class, @selector(jobsAop_setBackgroundColor)))(self, @selector(jobsAop_setBackgroundColor));
    if (action) action(color);
}

-(jobsByCorBlock _Nonnull)jobsAop_setBackgroundColor{
    @jobs_weakify(self)
    return ^(UIColor * color){
        @jobs_strongify(self)
        if (!self) return;
        if([NSStringFromClass(self.superview.superview.class) isEqualToString:@"UITextRangeView"]){
            [self aop_setBackgroundColor:RGBA_COLOR(194, 228, 193, 0.5)];
        }else{
            [self aop_setBackgroundColor:color];
        }
    };
}
// 两边的竖线
- (void)aop_willMoveToSuperview:(UIView *)view{
    jobsByViewBlock action = ((jobsByViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIView.class, @selector(jobsAop_willMoveToSuperview)))(self, @selector(jobsAop_willMoveToSuperview));
    if (action) action(view);
}

-(jobsByViewBlock _Nonnull)jobsAop_willMoveToSuperview{
    @jobs_weakify(self)
    return ^(UIView * view){
        @jobs_strongify(self)
        if (!self) return;
        NSString *className = NSStringFromClass(self.class);
        if([className isEqualToString:@"UISelectionGrabber"] ||
           [className isEqualToString:@"UISelectionGrabberDot"]){
            UIView *coverView = [self viewWithTag:10000];
            if(!coverView){
                coverView = UIView.initByFrame(self.bounds)
                    .byTag(10000)
                    .addOn(self);
            }
            if([className isEqualToString:@"UISelectionGrabberDot"]){
                coverView.layer
                    .byCornerRadius(self.bounds.size.width * 0.5)
                    .byMasksToBounds(YES);
            }
            coverView.byBgColor(RGB_COLOR(194, 228, 193));
        }
        [self aop_willMoveToSuperview:view];
    };
}

@end
