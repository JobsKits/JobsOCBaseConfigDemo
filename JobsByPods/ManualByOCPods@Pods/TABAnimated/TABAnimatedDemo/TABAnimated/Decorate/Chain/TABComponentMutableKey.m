//
//  TABComponentMutableKey.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABComponentMutableKey.h"

@implementation TABComponentMutableKey

- (BOOL)isEqual:(id)object {
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[TABComponentMutableKey class]]) {
        return NO;
    }
    
    TABComponentMutableKey *newKeyObject = object;
    if (self.arrayIndex == newKeyObject.arrayIndex
        && [self.propertyName isEqualToString:newKeyObject.propertyName]) {
        return YES;
    }
    
    return NO;
}

- (NSUInteger)hash {
   return self.arrayIndex ^ [self.propertyName hash];
}

@end
