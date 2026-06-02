//
//  ASLayoutElementStylePrivate.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <AsyncDisplayKit/ASLayoutElement.h>
#import <AsyncDisplayKit/ASObjectDescriptionHelpers.h>

@interface ASLayoutElementStyle () <ASDescriptionProvider>

/**
 * @abstract The object that acts as the delegate of the style.
 *
 * @discussion The delegate must adopt the ASLayoutElementStyleDelegate protocol. The delegate is not retained.
 */
@property (nullable, nonatomic, weak) id<ASLayoutElementStyleDelegate> delegate;

/**
 * @abstract A size constraint that should apply to this ASLayoutElement.
 */
@property (nonatomic, readonly) ASLayoutElementSize size;

@property (nonatomic, assign) ASStackLayoutAlignItems parentAlignStyle;

@end
