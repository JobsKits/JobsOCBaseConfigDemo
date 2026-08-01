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
        _mixedGroupCount = 0;
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

+(instancetype)simplifiedChineseConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese;
    return config;
}

+(instancetype)traditionalChineseConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitTraditionalChinese;
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
    return self.fullMixedConfig;
}

+(instancetype)twoMixedConfig{
    JobsOCGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsOCGraphicCaptchaCharacterUnitNumber |
                            JobsOCGraphicCaptchaCharacterUnitLetter |
                            JobsOCGraphicCaptchaCharacterUnitChinese;
    config.caseSensitive = YES;
    config.mixedGroupCount = 2;
    return config;
}

+(instancetype)threeMixedConfig{
    JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig;
    config.mixedGroupCount = 3;
    return config;
}

+(instancetype)fourMixedConfig{
    JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig;
    config.mixedGroupCount = 4;
    return config;
}

+(instancetype)fullMixedConfig{
    JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig;
    config.mixedGroupCount = 5;
    return config;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.length = self.length;
    config.caseSensitive = self.caseSensitive;
    config.characterUnits = self.characterUnits;
    config.mixedGroupCount = self.mixedGroupCount;
    config.customCharacters = self.customCharacters.copy;
    config.customCharacterGroups = self.customCharacterGroups.copy;
    return config;
}

@end
