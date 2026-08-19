//
//  JobsViewNavigator.m
//  JobsViewNavigator
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsViewNavigator.h"

#import "UIView+Extra.h"
#import "NSMutableArray+Extra.h"

@interface JobsViewNavigator ()

Prop_strong()NSMutableArray<__kindof UIView *> *viewStack;

@end

@implementation JobsViewNavigator
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    };return self;
}

-(JobsRetViewNavigatorByViewAndAnimatedBlock _Nonnull)pushView{
    @jobs_weakify(self)
    return ^JobsViewNavigator *_Nonnull(UIView __kindof * _Nullable nextView,BOOL animated) {
        @jobs_strongify(self)
        if (!nextView) return self;
        UIView *currentTopView = self.viewStack.lastObject;
        self.viewStack.add(nextView);
        self.addSubview(nextView);
        CGRect offScreenRight = CGRectOffset(self.bounds,
                                             self.bounds.size.width, 0);
        nextView.byFrame(offScreenRight);
        jobsByVoidBlock transitionBlock = ^{
            @jobs_strongify(self)
            nextView.byFrame(self.bounds);
            currentTopView.frame = CGRectOffset(self.bounds,
                                                -self.bounds.size.width, 0);
        };
        if (animated) {
            [UIView animateWithDuration:0.3
                             animations:transitionBlock
                             completion:nil];
        } else {
            if(transitionBlock) transitionBlock();
        };return self;
    };
}

-(JobsRetViewNavigatorByBOOLBlock _Nonnull)popViewAnimated{
    @jobs_weakify(self)
    return ^JobsViewNavigator *_Nonnull(BOOL animated) {
        @jobs_strongify(self)
        if (self.viewStack.count == 0) return self; // Prevent popping when there's no view
        UIView *topView = self.viewStack.lastObject;
        [self.viewStack removeLastObject];
        UIView *previousView = self.viewStack.lastObject;
        jobsByVoidBlock transitionBlock = ^{
            @jobs_strongify(self)
            topView.byFrame(CGRectOffset(self.bounds, self.bounds.size.width, 0));
            previousView.byFrame(self.bounds);
        };
        jobsByBOOLBlock completionBlock = ^(BOOL finished) {
            @jobs_strongify(self)
            [topView removeFromSuperview];
            if (self.viewStack.count == 0) {
                // 移除MyViewNavigator自身
                [self removeFromSuperview];
            }
        };
        if (animated) {
            [UIView animateWithDuration:0.3
                             animations:transitionBlock
                             completion:completionBlock];
        } else {
            if(transitionBlock) transitionBlock();
            if(completionBlock) completionBlock(YES);
        };return self;
    };
}

-(JobsRetViewNavigatorByBOOLBlock _Nonnull)popToRootViewAnimated{
    @jobs_weakify(self)
    return ^JobsViewNavigator *_Nonnull(BOOL animated) {
        @jobs_strongify(self)
        if (self.viewStack.count <= 1) return self; // 根视图或无视图堆栈
        while (self.viewStack.count > 1) {
            UIView *topView = self.viewStack.lastObject;
            [self.viewStack removeLastObject];
            [topView removeFromSuperview];
        }
        UIView *rootView = self.viewStack.firstObject;
        jobsByVoidBlock transitionBlock = ^{
            @jobs_strongify(self)
            rootView.byFrame(self.bounds);
        };
        if (animated) {
            [UIView animateWithDuration:0.3
                             animations:transitionBlock
                             completion:nil];
        } else if (transitionBlock) transitionBlock();
        return self;
    };
}
#pragma mark —— lazyLoad
-(NSMutableArray<__kindof UIView *> *)viewStack{
    if(!_viewStack){
        _viewStack = NSMutableArray.array;
    };return _viewStack;
}

@end
