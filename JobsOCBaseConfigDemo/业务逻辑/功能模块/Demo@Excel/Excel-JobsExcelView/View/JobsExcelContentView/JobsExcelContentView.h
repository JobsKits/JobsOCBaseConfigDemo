//
//  JobsExcelContentView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsExcelConfigureViewModel.h"
#import "JobsEmptyDataView.h"
#import "MainTableViewCell.h"

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

@class UIButtonModel;

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

@interface JobsExcelContentView : UIView
<
UITableViewDelegate,
UITableViewDataSource,
MianTableViewCellDelegate,
BaseViewProtocol
>

@property(nonatomic,strong,nonnull,readonly)JobsExcelConfigureViewModel *excelConfigureData;
-(jobsByPointBlock _Nonnull)configureContentOffSet;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsExcelContentView
-(JobsRetJobsExcelContentViewByCGPointBlock _Nonnull)byContentOffenset;
-(JobsRetJobsExcelContentViewByJobsExcelConfigureViewModelBlock _Nonnull)byExcelConfigureData;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsExcelContentView
@end

NS_INLINE __kindof JobsExcelContentView *_Nonnull jobsMakeExcelContentView(jobsByExcelContentViewBlock _Nonnull block){
    JobsExcelContentView *data = JobsExcelContentView.alloc.init;
    if (block) block(data);
    return data;
}
