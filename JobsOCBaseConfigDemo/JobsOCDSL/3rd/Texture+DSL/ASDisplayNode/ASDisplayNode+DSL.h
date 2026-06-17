//
//  ASDisplayNode+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月5日，星期五.
//

#ifndef JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1
#define JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1

#import <AsyncDisplayKit/AsyncDisplayKit.h>

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

@interface ASDisplayNode (DSL)

-(JobsRetDisplayNodeByFrameBlock _Nonnull)byFrame;
-(JobsRetDisplayNodeByColorBlock _Nonnull)byBgColor;
-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byHidden;
-(JobsRetDisplayNodeByIntegerBlock _Nonnull)byContentMode;
-(JobsRetDisplayNodeByCGFloatBlock _Nonnull)byCornerRadius;
-(JobsRetDisplayNodeByBOOLBlock _Nonnull)byClipsToBounds;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_ASDISPLAYNODE_DSL_7F3CF6E1C1 */
