//
//  LayoutExampleNodes.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface LayoutExampleNode : ASDisplayNode
+ (NSString *)title;
+ (NSString *)descriptionTitle;
@end

@interface HeaderWithRightAndLeftItems : LayoutExampleNode
@end

@interface PhotoWithInsetTextOverlay : LayoutExampleNode
@end

@interface PhotoWithOutsetIconOverlay : LayoutExampleNode
@end

@interface FlexibleSeparatorSurroundingContent : LayoutExampleNode
@end

@interface CornerLayoutExample : PhotoWithOutsetIconOverlay
@end

@interface UserProfileSample : LayoutExampleNode
@end
