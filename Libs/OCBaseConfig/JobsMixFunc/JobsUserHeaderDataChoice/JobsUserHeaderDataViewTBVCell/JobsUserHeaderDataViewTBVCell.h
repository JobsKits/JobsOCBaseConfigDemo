//
//  JobsUserHeaderDataViewTBVCell.h
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWTBVCELL_15ACBB4F6A
#define JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWTBVCELL_15ACBB4F6A

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsByOCPods.h"
#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsUserHeaderDataViewTBVCell : JobsBaseTableViewCell

-(JobsRetStrByVoidBlock _Nonnull)getTitleValue;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUSERHEADERDATAVIEWTBVCELL_15ACBB4F6A */
