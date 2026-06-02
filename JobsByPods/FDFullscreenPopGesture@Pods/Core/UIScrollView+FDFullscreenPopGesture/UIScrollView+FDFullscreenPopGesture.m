//
//  UIScrollView+FDFullscreenPopGesture.m
//  FDFullscreenPopGesture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIScrollView+FDFullscreenPopGesture.h"

@implementation UIScrollView (FDFullscreenPopGesture)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }return NO;
}

@end
