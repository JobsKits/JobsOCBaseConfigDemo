//
//  JobsGraphicCaptchaConfig.h
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2
#define JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, JobsGraphicCaptchaCharacterUnit) {
    JobsGraphicCaptchaCharacterUnitNumber = 1 << 0,
    JobsGraphicCaptchaCharacterUnitLowercaseLetter = 1 << 1,
    JobsGraphicCaptchaCharacterUnitUppercaseLetter = 1 << 2,
    JobsGraphicCaptchaCharacterUnitChinese = 1 << 3,
    JobsGraphicCaptchaCharacterUnitLetter = JobsGraphicCaptchaCharacterUnitLowercaseLetter | JobsGraphicCaptchaCharacterUnitUppercaseLetter,
    JobsGraphicCaptchaCharacterUnitDefault = JobsGraphicCaptchaCharacterUnitNumber | JobsGraphicCaptchaCharacterUnitLetter
};

@interface JobsGraphicCaptchaConfig : NSObject
<
NSCopying
>

Prop_assign()NSUInteger length;
Prop_assign()BOOL caseSensitive;
Prop_assign()JobsGraphicCaptchaCharacterUnit characterUnits;
Prop_copy(nullable)NSArray<NSString *> *customCharacters;

+(instancetype)defaultConfig;
+(instancetype)numberConfig;
+(instancetype)chineseConfig;
+(instancetype)letterCaseSensitiveConfig;
+(instancetype)letterCaseInsensitiveConfig;
+(instancetype)mixedConfig;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2 */
