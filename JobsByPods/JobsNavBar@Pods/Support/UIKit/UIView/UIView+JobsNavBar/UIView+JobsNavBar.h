//
//  UIView+JobsNavBar.h
//  JobsNavBar
//
//  Created by Jobs on 2026年5月19日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6
#define JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsNavBar/JobsNavBar.h>
#import <JobsNavBar/UIView+Extra.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsAppTools/JobsAppToolsHeader.h>)
#import <JobsAppTools/JobsAppToolsHeader.h>
#else
#import "JobsAppToolsHeader.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JobsNavBar)<AppToolsProtocol, BaseViewProtocol>

Prop_strong(nullable)JobsNavBarConfig *jobs_navBarConfig;
Prop_strong(nullable)JobsNavBar *jobs_navBar;

-(JobsRetNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig;
-(JobsRetJobsNavBarByJobsNavBarConfigBlock _Nonnull)jobs_addNavBarWithConfig;
-(jobsByVoidBlock _Nonnull)jobs_removeNavBar;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6 */
