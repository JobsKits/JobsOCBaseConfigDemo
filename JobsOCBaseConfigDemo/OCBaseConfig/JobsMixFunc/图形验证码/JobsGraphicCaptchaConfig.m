//
//  JobsGraphicCaptchaConfig.m
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaConfig.h"

@implementation JobsGraphicCaptchaConfig

-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterUnits = JobsGraphicCaptchaCharacterUnitDefault;
        _mixedGroupCount = 0;
    };return self;
}

+(instancetype)defaultConfig{
    return JobsGraphicCaptchaConfig.new;
}

+(instancetype)numberConfig{
    JobsGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsGraphicCaptchaCharacterUnitNumber;
    return config;
}

+(instancetype)chineseConfig{
    JobsGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsGraphicCaptchaCharacterUnitChinese;
    return config;
}

+(instancetype)letterCaseSensitiveConfig{
    JobsGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsGraphicCaptchaCharacterUnitLetter;
    config.caseSensitive = YES;
    return config;
}

+(instancetype)letterCaseInsensitiveConfig{
    JobsGraphicCaptchaConfig *config = self.letterCaseSensitiveConfig;
    config.caseSensitive = NO;
    return config;
}

+(instancetype)mixedConfig{
    return self.fullMixedConfig;
}

+(instancetype)twoMixedConfig{
    JobsGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterUnits = JobsGraphicCaptchaCharacterUnitNumber |
                            JobsGraphicCaptchaCharacterUnitLetter |
                            JobsGraphicCaptchaCharacterUnitChinese;
    config.caseSensitive = YES;
    config.mixedGroupCount = 2;
    return config;
}

+(instancetype)threeMixedConfig{
    JobsGraphicCaptchaConfig *config = self.twoMixedConfig;
    config.mixedGroupCount = 3;
    return config;
}

+(instancetype)fullMixedConfig{
    JobsGraphicCaptchaConfig *config = self.twoMixedConfig;
    config.mixedGroupCount = 4;
    return config;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.length = self.length;
    config.caseSensitive = self.caseSensitive;
    config.characterUnits = self.characterUnits;
    config.mixedGroupCount = self.mixedGroupCount;
    config.customCharacters = self.customCharacters.copy;
    return config;
}

@end
