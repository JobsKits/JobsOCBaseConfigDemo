//
//  JobsOCRefresherDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月30日，星期二.
//

#import <UIKit/UIKit.h>

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

#if __has_include(<JobsFuseAnimation/JobsFuseAnimation.h>)
#import <JobsFuseAnimation/JobsFuseAnimation.h>
#else
#import "JobsFuseAnimation.h"
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

#if __has_include(<JobsOCRefresher/JobsOCRefresher.h>)
#import <JobsOCRefresher/JobsOCRefresher.h>
#else
#import "JobsOCRefresher.h"
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

@interface JobsOCRefresherDemoVC : BaseViewController

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCRefresherDemoVC
-(JobsRetJobsOCRefresherDemoVCByBOOLBlock _Nonnull)byDidAutoStart;
-(JobsRetJobsOCRefresherDemoVCByBOOLBlock _Nonnull)byDidBindRefresher;
-(JobsRetJobsOCRefresherDemoVCByNSIntegerBlock _Nonnull)byHorizontalColumnCount;
-(JobsRetJobsOCRefresherDemoVCByNSIntegerBlock _Nonnull)byVerticalRowCount;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCRefresherDemoVC
@end

NS_ASSUME_NONNULL_END
