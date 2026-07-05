//
//  UIView+JobsNavBar.h
//  JobsNavBar
//
//  Created by Jobs on 2026年5月19日，星期二.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6
#define JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6

#import <UIKit/UIKit.h>
#import "JobsNavBar.h"
#import "UIView+Extra.h"

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#import "JobsBaseProtocolHeader.h"

#import "JobsAppToolsHeader.h"

#import "JobsOCDSL.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JobsNavBar)<AppToolsProtocol, BaseViewProtocol>

Prop_strong(nullable)JobsNavBarConfig *jobs_navBarConfig;
Prop_strong(nullable)JobsNavBar *jobs_navBar;

-(JobsRetNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig;
-(JobsNavBar *_Nullable)jobs_addNavBarWithConfig:(JobsNavBarConfig *_Nullable)config;
-(void)jobs_removeNavBar;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_JOBSNAVBAR_134E7AF0F6 */
