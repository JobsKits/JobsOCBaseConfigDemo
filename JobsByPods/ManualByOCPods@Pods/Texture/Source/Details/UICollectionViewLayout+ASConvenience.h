//
//  UICollectionViewLayout+ASConvenience.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UICollectionViewLayout.h>

@protocol ASCollectionViewLayoutInspecting;

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewLayout (ASLayoutInspectorProviding)

/**
 * You can override this method on your @c UICollectionViewLayout subclass to
 * return a layout inspector tailored to your layout.
 *
 * It's fine to return @c self. You must not return @c nil.
 */
- (id<ASCollectionViewLayoutInspecting>)asdk_layoutInspector;

@end

NS_ASSUME_NONNULL_END
