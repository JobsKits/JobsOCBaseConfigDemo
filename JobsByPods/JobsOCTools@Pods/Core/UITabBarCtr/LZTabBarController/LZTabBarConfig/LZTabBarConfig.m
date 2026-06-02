//
//  LZTabBarConfig.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LZTabBarConfig.h"

@implementation LZTabBarConfig

- (instancetype)init {
    if (self = [super init]) {
        _isNavigation = YES;
        _normalColor = JobsGrayColor;
        _selectedColor = JobsRedColor;
    }return self;
}

@end
