//
//  JobsAppDoorRegisterConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0
#define JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsAppDoor/JobsAppDoorGraphicCaptchaConfig.h>)
#import "JobsAppDoorGraphicCaptchaConfig.h"
#else
#import "JobsAppDoorGraphicCaptchaConfig.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorRegisterConfig : NSObject
<
NSCopying
>

Prop_assign()BOOL showsMobileBinding;
Prop_assign()BOOL showsGraphicCaptcha;
Prop_strong()JobsAppDoorGraphicCaptchaConfig *graphicCaptchaConfig;

+(JobsRetIDByVoidBlock _Nonnull)basicConfig;
+(JobsRetIDByVoidBlock _Nonnull)fullConfig;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorRegisterConfig
-(JobsRetJobsAppDoorRegisterConfigByBOOLBlock _Nonnull)byShowsGraphicCaptcha;
-(JobsRetJobsAppDoorRegisterConfigByBOOLBlock _Nonnull)byShowsMobileBinding;
-(JobsRetJobsAppDoorRegisterConfigByJobsAppDoorGraphicCaptchaConfigBlock _Nonnull)byGraphicCaptchaConfig;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorRegisterConfig
@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0 */
