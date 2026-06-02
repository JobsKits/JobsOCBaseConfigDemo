//
//  GradientTableNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

/**
 * This ASCellNode contains an ASTableNode.  It intelligently interacts with a containing ASCollectionView,
 * to preload and clean up contents as the user scrolls around both vertically and horizontally — in a way that minimizes memory usage.
 */
@interface GradientTableNode : ASCellNode 

- (instancetype)initWithElementSize:(CGSize)size;

@property (nonatomic) NSInteger pageNumber;

@end
