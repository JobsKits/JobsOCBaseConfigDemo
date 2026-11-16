//
//  JobsGraphicCaptchaGenerator.h
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F
#define JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsGraphicCaptchaConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsGraphicCaptchaGenerator : NSObject

+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)numberCharacters;
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)lowercaseLetterCharacters;
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)uppercaseLetterCharacters;
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)simplifiedChineseCharacters;
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)traditionalChineseCharacters;
+(JobsRetNSArrayNSStringByVoidBlock _Nonnull)chineseCharacters;
+(JobsRetNSArrayNSStringByJobsGraphicCaptchaCharacterUnitBlock _Nonnull)charactersForUnits;
+(JobsRetNSStringByJobsGraphicCaptchaConfigBlock _Nonnull)randomTextByConfig;
+(BOOL)validateInput:(NSString *_Nullable)input
             captcha:(NSString *_Nullable)captcha
       caseSensitive:(BOOL)caseSensitive;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F */
