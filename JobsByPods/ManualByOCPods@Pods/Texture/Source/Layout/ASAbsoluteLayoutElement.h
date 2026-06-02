//
//  ASAbsoluteLayoutElement.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASBaseDefines.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Layout options that can be defined for an ASLayoutElement being added to a ASAbsoluteLayoutSpec.
 */
@protocol ASAbsoluteLayoutElement

/**
 * @abstract The position of this object within its parent spec.
 */
@property (nonatomic) CGPoint layoutPosition;

@end

NS_ASSUME_NONNULL_END
