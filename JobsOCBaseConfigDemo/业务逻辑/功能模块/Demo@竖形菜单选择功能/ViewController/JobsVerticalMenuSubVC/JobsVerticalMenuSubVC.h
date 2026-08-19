//
//  JobsVerticalMenuSubVC.h
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

#import "JobsVerticalMenuSubView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsVerticalMenuSubVC : BaseViewController
/// 对应左侧栏目下标
Prop_assign()NSUInteger contentIndex;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsVerticalMenuSubVC
-(JobsRetJobsVerticalMenuSubVCByBOOLBlock _Nonnull)byDidReloadContentAfterLayout;
-(JobsRetJobsVerticalMenuSubVCByNSUIntegerBlock _Nonnull)byContentIndex;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsVerticalMenuSubVC
@end

NS_ASSUME_NONNULL_END
