//
//  ASDisplayNode+Convenience.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASDisplayNode.h>

NS_ASSUME_NONNULL_BEGIN

@class UIViewController;

@interface ASDisplayNode (Convenience)

/**
 * @abstract Returns the view controller nearest to this node in the view hierarchy.
 *
 * @warning This property may only be accessed on the main thread. This property may
 *   be @c nil until the node's view is actually hosted in the view hierarchy.
 */
@property (nonatomic, nullable, readonly) __kindof UIViewController *closestViewController NS_SWIFT_UI_ACTOR;

@end

NS_ASSUME_NONNULL_END
