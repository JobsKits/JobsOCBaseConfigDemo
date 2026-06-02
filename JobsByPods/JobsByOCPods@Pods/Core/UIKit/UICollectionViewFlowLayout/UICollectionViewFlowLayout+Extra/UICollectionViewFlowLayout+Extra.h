//
//  UICollectionViewFlowLayout+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_EXTRA_F7593A00B5
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_EXTRA_F7593A00B5

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    if (block) block(data);
    return data;
}

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeHorizontalCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    data.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (block) block(data);
    return data;
}

NS_INLINE UICollectionViewFlowLayout *_Nonnull jobsMakeVerticalCollectionViewFlowLayout(jobsByCollectionViewFlowLayoutBlock _Nonnull block){
    UICollectionViewFlowLayout *data = UICollectionViewFlowLayout.alloc.init;
    data.scrollDirection = UICollectionViewScrollDirectionVertical;
    if (block) block(data);
    return data;
}

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewFlowLayout (Extra)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_EXTRA_F7593A00B5 */
