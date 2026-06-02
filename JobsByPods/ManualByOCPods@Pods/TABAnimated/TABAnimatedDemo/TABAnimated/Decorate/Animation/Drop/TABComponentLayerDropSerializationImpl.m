//
//  TABComponentLayerDropSerializationImpl.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABComponentLayerDropSerializationImpl.h"
#import <TABAnimated/TABComponentLayer.h>
#import "TABComponentLayer+TABDropAnimation.h"
#import <TABAnimated/TABComponentLayerSerializationInterface.h>

@implementation TABComponentLayerDropSerializationImpl

- (void)propertyBindWithNewLayer:(TABComponentLayer *)newLayer oldLayer:(TABComponentLayer *)oldLayer {
    newLayer.dropAnimationIndex = oldLayer.dropAnimationIndex;
    newLayer.dropAnimationStayTime = oldLayer.dropAnimationStayTime;
    newLayer.dropAnimationFromIndex = oldLayer.dropAnimationFromIndex;
    newLayer.removeOnDropAnimation = oldLayer.removeOnDropAnimation;
}

- (void)tab_encodeWithCoder:(NSCoder *)aCoder layer:(TABComponentLayer *)layer {
    [aCoder encodeInteger:layer.dropAnimationFromIndex forKey:@"dropAnimationFromIndex"];
    [aCoder encodeInteger:layer.dropAnimationIndex forKey:@"dropAnimationIndex"];
    [aCoder encodeFloat:layer.dropAnimationStayTime forKey:@"dropAnimationStayTime"];
    [aCoder encodeBool:layer.removeOnDropAnimation forKey:@"removeOnDropAnimation"];
}

- (id)tab_initWithCoder:(NSCoder *)aDecoder layer:(TABComponentLayer *)layer {
    layer.dropAnimationFromIndex = [aDecoder decodeIntForKey:@"dropAnimationFromIndex"];
    layer.dropAnimationIndex = [aDecoder decodeIntForKey:@"dropAnimationIndex"];
    layer.dropAnimationStayTime = [aDecoder decodeFloatForKey:@"dropAnimationStayTime"];
    layer.removeOnDropAnimation = [aDecoder decodeBoolForKey:@"removeOnDropAnimation"];
    return layer;
}

@end
