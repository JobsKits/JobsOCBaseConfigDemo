//
//  UIControl+XY.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIControl+XY.h"

@implementation UIControl (XY)
JobsKey(_uxy_acceptEventInterval)
@dynamic uxy_acceptEventInterval;
/// 时间间隔
- (NSTimeInterval)uxy_acceptEventInterval{
    return [Jobs_getAssociatedObject(_uxy_acceptEventInterval) doubleValue];
}

- (void)setUxy_acceptEventInterval:(NSTimeInterval)uxy_acceptEventInterval{
    Jobs_setAssociatedRETAIN_NONATOMIC(_uxy_acceptEventInterval, @(uxy_acceptEventInterval))
}

@end
