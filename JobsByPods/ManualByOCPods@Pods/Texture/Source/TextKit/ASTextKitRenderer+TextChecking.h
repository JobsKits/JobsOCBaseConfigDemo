//
//  ASTextKitRenderer+TextChecking.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASTextKitRenderer.h>

#if AS_ENABLE_TEXTNODE

/**
 Application extensions to NSTextCheckingType. We're allowed to do this (see NSTextCheckingAllCustomTypes).
 */
static uint64_t const ASTextKitTextCheckingTypeEntity =               1ULL << 33;
static uint64_t const ASTextKitTextCheckingTypeTruncation =           1ULL << 34;

@class ASTextKitEntityAttribute;

@interface ASTextKitTextCheckingResult : NSTextCheckingResult
@property (nonatomic, readonly) ASTextKitEntityAttribute *entityAttribute;
@end

@interface ASTextKitRenderer (TextChecking)

- (NSTextCheckingResult *)textCheckingResultAtPoint:(CGPoint)point;

@end

#endif
