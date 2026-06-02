//
//  TABBaseComponent+TABClassicAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABBaseComponent+TABClassicAnimation.h"
#import "TABComponentLayer+TABClassicAnimation.h"

@implementation TABBaseComponent (TABClassicAnimation)

#pragma mark - toLongAnimation

- (TABBaseComponentVoidBlock)toLongAnimation {
    return ^TABBaseComponent *(void) {
        [self result_toLongAnimation];
        return self;
    };
}

- (void)preview_toLongAnimation {
    [self result_toLongAnimation];
}

- (void)result_toLongAnimation {
    self.layer.baseAnimationType = TABComponentLayerBaseAnimationToLong;
}

#pragma mark - toShortAnimation

- (TABBaseComponentVoidBlock)toShortAnimation {
    return ^TABBaseComponent *(void) {
        [self result_toShortAnimation];
        return self;
    };
}

- (void)preview_toShortAnimation {
    [self result_toShortAnimation];
}

- (void)result_toShortAnimation {
    self.layer.baseAnimationType = TABComponentLayerBaseAnimationToShort;
}

@end
