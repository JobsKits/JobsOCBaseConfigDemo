//
//  JobsAppDoorGraphicCaptchaConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorGraphicCaptchaConfig.h"

@implementation JobsAppDoorGraphicCaptchaConfig
-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterTypes = JobsAppDoorGraphicCaptchaCharacterTypeDefault;
    };return self;
}

+(instancetype)defaultConfig{
    return JobsAppDoorGraphicCaptchaConfig.new;
}

+(instancetype)numberAndEnglishConfig{
    return self.defaultConfig;
}

+(instancetype)numberAndChineseConfig{
    JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterTypes = JobsAppDoorGraphicCaptchaCharacterTypeNumber | JobsAppDoorGraphicCaptchaCharacterTypeChinese;
    return config;
}

+(instancetype)englishAndChineseConfig{
    JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterTypes = JobsAppDoorGraphicCaptchaCharacterTypeEnglish | JobsAppDoorGraphicCaptchaCharacterTypeChinese;
    return config;
}

+(instancetype)allCharactersConfig{
    JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig;
    config.characterTypes = JobsAppDoorGraphicCaptchaCharacterTypeAll;
    return config;
}

-(JobsOCGraphicCaptchaConfig *)resolvedCaptchaConfig{
    JobsAppDoorGraphicCaptchaCharacterType types = self.characterTypes ? : JobsAppDoorGraphicCaptchaCharacterTypeDefault;
    NSMutableArray<NSArray<NSString *> *> *groups = NSMutableArray.array;
    if (types & JobsAppDoorGraphicCaptchaCharacterTypeNumber) {
        [groups addObject:JobsOCGraphicCaptchaGenerator.numberCharacters];
    }
    if (types & JobsAppDoorGraphicCaptchaCharacterTypeEnglish) {
        NSMutableArray<NSString *> *englishCharacters = NSMutableArray.array;
        [englishCharacters addObjectsFromArray:JobsOCGraphicCaptchaGenerator.lowercaseLetterCharacters];
        [englishCharacters addObjectsFromArray:JobsOCGraphicCaptchaGenerator.uppercaseLetterCharacters];
        [groups addObject:englishCharacters.copy];
    }
    if (types & JobsAppDoorGraphicCaptchaCharacterTypeChinese) {
        [groups addObject:JobsOCGraphicCaptchaGenerator.chineseCharacters];
    }
    JobsOCGraphicCaptchaConfig *config = JobsOCGraphicCaptchaConfig.defaultConfig;
    config.length = MAX(self.length, groups.count);
    config.caseSensitive = self.caseSensitive;
    config.customCharacterGroups = groups.copy;
    config.mixedGroupCount = groups.count;
    return config;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.length = self.length;
    config.caseSensitive = self.caseSensitive;
    config.characterTypes = self.characterTypes;
    return config;
}

@end
