//
//  DetailRootNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASDisplayNode.h>

@class ASCollectionNode;

@interface DetailRootNode : ASDisplayNode

@property (nonatomic, strong, readonly) ASCollectionNode *collectionNode;

- (instancetype)initWithImageCategory:(NSString *)imageCategory;

@end
