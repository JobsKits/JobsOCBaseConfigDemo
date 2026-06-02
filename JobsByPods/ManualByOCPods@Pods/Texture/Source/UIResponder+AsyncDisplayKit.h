//
//  UIResponder+AsyncDisplayKit.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (AsyncDisplayKit)

/**
 * The nearest view controller above this responder, if one exists.
 *
 * This property must be accessed on the main thread.
 */
@property (nonatomic, nullable, readonly) __kindof UIViewController *asdk_associatedViewController NS_SWIFT_UI_ACTOR;

@end

NS_ASSUME_NONNULL_END
