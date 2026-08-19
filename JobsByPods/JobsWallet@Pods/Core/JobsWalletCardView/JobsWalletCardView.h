//
//  JobsWalletCardView.h
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCardView_h
#define JobsWalletCardView_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
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
-(jobsByNSArrayJobsWalletCardModelBlock _Nonnull)reloadDataWithCardModels;
-(jobsByVoidBlock _Nonnull)expandAllCards;
-(jobsByVoidBlock _Nonnull)collapseAllCards;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsWalletCardView
-(JobsRetJobsWalletCardViewByNSArrayJobsWalletCardModelBlock _Nonnull)byCardModels;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsWalletCardView
@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCardView_h */
