//
//  TABClassicAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABClassicAnimation.h"

@implementation TABClassicAnimation

- (instancetype)init {
    if (self = [super init]) {
        _duration = 0.7;
        _longToValue = 1.9;
        _shortToValue = 0.6;
    }
    return self;
}

@end
