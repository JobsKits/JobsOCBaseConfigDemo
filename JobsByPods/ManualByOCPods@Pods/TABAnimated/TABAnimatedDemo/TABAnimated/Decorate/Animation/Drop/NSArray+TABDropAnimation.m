//
//  NSArray+TABDropAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+TABDropAnimation.h"
#import <TABAnimated/TABBaseComponent.h>
#import "TABComponentLayer+TABDropAnimation.h"
#import "TABBaseComponent+TABDropAnimation.h"

@implementation NSArray (TABDropAnimation)

#pragma mark - Drop Animation

- (TABAnimatedArrayIntBlock)dropIndex {
    return ^NSArray <TABBaseComponent *> *(NSInteger value) {
        for (TABBaseComponent *component in self) {
            component.dropIndex(value);
        }
        return self;
    };
}

- (TABAnimatedArrayIntBlock)dropFromIndex {
    return ^NSArray <TABBaseComponent *> *(NSInteger value) {
        for (TABBaseComponent *component in self) {
            component.dropFromIndex(value);
        }
        return self;
    };
}

- (TABAnimatedArrayFloatBlock)dropStayTime {
    return ^NSArray <TABBaseComponent *> *(CGFloat offset) {
        for (TABBaseComponent *component in self) {
            component.dropStayTime(offset);
        }
        return self;
    };
}

- (TABAnimatedArrayBlock)removeOnDrop {
    return ^NSArray <TABBaseComponent *> *(void) {
        for (TABBaseComponent *component in self) {
            component.withoutAnimation();
        }
        return self;
    };
}

@end
