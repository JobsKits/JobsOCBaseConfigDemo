//
//  ASDisplayNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#ifndef JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1
#define JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1

#import "JobsDefines.h"
#import "JobsBlock.h"

#if __has_include(<AsyncDisplayKit/AsyncDisplayKit.h>)
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#else
#import "AsyncDisplayKit.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface ASDisplayNode (DSL)

-(JobsRetDisplayNodeByFrameBlock _Nonnull)byFrame;
-(JobsRetDisplayNodeByCGSizeBlock _Nonnull)byPreferredSize;
-(JobsRetDisplayNodeByColorBlock _Nonnull)byBgColor;
-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byHidden;
-(JobsRetDisplayNodeByIntegerBlock _Nonnull)byContentMode;
-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byClipsToBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1 */
