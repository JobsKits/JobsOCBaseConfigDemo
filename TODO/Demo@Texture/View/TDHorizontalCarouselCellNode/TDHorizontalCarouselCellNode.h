//
//  TDHorizontalCarouselCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TDHorizontalItemNode.h"

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface TDHorizontalCarouselCellNode : ASCellNode <ASCollectionDataSource, ASCollectionDelegate>

Prop_strong()ASCollectionNode *collection;
Prop_strong()NSArray<NSNumber *> *items;

-(instancetype)initWithCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
