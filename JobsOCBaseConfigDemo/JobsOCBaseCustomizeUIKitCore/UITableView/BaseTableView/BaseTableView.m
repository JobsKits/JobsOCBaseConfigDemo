//
//  BaseTableView.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@end

@implementation BaseTableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTableView.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}
/**
 1. 刷新完成后触发 layoutsubview
 UITableView 在 reloaddata 后, 会触发 layoutsubview , 可以继承父类的 superview 方法, 在其中处理需要在刷新完数据后做的操作, 如播放短视频.

 2. 使用layoutIfNeeded方法，强制重绘
 在 UITableView 调用 reloaddata 方法后, 强制调用其 layoutIfNeeded 方法, 接着调用刷新完后的操作.
 */
-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTableView.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
    };
}

-(void)layoutIfNeeded{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseTableView.class, @selector(jobsLayoutIfNeeded)))(self, @selector(jobsLayoutIfNeeded));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutIfNeeded];
    };
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    JobsLog(@"");
    if (self.objBlock) self.objBlock(@1);
}
/// 专治UITableView相应链断裂【核心代码】
- (UIView *)hitTest:(CGPoint)point
          withEvent:(UIEvent *)event {
    static UIEvent *e = nil;
    if (e != nil && e == event) {
        e = nil;
        return [super hitTest:point withEvent:event];
    }
    e = event;
    if (event.type == UIEventTypeTouches) {
        NSSet *touches = [event touchesForView:self];
        UITouch *touch = [touches anyObject];
        if (touch.phase == UITouchPhaseBegan) {
            JobsLog(@"Touches began");
        }else if(touch.phase == UITouchPhaseEnded){
            JobsLog(@"Touches Ended");
        }else if(touch.phase == UITouchPhaseCancelled){
            JobsLog(@"Touches Cancelled");
        }else if (touch.phase == UITouchPhaseMoved){
            JobsLog(@"Touches Moved");
        }
    };return [super hitTest:point withEvent:event];
}

@end
