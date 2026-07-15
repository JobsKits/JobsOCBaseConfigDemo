//
//  JobsRichTextConfig+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_EEA7D55E35DCCA6
#define JOBS_HEADER_GUARD_JOBSRICHTEXTCONFIG_DSL_EEA7D55E35DCCA6

#import "JobsModel.h"
#import "JobsBlock.h"

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
