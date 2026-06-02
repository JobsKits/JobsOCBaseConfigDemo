//
//  NSArray+TABAnimated.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSArray+TABAnimated.h"

@implementation NSArray (TABAnimated)

- (NSArray *)tab_map:(id (^)(id))block {
    NSCParameterAssert(block);
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:self.count];
    for (id value in self) {
        id mapedValue = block(value);
        if (mapedValue) {
            [array addObject:mapedValue];
        } else {
            NSAssert(NO, @"");
        }
    }
    return array;
}

@end
