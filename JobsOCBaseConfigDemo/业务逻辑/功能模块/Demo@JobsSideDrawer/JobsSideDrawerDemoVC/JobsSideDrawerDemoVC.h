//
//  JobsSideDrawerDemoVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月12日，星期日.
//

#import "BaseViewController.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsViewPush/JobsViewPush.h>)
#import <JobsViewPush/JobsViewPush.h>
#else
#import "JobsViewPush.h"
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

@interface JobsSideDrawerDemoVC : BaseViewController
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsSideDrawerDemoVC
-(JobsRetJobsSideDrawerDemoVCByUIViewBlock _Nonnull)byDrawerContentView;
-(JobsRetJobsSideDrawerDemoVCByUIViewBlock _Nonnull)byDrawerHostView;
-(JobsRetJobsSideDrawerDemoVCByNSStringBlock _Nonnull)byGk_navTitle;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsSideDrawerDemoVC
@end
