//
//  JobsPostVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPostDelView.h"
#import "NSObject+SPAlertController.h"

#if __has_include(<HXPhotoPickerObjC/HXPhotoPicker.h>)
#import <HXPhotoPickerObjC/HXPhotoPicker.h>
#else
#import "HXPhotoPicker.h"
#endif

#if __has_include(<SZTextView/SZTextView.h>)
#import <SZTextView/SZTextView.h>
#else
#import "SZTextView.h"
#endif

#if __has_include(<FileFolderHandleTool/FileFolderHandleToolHeader.h>)
#import <FileFolderHandleTool/FileFolderHandleToolHeader.h>
#else
#import "FileFolderHandleToolHeader.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface JobsPostVC : BaseViewController
<
HXPhotoViewDelegate
,UITextViewDelegate
>

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsPostVC
-(JobsRetJobsPostVCByBOOLBlock _Nonnull)byFd_interactivePopDisabled;
-(JobsRetJobsPostVCByBOOLBlock _Nonnull)byNeedDeleteItem;
-(JobsRetJobsPostVCByNSArrayHXPhotoModelBlock _Nonnull)byHistoryPhotoDataArr;
-(JobsRetJobsPostVCByNSArrayHXPhotoModelBlock _Nonnull)byPhotosDataArr;
-(JobsRetJobsPostVCByNSArrayHXPhotoModelBlock _Nonnull)byVideosDataArr;
-(JobsRetJobsPostVCByNSDataBlock _Nonnull)byVideosData;
-(JobsRetJobsPostVCByNSMutableArrayUIImageBlock _Nonnull)byPhotosImageMutArr;
-(JobsRetJobsPostVCByNSStringBlock _Nonnull)byInputDataString;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsPostVC
@end

NS_ASSUME_NONNULL_END
