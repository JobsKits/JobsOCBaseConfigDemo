//
//  HQCollectionViewFlowLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B
#define JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B

#import <UIKit/UIKit.h>

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// UICollectionView 实现类似于UITableView的悬停效果
@interface HQCollectionViewFlowLayout : UICollectionViewFlowLayout

Prop_assign()CGFloat naviHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B */
