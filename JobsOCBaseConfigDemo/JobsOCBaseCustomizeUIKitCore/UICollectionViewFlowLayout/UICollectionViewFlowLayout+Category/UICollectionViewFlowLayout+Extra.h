//
//  UICollectionViewFlowLayout+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_EXTRA_F7593A00B5
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWFLOWLAYOUT_EXTRA_F7593A00B5

#import <UIKit/UIKit.h>

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
