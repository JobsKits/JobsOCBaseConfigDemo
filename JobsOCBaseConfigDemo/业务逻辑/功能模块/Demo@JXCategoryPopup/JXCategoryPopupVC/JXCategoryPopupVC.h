//
//  JXCategoryPopupVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JXCategoryPopupSubVC.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<TFPopupExtra/TFPopupExtra.h>)
#import <TFPopupExtra/TFPopupExtra.h>
#else
#import "TFPopupExtra.h"
#endif

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryPopupVC : BaseViewController
<
JXCategoryTitleViewDataSource
,JXCategoryListContainerViewDelegate
,JXCategoryViewDelegate
,TFPopupDelegate
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryPopupVC
-(JobsRetJXCategoryPopupVCByNSIntegerBlock _Nonnull)byCurrentIndex;
-(JobsRetJXCategoryPopupVCByUIViewBlock _Nonnull)byPopUpCustomView;
-(JobsRetJXCategoryPopupVCByUIViewBlock _Nonnull)byPopUpFiltrationView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryPopupVC
@end

NS_ASSUME_NONNULL_END
