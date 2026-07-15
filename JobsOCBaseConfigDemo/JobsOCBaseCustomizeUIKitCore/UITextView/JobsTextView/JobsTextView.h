//
//  JobsTextView.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561
#define JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561

#import <UIKit/UIKit.h>
#import "BaseView.h"
#import "UIView+Extra.h"
#import "UITextView+Extend.h"
#import "JobsOCDSL.h"

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsLanMgr.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsTextView : BaseView

-(SZTextView *)getTextView;
-(jobsByNSIntegerBlock _Nonnull)updateWordCount;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTextView *_Nonnull makeJobsTextView(jobsByJobsTextViewBlock _Nonnull block){
    JobsTextView *data = JobsTextView.alloc.init;
    if (block) block(data);
    return data;
}
#endif /* JOBS_HEADER_GUARD_JOBSTEXTVIEW_88A198A561 */
