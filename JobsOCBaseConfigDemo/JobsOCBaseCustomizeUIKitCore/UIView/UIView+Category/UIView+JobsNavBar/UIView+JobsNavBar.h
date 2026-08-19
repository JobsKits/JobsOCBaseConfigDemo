//
//  UIView+JobsNavBar.h
//  JobsNavBar
//
//  Created by Jobs on 2026年5月19日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsNavBar.h"
#import "UIView+Extra.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsAppToolsHeader.h"
#import "JobsOCDSL.h"
#import "JobsDefines.h"

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
