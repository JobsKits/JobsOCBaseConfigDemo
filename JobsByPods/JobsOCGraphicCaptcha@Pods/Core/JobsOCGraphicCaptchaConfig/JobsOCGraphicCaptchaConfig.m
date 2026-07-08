//
//  JobsOCGraphicCaptchaConfig.m
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaConfig.h"

@implementation JobsOCGraphicCaptchaConfig

-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterUnits = JobsOCGraphicCaptchaCharacterUnitDefault;
    };return self;
}

+(instancetype)defaultConfig{
    return JobsOCGraphicCaptchaConfig.new;
}

+(instancetype)numberConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitNumber;
    return config;
}

+(instancetype)chineseConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitChinese;
    return config;
}

+(instancetype)letterCaseSensitiveConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitLetter;
    config.caseSensitive = YES;
    return config;
}

+(instancetype)letterCaseInsensitiveConfig{
    JobsOCGraphicCaptchaConfig *config = self.letterCaseSensitiveConfig;
    config.caseSensitive = NO;
    return config;
}

+(instancetype)mixedConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitNumber |
                            JobsOCGraphicCaptchaCharacterUnitLetter |
                            JobsOCGraphicCaptchaCharacterUnitChinese;
    config.caseSensitive = YES;
    return config;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.length = self.length;
    config.caseSensitive = self.caseSensitive;
    config.characterUnits = self.characterUnits;
    config.customCharacters = self.customCharacters.copy;
    return config;
}

@end
