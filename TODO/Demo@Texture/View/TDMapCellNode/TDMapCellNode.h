//
//  TDMapCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
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

#if __has_include(<MapKit/MapKit.h>)
#import <MapKit/MapKit.h>
#define HAS_MAPKIT 1
#else
#define HAS_MAPKIT 0
#endif

NS_ASSUME_NONNULL_BEGIN
///  Map Cell (ASMapNode) [Optional]
@interface TDMapCellNode : ASCellNode

Prop_strong() ASMapNode *mapNode;

@end

NS_ASSUME_NONNULL_END
