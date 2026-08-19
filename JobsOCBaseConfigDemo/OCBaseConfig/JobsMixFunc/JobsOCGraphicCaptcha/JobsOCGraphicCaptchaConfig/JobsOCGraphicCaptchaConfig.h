//
//  JobsOCGraphicCaptchaConfig.h
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2
#define JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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
    JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese = 1 << 3,
    JobsOCGraphicCaptchaCharacterUnitTraditionalChinese = 1 << 4,
    JobsOCGraphicCaptchaCharacterUnitChinese = JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese | JobsOCGraphicCaptchaCharacterUnitTraditionalChinese,
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

-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byLength;
-(JobsRetJobsOCGraphicCaptchaConfigByBOOLBlock _Nonnull)byCaseSensitive;
-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byCharacterUnits;
-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byMixedGroupCount;
-(JobsRetJobsOCGraphicCaptchaConfigByArrBlock _Nonnull)byCustomCharacters;
-(JobsRetJobsOCGraphicCaptchaConfigByArrBlock _Nonnull)byCustomCharacterGroups;

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)defaultConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)numberConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)chineseConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)simplifiedChineseConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)traditionalChineseConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseSensitiveConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseInsensitiveConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)mixedConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)twoMixedConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)threeMixedConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)fourMixedConfig;
+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)fullMixedConfig;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHACONFIG_8F546DE6B2 */
