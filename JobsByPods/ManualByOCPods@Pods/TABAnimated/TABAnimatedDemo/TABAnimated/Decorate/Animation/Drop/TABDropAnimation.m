//
//  TABDropAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABDropAnimation.h"
#import <TABAnimated/TABAnimatedConfig.h>

@implementation TABDropAnimation

- (instancetype)init {
    if (self = [super init]) {
        _dropAnimationDeepColor = tab_kColor(0xE1E1E1);
        _dropAnimationDeepColorInDarkMode = tab_kColor(0x323232);
        _dropAnimationDuration = 0.4;
    }
    return self;
}

@end
