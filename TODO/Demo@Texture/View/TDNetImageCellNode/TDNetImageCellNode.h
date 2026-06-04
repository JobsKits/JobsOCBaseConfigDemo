//
//  TDNetImageCellNode.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

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
/// Network Image Cell (ASNetworkImageNode) + Round
@interface TDNetImageCellNode : ASCellNode

Prop_strong() ASNetworkImageNode *netImage;
Prop_strong() ASTextNode *title;

-(instancetype)initWithURL:(NSURL *)url text:(NSString *)text ;

@end

NS_ASSUME_NONNULL_END
