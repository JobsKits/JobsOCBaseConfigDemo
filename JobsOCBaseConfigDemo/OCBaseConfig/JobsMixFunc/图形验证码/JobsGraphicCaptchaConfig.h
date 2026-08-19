//
//  JobsGraphicCaptchaConfig.h
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2
#define JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2

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

typedef NS_OPTIONS(NSUInteger, JobsGraphicCaptchaCharacterUnit) {
    JobsGraphicCaptchaCharacterUnitNumber = 1 << 0,
    JobsGraphicCaptchaCharacterUnitLowercaseLetter = 1 << 1,
    JobsGraphicCaptchaCharacterUnitUppercaseLetter = 1 << 2,
    JobsGraphicCaptchaCharacterUnitSimplifiedChinese = 1 << 3,
    JobsGraphicCaptchaCharacterUnitTraditionalChinese = 1 << 4,
    JobsGraphicCaptchaCharacterUnitChinese = JobsGraphicCaptchaCharacterUnitSimplifiedChinese | JobsGraphicCaptchaCharacterUnitTraditionalChinese,
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
Prop_assign()NSUInteger mixedGroupCount;
Prop_copy(nullable)NSArray<NSString *> *customCharacters;

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)defaultConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)numberConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)chineseConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)simplifiedChineseConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)traditionalChineseConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseSensitiveConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseInsensitiveConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)mixedConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)twoMixedConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)threeMixedConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)fourMixedConfig;
+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)fullMixedConfig;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGraphicCaptchaConfig
-(JobsRetJobsGraphicCaptchaConfigByNSUIntegerBlock _Nonnull)byLength;
-(JobsRetJobsGraphicCaptchaConfigByBOOLBlock _Nonnull)byCaseSensitive;
-(JobsRetJobsGraphicCaptchaConfigByJobsGraphicCaptchaCharacterUnitBlock _Nonnull)byCharacterUnits;
-(JobsRetJobsGraphicCaptchaConfigByNSArrayNSStringBlock _Nonnull)byCustomCharacters;
-(JobsRetJobsGraphicCaptchaConfigByNSUIntegerBlock _Nonnull)byMixedGroupCount;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGraphicCaptchaConfig
@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHACONFIG_8F546DE6B2 */
