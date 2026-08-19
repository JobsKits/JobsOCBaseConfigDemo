//
//  BaiShaETProjPopupView10.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsBtnStyleCVCell.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface BaiShaETProjPopupView10 : BaseView
<
UICollectionViewDataSource
,UICollectionViewDelegate
,UICollectionViewDelegateFlowLayout
>
#pragma mark —— 一些公有方法
-(jobsByBOOLBlock _Nonnull)shakeCell;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BaiShaETProjPopupView10
-(JobsRetBaiShaETProjPopupView10ByNSIntegerBlock _Nonnull)bySelectedIndex;
-(JobsRetBaiShaETProjPopupView10ByNSMutableArrayUIViewModelBlock _Nonnull)byDataMutArr;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BaiShaETProjPopupView10
@end

NS_ASSUME_NONNULL_END
