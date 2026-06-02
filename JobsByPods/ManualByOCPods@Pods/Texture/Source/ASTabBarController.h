//
//  ASTabBarController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#import <AsyncDisplayKit/ASVisibilityProtocols.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * ASTabBarController
 *
 * @discussion ASTabBarController is a drop in replacement for UITabBarController
 * which implements the memory efficiency improving @c ASManagesChildVisibilityDepth protocol.
 *
 * @see ASManagesChildVisibilityDepth
 */
@interface ASTabBarController : UITabBarController <ASManagesChildVisibilityDepth>

@end

NS_ASSUME_NONNULL_END
