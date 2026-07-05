//
//  TMSWalletCollectionViewCell.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONVIEWCELL_6F53AD2552
#define JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONVIEWCELL_6F53AD2552

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsMakes.h"

#import "JobsModelDSL.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSWalletCollectionViewCell : UICollectionViewCell<BaseViewProtocol,AppToolsProtocol>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONVIEWCELL_6F53AD2552 */
