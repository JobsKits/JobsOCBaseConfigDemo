//
//  JobsSwiftParityMomentsPreviewDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月23日，星期四.
//

#import "JobsSwiftParityDemoBaseVC.h"

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsOCCommentModeDetailVC.h"
#import "JobsPresentationCtrl.h"

#if __has_include(<JobsFuseAnimation/JobsFuseAnimation.h>)
#import <JobsFuseAnimation/JobsFuseAnimation.h>
#else
#import "JobsFuseAnimation.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<GKPhotoBrowser/GKPhotoBrowser.h>)
#import <GKPhotoBrowser/GKPhotoBrowser.h>
#else
#import "GKPhotoBrowser.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsSwiftParityMomentsPreviewDemoVC : JobsSwiftParityDemoBaseVC

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsSwiftParityMomentsPreviewDemoVC
-(JobsRetJobsSwiftParityMomentsPreviewDemoVCByJobsOCCommentModeBlock _Nonnull)byCommentMode;
-(JobsRetJobsSwiftParityMomentsPreviewDemoVCByUIButtonBlock _Nonnull)byActiveLikeBtn;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsSwiftParityMomentsPreviewDemoVC
@end

NS_ASSUME_NONNULL_END
