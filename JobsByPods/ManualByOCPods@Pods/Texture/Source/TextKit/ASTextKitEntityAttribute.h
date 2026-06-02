//
//  ASTextKitEntityAttribute.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#import <AsyncDisplayKit/ASAvailability.h>

#if AS_ENABLE_TEXTNODE

#import <AsyncDisplayKit/ASBaseDefines.h>

/**
 The object that should be embedded with ASTextKitEntityAttributeName.  Please note that the entity you provide MUST
 implement a proper hash and isEqual function or your application performance will grind to a halt due to
 NSMutableAttributedString's usage of a global hash table of all attributes.  This means the entity should NOT be a
 Foundation Collection (NSArray, NSDictionary, NSSet, etc.) since their hash function is a simple count of the values
 in the collection, which causes pathological performance problems deep inside NSAttributedString's implementation.

 rdar://19352367
 */
AS_SUBCLASSING_RESTRICTED
@interface ASTextKitEntityAttribute : NSObject

@property (nonatomic, readonly) id<NSObject> entity;

- (instancetype)initWithEntity:(id<NSObject>)entity;

@end

#endif
