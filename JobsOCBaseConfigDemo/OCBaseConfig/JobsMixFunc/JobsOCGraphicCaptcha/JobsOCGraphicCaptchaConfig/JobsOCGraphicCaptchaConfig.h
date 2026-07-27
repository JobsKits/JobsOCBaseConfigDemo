//
//  JobsOCGraphicCaptchaConfig.h
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2
#define JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, JobsOCGraphicCaptchaCharacterUnit) {
    JobsOCGraphicCaptchaCharacterUnitNumber = 1 << 0,
    JobsOCGraphicCaptchaCharacterUnitLowercaseLetter = 1 << 1,
    JobsOCGraphicCaptchaCharacterUnitUppercaseLetter = 1 << 2,
    JobsOCGraphicCaptchaCharacterUnitChinese = 1 << 3,
    JobsOCGraphicCaptchaCharacterUnitLetter = JobsOCGraphicCaptchaCharacterUnitLowercaseLetter | JobsOCGraphicCaptchaCharacterUnitUppercaseLetter,
    JobsOCGraphicCaptchaCharacterUnitDefault = JobsOCGraphicCaptchaCharacterUnitNumber | JobsOCGraphicCaptchaCharacterUnitLetter
};

@interface JobsOCGraphicCaptchaConfig : NSObject
<
NSCopying
>

Prop_assign()NSUInteger length;
Prop_assign()BOOL caseSensitive;
Prop_assign()JobsOCGraphicCaptchaCharacterUnit characterUnits;
Prop_assign()NSUInteger mixedGroupCount;
Prop_copy(nullable)NSArray<NSString *> *customCharacters;
Prop_copy(nullable)NSArray<NSArray<NSString *> *> *customCharacterGroups;

+(instancetype)defaultConfig;
+(instancetype)numberConfig;
+(instancetype)chineseConfig;
+(instancetype)letterCaseSensitiveConfig;
+(instancetype)letterCaseInsensitiveConfig;
+(instancetype)mixedConfig;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2 */
