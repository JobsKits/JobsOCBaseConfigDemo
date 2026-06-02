//
//  ASListTestSupplementarySource.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASListTestSupplementarySource.h"
#import "ASListTestSupplementaryNode.h"

@implementation ASListTestSupplementarySource

- (__kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index
{
  return [ASIGListSupplementaryViewSourceMethods viewForSupplementaryElementOfKind:elementKind atIndex:index sectionController:self.sectionController];
}

- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index
{
  return [ASIGListSupplementaryViewSourceMethods sizeForSupplementaryViewOfKind:elementKind atIndex:index];
}

- (ASCellNodeBlock)nodeBlockForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index
{
  return ^{
    ASListTestSupplementaryNode *node = [[ASListTestSupplementaryNode alloc] init];
    node.style.preferredSize = CGSizeMake(100, 10);
    return node;
  };
}

@end
