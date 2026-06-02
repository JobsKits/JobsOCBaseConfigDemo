//
//  ASListTestSection.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASListTestSection : IGListSectionController <ASSectionController>

@property (nonatomic) NSInteger itemCount;

@property (nonatomic) NSInteger selectedItemIndex;

@end
