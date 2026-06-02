//
//  TDButtonCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "ASButtonNode+DSL.h"

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

#if __has_include(<JobsByOCPods/UIKits.h>)
#import <JobsByOCPods/UIKits.h>
#else
#import "UIKits.h"
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
/// Button Cell (ASButtonNode)
@interface TDButtonCellNode : ASCellNode

Prop_strong()ASButtonNode *button;
Prop_strong()ASTextNode *descNode;

@end

NS_ASSUME_NONNULL_END
