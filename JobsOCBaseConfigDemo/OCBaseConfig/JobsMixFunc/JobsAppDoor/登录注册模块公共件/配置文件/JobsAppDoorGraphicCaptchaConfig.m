//
//  JobsAppDoorGraphicCaptchaConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorGraphicCaptchaConfig.h"

@implementation JobsAppDoorGraphicCaptchaConfig
-(JobsRetJobsAppDoorGraphicCaptchaConfigByNSUIntegerBlock _Nonnull)byLength{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.length = data;
        return self;
    };
}

-(JobsRetJobsAppDoorGraphicCaptchaConfigByBOOLBlock _Nonnull)byCaseSensitive{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.caseSensitive = data;
        return self;
    };
}

-(JobsRetJobsAppDoorGraphicCaptchaConfigByCharacterTypeBlock _Nonnull)byCharacterTypes{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *_Nullable(JobsAppDoorGraphicCaptchaCharacterType data){
        @jobs_strongify(self)
        self.characterTypes = data;
        return self;
    };
}

-(instancetype)init{
    if (self = [super init]) {
        _length = 4;
        _caseSensitive = YES;
        _characterTypes = JobsAppDoorGraphicCaptchaCharacterTypeDefault;
    };return self;
}

+(JobsRetJobsAppDoorGraphicCaptchaConfigByVoidBlock _Nonnull)defaultConfig{
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *{
        return JobsAppDoorGraphicCaptchaConfig.new;
    };
}

+(JobsRetJobsAppDoorGraphicCaptchaConfigByVoidBlock _Nonnull)numberAndEnglishConfig{
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *{
        return self.defaultConfig();
    };
}

+(JobsRetJobsAppDoorGraphicCaptchaConfigByVoidBlock _Nonnull)numberAndChineseConfig{
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *{
        JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig();
        return config.byCharacterTypes(JobsAppDoorGraphicCaptchaCharacterTypeNumber | JobsAppDoorGraphicCaptchaCharacterTypeChinese);
    };
}

+(JobsRetJobsAppDoorGraphicCaptchaConfigByVoidBlock _Nonnull)englishAndChineseConfig{
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *{
        JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig();
        return config.byCharacterTypes(JobsAppDoorGraphicCaptchaCharacterTypeEnglish | JobsAppDoorGraphicCaptchaCharacterTypeChinese);
    };
}

+(JobsRetJobsAppDoorGraphicCaptchaConfigByVoidBlock _Nonnull)allCharactersConfig{
    return ^__kindof JobsAppDoorGraphicCaptchaConfig *{
        JobsAppDoorGraphicCaptchaConfig *config = self.defaultConfig();
        return config.byCharacterTypes(JobsAppDoorGraphicCaptchaCharacterTypeAll);
    };
}

-(JobsRetJobsOCGraphicCaptchaConfigByVoidBlock _Nonnull)resolvedCaptchaConfig{
    @jobs_weakify(self)
    return ^JobsOCGraphicCaptchaConfig *{
        @jobs_strongify(self)
        if (!self) return nil;
        JobsAppDoorGraphicCaptchaCharacterType types = self.characterTypes ? : JobsAppDoorGraphicCaptchaCharacterTypeDefault;
        NSMutableArray<NSArray<NSString *> *> *groups = NSMutableArray.array;
        if (types & JobsAppDoorGraphicCaptchaCharacterTypeNumber) {
            [groups addObject:JobsOCGraphicCaptchaGenerator.numberCharacters()];
        }
        if (types & JobsAppDoorGraphicCaptchaCharacterTypeEnglish) {
            NSMutableArray<NSString *> *englishCharacters = NSMutableArray.array;
            [englishCharacters addObjectsFromArray:JobsOCGraphicCaptchaGenerator.lowercaseLetterCharacters()];
            [englishCharacters addObjectsFromArray:JobsOCGraphicCaptchaGenerator.uppercaseLetterCharacters()];
            [groups addObject:englishCharacters.copy];
        }
        if (types & JobsAppDoorGraphicCaptchaCharacterTypeChinese) {
            [groups addObject:JobsOCGraphicCaptchaGenerator.chineseCharacters()];
        }
        JobsOCGraphicCaptchaConfig *config = JobsOCGraphicCaptchaConfig.defaultConfig();
        config.byLength(MAX(self.length, groups.count))
            .byCaseSensitive(self.caseSensitive)
            .byCustomCharacterGroups(groups.copy)
            .byMixedGroupCount(groups.count);
        return config;
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorGraphicCaptchaConfig *config = [[[self class] allocWithZone:zone] init];
    return config.byLength(self.length)
        .byCaseSensitive(self.caseSensitive)
        .byCharacterTypes(self.characterTypes);
}

@end
