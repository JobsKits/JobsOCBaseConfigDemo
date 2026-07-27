//
//  JobsAppDoorRegisterConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0
#define JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0

#import <Foundation/Foundation.h>

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

+(instancetype)basicConfig;
+(instancetype)fullConfig;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORREGISTERCONFIG_69E4E337D0 */
