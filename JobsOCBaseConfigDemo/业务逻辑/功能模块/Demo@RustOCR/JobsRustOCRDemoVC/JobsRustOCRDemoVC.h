//
//  JobsRustOCRDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import <UIKit/UIKit.h>
#import <PhotosUI/PhotosUI.h>

#if __has_include(<XYColorOC/XYColorOC.h>)
#import <XYColorOC/XYColorOC.h>
#else
#import "XYColorOC.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsRustOCR/JobsRustOCR.h>)
#import <JobsRustOCR/JobsRustOCR.h>
#define JOBS_RUST_OCR_AVAILABLE 1
#elif __has_include("JobsRustOCR.h")
#import "JobsRustOCR.h"
#define JOBS_RUST_OCR_AVAILABLE 1
#else
#define JOBS_RUST_OCR_AVAILABLE 0
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

@interface JobsRustOCRDemoVC : BaseViewController <PHPickerViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
