//
//  DetailCellNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASCellNode.h>

@class ASNetworkImageNode;

@interface DetailCellNode : ASCellNode
@property (nonatomic, assign) NSInteger row;
@property (nonatomic, copy) NSString *imageCategory;
@property (nonatomic, strong) ASNetworkImageNode *imageNode;
@end
