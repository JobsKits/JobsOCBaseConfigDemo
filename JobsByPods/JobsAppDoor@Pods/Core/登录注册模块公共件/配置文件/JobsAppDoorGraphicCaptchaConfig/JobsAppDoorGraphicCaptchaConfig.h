//
//  JobsAppDoorGraphicCaptchaConfig.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORGRAPHICCAPTCHACONFIG_8AE284C542
#define JOBS_HEADER_GUARD_JOBSAPPDOORGRAPHICCAPTCHACONFIG_8AE284C542

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>)
#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaHeader.h>
#else
#import "JobsOCGraphicCaptchaHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, JobsAppDoorGraphicCaptchaCharacterType) {
    JobsAppDoorGraphicCaptchaCharacterTypeNumber = 1 << 0,
    JobsAppDoorGraphicCaptchaCharacterTypeEnglish = 1 << 1,
    JobsAppDoorGraphicCaptchaCharacterTypeChinese = 1 << 2,
    JobsAppDoorGraphicCaptchaCharacterTypeDefault = JobsAppDoorGraphicCaptchaCharacterTypeNumber | JobsAppDoorGraphicCaptchaCharacterTypeEnglish,
    JobsAppDoorGraphicCaptchaCharacterTypeAll = JobsAppDoorGraphicCaptchaCharacterTypeNumber | JobsAppDoorGraphicCaptchaCharacterTypeEnglish | JobsAppDoorGraphicCaptchaCharacterTypeChinese
};

@interface JobsAppDoorGraphicCaptchaConfig : NSObject
<
NSCopying
>

Prop_assign()NSUInteger length;
Prop_assign()BOOL caseSensitive;
Prop_assign()JobsAppDoorGraphicCaptchaCharacterType characterTypes;

+(instancetype)defaultConfig;
+(instancetype)numberAndEnglishConfig;
+(instancetype)numberAndChineseConfig;
+(instancetype)englishAndChineseConfig;
+(instancetype)allCharactersConfig;
-(JobsOCGraphicCaptchaConfig *)resolvedCaptchaConfig;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORGRAPHICCAPTCHACONFIG_8AE284C542 */
