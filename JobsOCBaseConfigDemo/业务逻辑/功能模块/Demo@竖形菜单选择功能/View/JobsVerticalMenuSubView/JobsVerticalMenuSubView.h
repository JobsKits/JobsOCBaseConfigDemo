//
//  JobsVerticalMenuSubView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#import "GoodsClassModel.h"
#import "ThreeClassCell.h"

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

@interface JobsVerticalMenuSubView : BaseView
/// 按左侧栏目下标刷新右侧内容
-(jobsByNSUIntegerBlock _Nonnull)reloadContentByIndex;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsVerticalMenuSubView
-(JobsRetJobsVerticalMenuSubViewByNSUIntegerBlock _Nonnull)byThisIndex;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsVerticalMenuSubView
@end

NS_ASSUME_NONNULL_END
