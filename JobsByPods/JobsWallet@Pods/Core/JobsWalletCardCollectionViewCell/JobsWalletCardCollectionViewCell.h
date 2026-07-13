//
//  JobsWalletCardCollectionViewCell.h
//  JobsWallet
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JobsWalletCardCollectionViewCell_h
#define JobsWalletCardCollectionViewCell_h

#import <UIKit/UIKit.h>

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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsWalletCardCollectionViewCell : UICollectionViewCell

-(void)jobsRichCardModel:(JobsWalletCardModel *)model;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsWalletCardCollectionViewCell_h */
