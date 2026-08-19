//
//  JobsOCGraphicCaptchaDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>)
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>
#else
#import "UILabel+Scrolling.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>)
#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>
#else
#import "JobsOCGraphicCaptchaHeader.h"
#endif

#if __has_include(<JobsOCNumberStepper/JobsOCNumberStepperHeader.h>)
#import <JobsOCNumberStepper/JobsOCNumberStepperHeader.h>
#else
#import "JobsOCNumberStepperHeader.h"
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

@interface JobsOCGraphicCaptchaDemoVC : BaseViewController

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCGraphicCaptchaDemoVC
-(JobsRetJobsOCGraphicCaptchaDemoVCByUIButtonBlock _Nonnull)bySelectedOptionBtn;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCGraphicCaptchaDemoVC
@end

NS_ASSUME_NONNULL_END
