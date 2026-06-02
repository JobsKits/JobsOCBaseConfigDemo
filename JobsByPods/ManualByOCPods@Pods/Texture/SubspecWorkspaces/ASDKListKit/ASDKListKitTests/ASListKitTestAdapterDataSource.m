//
//  ASListKitTestAdapterDataSource.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ASListKitTestAdapterDataSource.h"
#import "ASListTestSection.h"

@implementation ASListKitTestAdapterDataSource

- (NSArray *)objectsForListAdapter:(IGListAdapter *)listAdapter
{
  return self.objects;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
  ASListTestSection *section = [[ASListTestSection alloc] init];
  return section;
}

- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter
{
  return nil;
}

@end
