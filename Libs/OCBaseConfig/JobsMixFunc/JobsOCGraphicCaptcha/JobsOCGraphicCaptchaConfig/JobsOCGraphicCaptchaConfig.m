//
//  JobsOCGraphicCaptchaConfig.m
//  JobsOCGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsOCGraphicCaptchaConfig.h"

@implementation JobsOCGraphicCaptchaConfig

-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.length = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByBOOLBlock _Nonnull)byCaseSensitive{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.caseSensitive = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byCharacterUnits{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.characterUnits = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByUIntegerBlock _Nonnull)byMixedGroupCount{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.mixedGroupCount = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByArrBlock _Nonnull)byCustomCharacters{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.customCharacters = data;
        return self;
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByArrBlock _Nonnull)byCustomCharacterGroups{
    @jobs_weakify(self)
    return ^__kindof JobsOCGraphicCaptchaConfig *_Nullable(NSArray *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.customCharacterGroups = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterUnits = JobsOCGraphicCaptchaCharacterUnitDefault;
        _mixedGroupCount = 0;
    };return self;
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)defaultConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        return JobsOCGraphicCaptchaConfig.new;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)numberConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsOCGraphicCaptchaCharacterUnitNumber);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)chineseConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsOCGraphicCaptchaCharacterUnitChinese);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)simplifiedChineseConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsOCGraphicCaptchaCharacterUnitSimplifiedChinese);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)traditionalChineseConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsOCGraphicCaptchaCharacterUnitTraditionalChinese);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseSensitiveConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsOCGraphicCaptchaCharacterUnitLetter);
        config.byCaseSensitive(YES);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseInsensitiveConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.letterCaseSensitiveConfig();
        config.byCaseSensitive(NO);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)mixedConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        return self.fullMixedConfig();
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)twoMixedConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.defaultConfig();
        config.characterUnits = JobsOCGraphicCaptchaCharacterUnitNumber |
                                JobsOCGraphicCaptchaCharacterUnitLetter |
                                JobsOCGraphicCaptchaCharacterUnitChinese;
        config.byCaseSensitive(YES);
        config.byMixedGroupCount(2);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)threeMixedConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(3);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)fourMixedConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(4);
        return config;
    };
}

+(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)fullMixedConfig{
    return ^__kindof JobsOCGraphicCaptchaConfig *{
        JobsOCGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(5);
        return config;
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsOCGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.byLength(self.length);
    config.byCaseSensitive(self.caseSensitive);
    config.byCharacterUnits(self.characterUnits);
    config.byMixedGroupCount(self.mixedGroupCount);
    config.byCustomCharacters(self.customCharacters.copy);
    config.byCustomCharacterGroups(self.customCharacterGroups.copy);
    return config;
}

@end
