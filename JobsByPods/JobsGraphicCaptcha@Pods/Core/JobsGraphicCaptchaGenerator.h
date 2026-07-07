//
//  JobsGraphicCaptchaGenerator.h
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#ifndef JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F
#define JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F

#import <Foundation/Foundation.h>
#import <JobsGraphicCaptcha/JobsGraphicCaptchaConfig.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsGraphicCaptchaGenerator : NSObject

+(NSArray<NSString *> *)numberCharacters;
+(NSArray<NSString *> *)lowercaseLetterCharacters;
+(NSArray<NSString *> *)uppercaseLetterCharacters;
+(NSArray<NSString *> *)chineseCharacters;
+(NSArray<NSString *> *)charactersForUnits:(JobsGraphicCaptchaCharacterUnit)units;
+(NSString *)randomTextByConfig:(JobsGraphicCaptchaConfig *_Nullable)config;
+(BOOL)validateInput:(NSString *_Nullable)input
             captcha:(NSString *_Nullable)captcha
       caseSensitive:(BOOL)caseSensitive;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSGRAPHICCAPTCHAGENERATOR_B478DC226F */
