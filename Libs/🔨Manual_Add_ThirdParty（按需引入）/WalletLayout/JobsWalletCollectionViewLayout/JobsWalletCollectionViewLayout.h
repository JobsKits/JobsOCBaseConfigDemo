//
//  JobsWalletCollectionViewLayout.h
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCollectionViewLayout_h
#define JobsWalletCollectionViewLayout_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, JobsWalletCardExpandStyle) {
    JobsWalletCardExpandStyleOnlySelected = 0,
    JobsWalletCardExpandStyleKeepOpened = 1
};

@interface JobsWalletCollectionViewLayout : UICollectionViewLayout

Prop_assign()CGFloat padding;
Prop_assign()CGFloat itemHeight;
Prop_assign()CGFloat overlapRatio;
Prop_assign()CGFloat expandedItemSpacing;
Prop_assign()CGFloat contentBottomSpacing;
Prop_assign()NSTimeInterval animationDuration;
Prop_assign()JobsWalletCardExpandStyle expandStyle;

-(void)toggleIndexPath:(NSIndexPath *)indexPath;
-(void)expandAllIndexPaths;
-(void)resetExpandedIndexPaths;
-(void)resetExpandedIndexPathsAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCollectionViewLayout_h */
