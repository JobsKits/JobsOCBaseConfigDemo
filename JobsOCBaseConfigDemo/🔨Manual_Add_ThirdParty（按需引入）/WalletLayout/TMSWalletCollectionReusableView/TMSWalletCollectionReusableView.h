//
//  TMSWalletCollectionReusableView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONREUSABLEVIEW_9843BA2B17
#define JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONREUSABLEVIEW_9843BA2B17

#import <UIKit/UIKit.h>

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

#import "JobsOCDSL.h"

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface TMSWalletCollectionReusableView : UICollectionReusableView
<
BaseViewProtocol
,BaseProtocol
,AppToolsProtocol
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_TMSWALLETCOLLECTIONREUSABLEVIEW_9843BA2B17 */
