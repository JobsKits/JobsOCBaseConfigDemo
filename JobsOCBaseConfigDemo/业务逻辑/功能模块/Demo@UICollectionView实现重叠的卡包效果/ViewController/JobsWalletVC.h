//
//  JobsWalletVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#import "JobsWalletCardModel.h"

#if __has_include(<JobsWallet/JobsWalletHeader.h>)
#import <JobsWallet/JobsWalletHeader.h>
#else
#import "JobsWalletHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsWalletVC : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsWalletVC
-(JobsRetJobsWalletVCByBOOLBlock _Nonnull)byShowsModeList;
-(JobsRetJobsWalletVCByBOOLBlock _Nonnull)byWalletCardsExpanded;
-(JobsRetJobsWalletVCByJobsWalletCardExpandStyleBlock _Nonnull)byWalletStyle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsWalletVC
@end

NS_ASSUME_NONNULL_END
