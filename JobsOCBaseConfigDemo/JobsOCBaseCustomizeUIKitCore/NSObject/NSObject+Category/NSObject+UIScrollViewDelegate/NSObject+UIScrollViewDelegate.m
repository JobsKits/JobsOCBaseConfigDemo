//
//  NSObject+UIScrollViewDelegate.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/22.
//

#import "NSObject+UIScrollViewDelegate.h"

@implementation NSObject (UIScrollViewDelegate)
/// 滚动视图移动时回调
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsScrollViewDidScroll)))(self, @selector(jobsScrollViewDidScroll));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidScroll{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        scrollView.scrolldirectionWhenScrollViewDidScroll();
    };
}
/// 滚动视图结束拖动时回调
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                 willDecelerate:(BOOL)decelerate{
    JobsLog(@"视图结束拖动");
}
/// 滚动视图即将开始拖动时回调
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsScrollViewWillBeginDragging)))(self, @selector(jobsScrollViewWillBeginDragging));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewWillBeginDragging{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"滚动视图即将开始拖动");
    };
}
/// 滚动视图结束拖动时回调
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset{
    JobsLog(@"滚动视图结束拖动");
}
/// 视图即将减速时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsScrollViewWillBeginDecelerating)))(self, @selector(jobsScrollViewWillBeginDecelerating));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewWillBeginDecelerating{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"视图即将减速");
    };
}
/// 视图已经结束减速时回调
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    jobsByScrollViewBlock action = ((jobsByScrollViewBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobsScrollViewDidEndDecelerating)))(self, @selector(jobsScrollViewDidEndDecelerating));
    if (action) action(scrollView);
}

-(jobsByScrollViewBlock _Nonnull)jobsScrollViewDidEndDecelerating{
    @jobs_weakify(self)
    return ^(UIScrollView * scrollView){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"视图已经结束减速");
    };
}

@end
