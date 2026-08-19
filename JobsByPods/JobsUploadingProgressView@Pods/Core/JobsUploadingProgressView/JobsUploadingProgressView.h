//
//  JobsUploadingProgressView.h
//  JobsUploadingProgressView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C
#define JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsUploadingProgressView : BaseView

Prop_strong()UIColor *strokeColor; // 圆的线条颜色
Prop_copy()NSString *titleStr; // 描述文字
Prop_strong()UIImage *imge; // 圆内Logo
Prop_assign()CGFloat width; // 提示框 w
Prop_assign()CGFloat height; // 提示框 h
Prop_assign()CGFloat radius; // 圆半径

+(instancetype)sharedManager;
+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager;
-(JobsRetJobsUploadingProgressViewByCorBlock _Nonnull)byStrokeColor;
-(jobsByStrBlock _Nonnull)updateProgressText;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsUploadingProgressView
-(JobsRetJobsUploadingProgressViewByCAKeyframeAnimationBlock _Nonnull)byAnim;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsUploadingProgressView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSUPLOADINGPROGRESSVIEW_FCCCA7F94C */
