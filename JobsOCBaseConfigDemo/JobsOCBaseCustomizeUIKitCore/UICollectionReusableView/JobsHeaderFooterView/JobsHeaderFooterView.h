//
//  JobsHeaderFooterView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEW_D33F7FC47F
#define JOBS_HEADER_GUARD_JOBSHEADERFOOTERVIEW_D33F7FC47F

#import <UIKit/UIKit.h>
#import "BaseCollectionReusableView.h"
#import "BaseButton.h"
#import "JobsLanMgr.h"
#import "JobsOCDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

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
