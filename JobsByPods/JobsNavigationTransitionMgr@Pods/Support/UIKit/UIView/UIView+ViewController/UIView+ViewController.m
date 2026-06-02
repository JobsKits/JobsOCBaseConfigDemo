//
//  UIView+ViewController.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

-(UIViewController *_Nullable)currentController{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:UIViewController.class]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    } while (next);return nil;
}

@end
