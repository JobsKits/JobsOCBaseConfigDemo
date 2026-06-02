//
//  HQCollectionViewFlowLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B
#define JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B

#import <UIKit/UIKit.h>

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
/// UICollectionView 实现类似于UITableView的悬停效果
@interface HQCollectionViewFlowLayout : UICollectionViewFlowLayout

Prop_assign()CGFloat naviHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_HQCOLLECTIONVIEWFLOWLAYOUT_4F2CA45D6B */
