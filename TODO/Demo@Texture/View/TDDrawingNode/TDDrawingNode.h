//
//  TDDrawingNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

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

NS_ASSUME_NONNULL_BEGIN

@interface TDDrawingNode : ASDisplayNode

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof TDDrawingNode * _Nonnull
jobsMakeDrawingNode(jobsByDrawingNodeBlock _Nullable block) {
    TDDrawingNode *node = TDDrawingNode.alloc.init;
    if (block) block(node);
    return node;
}
