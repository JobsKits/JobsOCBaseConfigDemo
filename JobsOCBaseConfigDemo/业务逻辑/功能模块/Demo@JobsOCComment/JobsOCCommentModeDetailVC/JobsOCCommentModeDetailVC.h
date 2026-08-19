//
//  JobsOCCommentModeDetailVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsOCComment/JobsOCComment.h>)
#import <JobsOCComment/JobsOCComment.h>
#else
#import "JobsOCComment.h"
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

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCommentModeDetailVC : BaseViewController

Prop_assign()JobsOCCommentMode mode;
Prop_assign()BOOL popupStyle;
Prop_assign()BOOL replyDetailStyle;
Prop_assign()CGFloat popUpHeight;
Prop_copy()NSArray <JobsOCCommentModel *>*commentArr;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCCommentModeDetailVC
-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byHiddenNavigationBar;
-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byPopupStyle;
-(JobsRetJobsOCCommentModeDetailVCByBOOLBlock _Nonnull)byReplyDetailStyle;
-(JobsRetJobsOCCommentModeDetailVCByCGFloatBlock _Nonnull)byPopUpHeight;
-(JobsRetJobsOCCommentModeDetailVCByJobsOCCommentModeBlock _Nonnull)byMode;
-(JobsRetJobsOCCommentModeDetailVCByNSArrayJobsOCCommentModelBlock _Nonnull)byCommentArr;
-(JobsRetJobsOCCommentModeDetailVCByCGSizeBlock _Nonnull)byPreferredContentSize;
-(JobsRetJobsOCCommentModeDetailVCByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate;
-(JobsRetJobsOCCommentModeDetailVCByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCCommentModeDetailVC
@end

NS_ASSUME_NONNULL_END
