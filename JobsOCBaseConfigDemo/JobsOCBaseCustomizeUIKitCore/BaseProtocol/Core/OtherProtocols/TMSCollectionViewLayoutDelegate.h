//
//  TMSCollectionViewLayoutDelegate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUTDELEGATE_ADC0397EA9
#define JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUTDELEGATE_ADC0397EA9

#import <UIKit/UIKit.h>
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TMSCollectionViewLayoutDelegate <NSObject>
@required
/** section header */
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableHeaderViewHeightForIndexPath:(NSIndexPath *)indexPath;
/** section footer */
-(CGFloat)collectionView:(UICollectionView *)collectionView
resuableFooterViewHeightForIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TMSCOLLECTIONVIEWLAYOUTDELEGATE_ADC0397EA9 */
