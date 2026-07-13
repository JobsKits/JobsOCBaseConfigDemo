//
//  JobsOCGraphicCaptchaView+DSL.h
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月10日，星期五.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_DSL_39B8635B45
#define JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_DSL_39B8635B45

#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaView.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCGraphicCaptchaView (DSL)

-(JobsRetOCGraphicCaptchaViewByFontBlock _Nonnull)byFont;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAVIEW_DSL_39B8635B45 */
