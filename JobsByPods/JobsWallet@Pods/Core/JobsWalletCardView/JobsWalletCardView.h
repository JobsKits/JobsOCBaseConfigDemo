//
//  JobsWalletCardView.h
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCardView_h
#define JobsWalletCardView_h

#import <UIKit/UIKit.h>
#import <JobsWallet/JobsWalletCollectionViewLayout.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsWalletCardView : BaseView
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

Prop_copy()NSArray<JobsWalletCardModel *> *cardModels;
Prop_assign()JobsWalletCardExpandStyle expandStyle;

-(instancetype)initWithFrame:(CGRect)frame
                 expandStyle:(JobsWalletCardExpandStyle)expandStyle
                  cardModels:(NSArray<JobsWalletCardModel *> *)cardModels;
-(void)reloadDataWithCardModels:(NSArray<JobsWalletCardModel *> *)cardModels;
-(void)expandAllCards;
-(void)collapseAllCards;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCardView_h */
