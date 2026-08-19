//
//  JobsGraphicCaptchaDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import "JobsBaseUI.h"
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import "JobsLanMgr.h"
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsGraphicCaptcha/JobsGraphicCaptchaHeader.h>)
#import "JobsGraphicCaptchaHeader.h"
#else
#import "JobsGraphicCaptchaHeader.h"
#endif

#import "../../../OCBaseConfig/JobsMixFunc/JobsOCNumberStepper/JobsOCNumberStepper.h"

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGraphicCaptchaDemoVC : BaseViewController

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGraphicCaptchaDemoVC
-(JobsRetJobsGraphicCaptchaDemoVCByUIButtonBlock _Nonnull)bySelectedOptionBtn;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGraphicCaptchaDemoVC
@end

NS_ASSUME_NONNULL_END
