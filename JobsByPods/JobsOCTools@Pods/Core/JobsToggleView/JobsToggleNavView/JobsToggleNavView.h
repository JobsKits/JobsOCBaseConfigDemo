//
//  JobsToggleNavView.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTOGGLENAVVIEW_43A40F066A
#define JOBS_HEADER_GUARD_JOBSTOGGLENAVVIEW_43A40F066A

#import <UIKit/UIKit.h>
#import <JobsOCTools/JobsToggleNavViewProtocol.h>

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

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@interface JobsToggleNavView : BaseView<JobsToggleNavViewProtocol>
/// UI
Prop_copy(nullable)NSMutableArray <__kindof UIButton *>*buttonsArray;
/// 选择某一个标签
-(jobsByNSIntegerBlock _Nonnull)selectingOneTagByIndex;

@end

NS_INLINE __kindof JobsToggleNavView *_Nonnull jobsMakeToggleNavView(jobsByToggleNavViewBlock _Nonnull block){
    JobsToggleNavView *data = JobsToggleNavView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSTOGGLENAVVIEW_43A40F066A */
