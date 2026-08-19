//
//  GXCardViewDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "GXCardItemDemoCell.h"
#import "GXCardView.h"

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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GXCardView (JobsDemoDSL)
-(JobsRetGXCardViewByIDBlock _Nonnull)byDataSource;
-(JobsRetGXCardViewByIDBlock _Nonnull)byDelegate;
-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)byVisibleCount;
-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byLineSpacing;
-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byInteritemSpacing;
-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxAngle;
-(JobsRetGXCardViewByCGFloatBlock _Nonnull)byMaxRemoveDistance;
-(JobsRetGXCardViewByBOOLBlock _Nonnull)byRepeat;
-(JobsRetGXCardViewByIDBlocks _Nonnull)byRegisterCell;
-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadDataAnimated;
-(JobsRetGXCardViewByBOOLBlock _Nonnull)reloadMoreDataAnimated;
-(JobsRetGXCardViewByNSIntegerBlock _Nonnull)removeTopCardViewFromSwipe;
@end

@interface GXCardViewDemoVC : BaseViewController
<
GXCardViewDataSource
,GXCardViewDelegate
,UITableViewDelegate
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN GXCardViewDemoVC
-(JobsRetGXCardViewDemoVCByNSIntegerBlock _Nonnull)byCellCount;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END GXCardViewDemoVC
@end

NS_ASSUME_NONNULL_END
