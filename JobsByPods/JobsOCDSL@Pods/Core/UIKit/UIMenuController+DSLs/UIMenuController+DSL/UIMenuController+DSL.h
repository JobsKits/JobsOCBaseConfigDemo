//
//  UIMenuController+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_UIMENUCONTROLLER_DSL_2F3C9A8B61
#define JOBS_HEADER_GUARD_UIMENUCONTROLLER_DSL_2F3C9A8B61

#import <UIKit/UIKit.h>

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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface UIMenuController (DSL)

#pragma mark —— Singleton
+(JobsRetMenuControllerByVoidBlock _Nonnull)bySharedMenuController;
#pragma mark —— Properties
-(JobsRetMenuControllerByBOOLBlock _Nonnull)byMenuVisible;
-(JobsRetMenuControllerByArrBlock _Nonnull)byMenuItems;
-(JobsRetMenuControllerByArrowDirectionBlock _Nonnull)byArrowDirection;
#pragma mark —— Readonly Properties
-(JobsRetFrameByVoidBlock _Nonnull)byGetMenuFrame;
#pragma mark —— Methods
-(JobsRetMenuControllerByBOOLBlock _Nonnull)bySetMenuVisible API_UNAVAILABLE(visionos);
-(JobsRetMenuControllerByVoidBlock _Nonnull)byUpdate;
-(JobsRetMenuControllerByVoidBlock _Nonnull)byHideMenu API_AVAILABLE(ios(13.0));
-(JobsRetMenuControllerByViewBlock _Nonnull)byHideMenuFromView API_AVAILABLE(ios(13.0));

@end

#pragma clang diagnostic pop

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIMENUCONTROLLER_DSL_2F3C9A8B61 */
