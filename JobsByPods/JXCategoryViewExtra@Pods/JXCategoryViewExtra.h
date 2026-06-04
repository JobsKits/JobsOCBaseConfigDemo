//
//  JXCategoryViewExtra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JXCategoryViewExtra_h
#define JXCategoryViewExtra_h

#import "JXCategoryBaseView+Extra.h"
#import "JXCategoryTitleView+Extra.h"
#import "JXCategoryImageView+Extra.h"
#import "JXCategoryNumberView+Extra.h"
#import "JXCategoryDotView+Extra.h"
#import "JXCategoryListContainerView+Extra.h"
#import "JXCategoryIndicatorView+Extra.h"
#import "JXCategoryTitleBackgroundCellModel.h"
#import "JXCategoryTitleBackgroundCell.h"
#import "JXCategoryTitleBackgroundView.h"
#import "JXCategoryTimelineCellModel.h"
#import "JXCategoryTimelineCell.h"
#import "JXCategoryTimelineView.h"

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#if __has_include(<JXPagingView/JXPagerView.h>)
#import <JXPagingView/JXPagerView.h>
#else
#import "JXPagerView.h"
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

NS_INLINE __kindof JXPagerView *_Nonnull jobsMakeCategoryPagerView(id<JXPagerViewDelegate> _Nonnull delegate){
    JXPagerView *data = [JXPagerView.alloc initWithDelegate:delegate];
    return data;
}

NS_INLINE __kindof JXCategoryTitleView *_Nonnull jobsMakeCategoryTitleView(jobsByCategoryTitleViewBlock _Nullable block){
    JXCategoryTitleView *data = JXCategoryTitleView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryImageView *_Nonnull jobsMakeCategoryImageView(jobsByCategoryImageViewBlock _Nullable block){
    JXCategoryImageView *data = JXCategoryImageView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryDotView *_Nonnull jobsMakeCategoryDotView(jobsByCategoryDotViewBlock _Nullable block){
    JXCategoryDotView *data = JXCategoryDotView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryNumberView *_Nonnull jobsMakeCategoryNumberView(jobsByCategoryNumberViewBlock _Nullable block){
    JXCategoryNumberView *data = JXCategoryNumberView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryIndicatorBackgroundView *_Nonnull jobsMakeCategoryIndicatorBackgroundView(jobsByCategoryIndicatorBackgroundViewBlock _Nullable block){
    JXCategoryIndicatorBackgroundView *data = JXCategoryIndicatorBackgroundView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryIndicatorLineView *_Nonnull jobsMakeCategoryIndicatorLineView(jobsCategoryIndicatorLineViewBlock _Nullable block){
    JXCategoryIndicatorLineView *data = JXCategoryIndicatorLineView.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE __kindof JXCategoryListContainerView *_Nonnull jobsMakeCategoryListContainerViewByScrollViewStyle(id<JXCategoryListContainerViewDelegate> _Nonnull delegate){
    JXCategoryListContainerView *data = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_ScrollView
                                                                               delegate:delegate];
    return data;
}

NS_INLINE __kindof JXCategoryListContainerView *_Nonnull jobsMakeCategoryListContainerViewByCollectionViewStyle(id<JXCategoryListContainerViewDelegate> _Nonnull delegate){
    JXCategoryListContainerView *data = [JXCategoryListContainerView.alloc initWithType:JXCategoryListContainerType_CollectionView
                                                                               delegate:delegate];
    return data;
}

#endif /* JXCategoryViewExtra_h */
