//
//  TABComponentLayerClassicSerializationImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABComponentLayerClassicSerializationImpl.h"
#import "TABComponentLayer+TABClassicAnimation.h"
#import <TABAnimated/TABComponentLayerSerializationInterface.h>

@implementation TABComponentLayerClassicSerializationImpl

- (void)propertyBindWithNewLayer:(TABComponentLayer *)newLayer oldLayer:(TABComponentLayer *)oldLayer {
    newLayer.baseAnimationType = oldLayer.baseAnimationType;
}

- (void)tab_encodeWithCoder:(NSCoder *)aCoder layer:(TABComponentLayer *)layer {
    [aCoder encodeInteger:layer.baseAnimationType forKey:@"baseAnimationType"];
}

- (id)tab_initWithCoder:(NSCoder *)aDecoder layer:(TABComponentLayer *)layer {
    layer.baseAnimationType = [aDecoder decodeIntegerForKey:@"baseAnimationType"];
    return layer;
}

@end
