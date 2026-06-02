//
//  HorizontalScrollCellNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

/**
 * This ASCellNode contains an ASCollectionNode.  It intelligently interacts with a containing ASCollectionView or ASTableView,
 * to preload and clean up contents as the user scrolls around both vertically and horizontally — in a way that minimizes memory usage.
 */
@interface HorizontalScrollCellNode : ASCellNode <ASCollectionDelegate, ASCollectionDataSource>

- (instancetype)initWithElementSize:(CGSize)size;

@end
