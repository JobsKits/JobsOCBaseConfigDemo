//
//  TABComponentLayerSerializationInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABComponentLayerSerializationInterface_h
#define TABComponentLayerSerializationInterface_h

@class NSCoder, TABComponentLayer;

@protocol TABComponentLayerSerializationInterface <NSObject>

- (void)propertyBindWithNewLayer:(TABComponentLayer *)newLayer oldLayer:(TABComponentLayer *)oldLayer;

- (void)tab_encodeWithCoder:(NSCoder *)aCoder layer:(TABComponentLayer *)layer;
- (id)tab_initWithCoder:(NSCoder *)aDecoder layer:(TABComponentLayer *)layer;

@end

#endif /* TABComponentLayerSerializationInterface_h */
