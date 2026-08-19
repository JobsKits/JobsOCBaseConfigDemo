//
//  JobsRichTextConfig+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_EEA7D55E35DCCA6
#define JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_EEA7D55E35DCCA6

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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

@interface JobsRichTextConfig (DSL)

-(JobsRetJobsRichTextConfigByStrBlock _Nonnull)byTargetString;
-(JobsRetJobsRichTextConfigByFontBlock _Nonnull)byFont;
-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byTextCor;
-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byTextBgCor;
-(JobsRetJobsRichTextConfigByNSUnderlineStyleBlock _Nonnull)byUnderlineStyle;
-(JobsRetJobsRichTextConfigByCorBlock _Nonnull)byUnderlineCor;
-(JobsRetJobsRichTextConfigByNSMutableParagraphStylePointerBlock _Nonnull)byParagraphStyle;
-(JobsRetJobsRichTextConfigByStrBlock _Nonnull)byUrlStr;
-(JobsRetJobsRichTextConfigByNSRangeBlock _Nonnull)byRange;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_EEA7D55E35DCCA6 */
