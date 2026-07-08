//
//  JobsOCGraphicCaptchaGenerator.h
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAGENERATOR_B478DC226F
#define JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAGENERATOR_B478DC226F

#import <Foundation/Foundation.h>
#import <JobsOCGraphicCaptcha/JobsOCGraphicCaptchaConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCGraphicCaptchaGenerator : NSObject

+(NSArray<NSString *> *)numberCharacters;
+(NSArray<NSString *> *)lowercaseLetterCharacters;
+(NSArray<NSString *> *)uppercaseLetterCharacters;
+(NSArray<NSString *> *)chineseCharacters;
+(NSArray<NSString *> *)charactersForUnits:(JobsOCGraphicCaptchaCharacterUnit)units;
+(NSString *)randomTextByConfig:(JobsOCGraphicCaptchaConfig *_Nullable)config;
+(BOOL)validateInput:(NSString *_Nullable)input
             captcha:(NSString *_Nullable)captcha
       caseSensitive:(BOOL)caseSensitive;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSOCGRAPHICCAPTCHAGENERATOR_B478DC226F */
