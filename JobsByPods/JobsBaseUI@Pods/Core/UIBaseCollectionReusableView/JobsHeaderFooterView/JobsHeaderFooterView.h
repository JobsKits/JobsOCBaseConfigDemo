//
//  JobsHeaderFooterView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEW_D33F7FC47F
#define JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEW_D33F7FC47F

#import <UIKit/UIKit.h>
#import <JobsBaseUI/BaseCollectionReusableView.h>
#import <JobsBaseUI/BaseButton.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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
/// 最左边一个主标题（UIButton） + 最右边有一个副标题（UIButton）
@interface JobsHeaderFooterView : BaseCollectionReusableView<AppToolsProtocol>

-(JobsRetJobsHeaderFooterViewByViewModelBlock _Nonnull)byTitleModel;
-(JobsRetJobsHeaderFooterViewByViewModelBlock _Nonnull)bySubTitleModel;
-(JobsRetBaseButtonByVoidBlock _Nonnull)getTitleBtn;
-(JobsRetBaseButtonByVoidBlock _Nonnull)getSubTitleBtn;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEW_D33F7FC47F */
