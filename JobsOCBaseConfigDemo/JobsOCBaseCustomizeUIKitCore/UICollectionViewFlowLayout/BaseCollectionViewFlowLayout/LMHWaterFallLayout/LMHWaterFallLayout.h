//
//  LMHWaterFallLayout.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5
#define JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

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
-(JobsRetNSUIntegerByLMHWaterFallLayoutBlock _Nonnull)jobsColumnCountInWaterFallLayout;
/// 每列之间的间距
- (CGFloat)columnMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
-(JobsRetCGFloatByLMHWaterFallLayoutBlock _Nonnull)jobsColumnMarginInWaterFallLayout;
/// 每行之间的间距
- (CGFloat)rowMarginInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
-(JobsRetCGFloatByLMHWaterFallLayoutBlock _Nonnull)jobsRowMarginInWaterFallLayout;
/// 每个item的内边距
- (UIEdgeInsets)edgeInsetdInWaterFallLayout:(LMHWaterFallLayout *)waterFallLayout;
-(JobsRetUIEdgeInsetsByLMHWaterFallLayoutBlock _Nonnull)jobsEdgeInsetdInWaterFallLayout;

@end

@interface LMHWaterFallLayout : UICollectionViewLayout

Prop_weak()id<LMHWaterFallLayoutDeleaget> delegate;

-(jobsByVoidBlock _Nonnull)jobsPrepareLayout;

-(JobsRetCGSizeByVoidBlock _Nonnull)jobsCollectionViewContentSize;

@end
#endif /* JOBS_HEADER_GUARD_LMHWATERFALLLAYOUT_BF180D4EE5 */
