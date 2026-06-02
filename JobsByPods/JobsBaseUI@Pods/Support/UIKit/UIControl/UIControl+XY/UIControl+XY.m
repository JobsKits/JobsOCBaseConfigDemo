//
//  UIControl+XY.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIControl+XY.h"

@implementation UIControl (XY)
/// 时间间隔
- (NSTimeInterval)uxy_acceptEventInterval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval{
    objc_setAssociatedObject(self,
                             _cmd,
                             @(uxy_acceptEventInterval),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
