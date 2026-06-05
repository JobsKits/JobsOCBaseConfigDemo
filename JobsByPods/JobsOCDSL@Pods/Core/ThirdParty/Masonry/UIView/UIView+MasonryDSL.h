//
//  UIView+MasonryDSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D
#define JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D

#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef __kindof UIView *_Nullable(^JobsOCDSLRetViewBySuperviewMasonryBlock)(__kindof UIView *_Nonnull superview, jobsByMASConstraintMakerBlock _Nullable block);

@interface UIView (MasonryDSL)

- (JobsOCDSLRetViewBySuperviewMasonryBlock _Nonnull)byAddTo;
- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byMakeConstraints;
- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byUpdateConstraints;
- (JobsReturnViewByMasonryConstraintsBlocks _Nonnull)byRemakeConstraints;
- (JobsRetViewByVoidBlock _Nonnull)byRemoveConstraints;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_MASONRY_DSL_4F3D9F6D5D */
