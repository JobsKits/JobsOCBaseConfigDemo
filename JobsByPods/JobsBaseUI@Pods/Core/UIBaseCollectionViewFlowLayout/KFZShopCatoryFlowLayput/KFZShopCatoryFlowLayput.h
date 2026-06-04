//
//  KFZShopCatoryFlowLayput.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_KFZSHOPCATORYFLOWLAYPUT_B4DA4E74B6
#define JOBS_HEADER_GUARD_KFZSHOPCATORYFLOWLAYPUT_B4DA4E74B6

#import <UIKit/UIKit.h>

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
/// 给UICollectionView的每个section加背景
@interface KFZShopCatoryFlowLayput : UICollectionViewFlowLayout

Prop_strong()NSMutableArray <NSNumber *>*affectedSectionsMutArr;//受影响的section组
Prop_assign()CGFloat offsetX;
Prop_assign()CGFloat offsetY;
Prop_assign()CGFloat offsetWidth;
Prop_assign()CGFloat offsetHeight;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_KFZSHOPCATORYFLOWLAYPUT_B4DA4E74B6 */
