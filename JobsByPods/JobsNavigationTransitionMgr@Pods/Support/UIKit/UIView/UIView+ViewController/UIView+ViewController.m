//
//  UIView+ViewController.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)
-(JobsRetVCByVoidBlock _Nonnull)currentController{
    @jobs_weakify(self)
    return ^UIViewController *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        UIResponder *next = self.nextResponder;
        do {
            if ([next isKindOfClass:UIViewController.class]) {
                return (UIViewController *)next;
            }
            next = next.nextResponder;
        } while (next);return nil;
    };
}

@end
