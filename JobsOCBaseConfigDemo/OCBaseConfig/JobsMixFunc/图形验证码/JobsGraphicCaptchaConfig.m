//
//  JobsGraphicCaptchaConfig.m
//  JobsGraphicCaptcha
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsGraphicCaptchaConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsGraphicCaptchaConfig
@interface JobsGraphicCaptchaConfig (JobsPropertyDSLSetterAutogen_f79c320f3b)
-(void)setLength:(NSUInteger)data;
-(void)setCaseSensitive:(BOOL)data;
-(void)setCharacterUnits:(JobsGraphicCaptchaCharacterUnit)data;
-(void)setCustomCharacters:(NSArray<NSString *> * _Nullable)data;
-(void)setMixedGroupCount:(NSUInteger)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsGraphicCaptchaConfig

@implementation JobsGraphicCaptchaConfig
-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterUnits = JobsGraphicCaptchaCharacterUnitDefault;
        _mixedGroupCount = 0;
    };return self;
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)defaultConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        return JobsGraphicCaptchaConfig.new;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)numberConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsGraphicCaptchaCharacterUnitNumber);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)chineseConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsGraphicCaptchaCharacterUnitChinese);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)simplifiedChineseConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsGraphicCaptchaCharacterUnitSimplifiedChinese);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)traditionalChineseConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsGraphicCaptchaCharacterUnitTraditionalChinese);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseSensitiveConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.byCharacterUnits(JobsGraphicCaptchaCharacterUnitLetter);
        config.byCaseSensitive(YES);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)letterCaseInsensitiveConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.letterCaseSensitiveConfig();
        config.byCaseSensitive(NO);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)mixedConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        return self.fullMixedConfig();
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)twoMixedConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.defaultConfig();
        config.characterUnits = JobsGraphicCaptchaCharacterUnitNumber |
                                JobsGraphicCaptchaCharacterUnitLetter |
                                JobsGraphicCaptchaCharacterUnitChinese;
        config.byCaseSensitive(YES);
        config.byMixedGroupCount(2);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)threeMixedConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(3);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)fourMixedConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(4);
        return config;
    };
}

+(JobsRetJobsGraphicCaptchaConfigByVoidBlock _Nonnull)fullMixedConfig{
    return ^__kindof JobsGraphicCaptchaConfig *{
        JobsGraphicCaptchaConfig *config = self.twoMixedConfig();
        config.byMixedGroupCount(5);
        return config;
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    config.byLength(self.length);
    config.byCaseSensitive(self.caseSensitive);
    config.byCharacterUnits(self.characterUnits);
    config.byMixedGroupCount(self.mixedGroupCount);
    config.byCustomCharacters(self.customCharacters.copy);
    return config;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsGraphicCaptchaConfig
-(JobsRetJobsGraphicCaptchaConfigByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setLength:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaConfigByBOOLBlock _Nonnull)byCaseSensitive{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaConfig * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setCaseSensitive:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaConfigByJobsGraphicCaptchaCharacterUnitBlock _Nonnull)byCharacterUnits{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaConfig * _Nullable(JobsGraphicCaptchaCharacterUnit data){
        @jobs_strongify(self)
        [self setCharacterUnits:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaConfigByNSArrayNSStringBlock _Nonnull)byCustomCharacters{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaConfig * _Nullable(NSArray<NSString *> * _Nullable data){
        @jobs_strongify(self)
        [self setCustomCharacters:data];
        return self;
    };
}

-(JobsRetJobsGraphicCaptchaConfigByNSUIntegerBlock _Nonnull)byMixedGroupCount{
    @jobs_weakify(self)
    return ^__kindof JobsGraphicCaptchaConfig * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setMixedGroupCount:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsGraphicCaptchaConfig
@end
