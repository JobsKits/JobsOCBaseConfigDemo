//
//  JobsPullListAutoSizeView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77
#define JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsPullListTBVCell.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsPullListAutoSizeView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
>

Prop_assign()CGFloat listTbVWidth;
Prop_assign()CGFloat listTbVCellHeight;
Prop_assign()CGFloat listTbVOffset;
Prop_strong()UIColor *bgColorListTBV;

+(instancetype)initWithTargetView:(UIView *__nonnull)targetView
                       dataMutArr:(NSArray <UIViewModel *>*__nonnull)dataMutArr;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSPULLLISTAUTOSIZEVIEW_1A9C50AD77 */
