//
//  LMHWaterFallLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5
#define JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5

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

@class LMHWaterFallLayout;
@protocol  LMHWaterFallLayoutDeleaget<NSObject>
@required
/// 每个item的高度
- (CGFloat)waterFallLayout:(LMHWaterFallLayout *)waterFallLayout
  heightForItemAtIndexPath:(NSUInteger)indexPath
                 itemWidth:(CGFloat)itemWidth;
@optional
/// 有多少列
- (NSUInteger)columnCountInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
/// 每列之间的间距
- (CGFloat)columnMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
/// 每行之间的间距
- (CGFloat)rowMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
/// 每个item的内边距
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;

@end

@interface LMHWaterFallLayout : UICollectionViewLayout

Prop_weak()id<LMHWaterFallLayoutDeleaget> delegate;

@end
#endif /* JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5 */
