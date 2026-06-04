//
//  TDVideoCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// Video Cell (ASVideoNode)
@interface TDVideoCellNode : ASCellNode

Prop_strong() ASVideoNode *video;
Prop_strong() ASTextNode  *title;

-(instancetype)initWithURL:(NSURL *)url title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
