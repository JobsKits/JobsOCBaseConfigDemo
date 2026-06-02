//
//  UIColor+Extra.m
//  JobsAppTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)
/// iOS 父视图透明度影响到子视图
/// https://blog.csdn.net/ios_xumin/article/details/114263960
-(JobsRetCorByCGFloatBlock _Nonnull)colorWithAlphaComponentBy{
    @jobs_weakify(self)
    return ^(CGFloat alpha) {
        @jobs_strongify(self)
        return [self colorWithAlphaComponent:alpha];
    };
}

@end
