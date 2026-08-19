//
//  JobsAppDoorConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorConfig
@interface JobsAppDoorConfig (JobsPropertyDSLSetterAutogen_dfb7ac576d)
-(void)setBackgroundImageName:(NSString * _Nullable)data;
-(void)setBackgroundType:(JobsAppDoorBgType)data;
-(void)setCompactVideoResourceName:(NSString * _Nullable)data;
-(void)setNotchVideoResourceName:(NSString * _Nullable)data;
-(void)setRegisterConfig:(JobsAppDoorRegisterConfig * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorConfig

@implementation JobsAppDoorConfig
-(instancetype)init{
    if (self = [super init]) {
        _backgroundType = JobsAppDoorBgType_Image;
        _registerConfig = JobsAppDoorRegisterConfig.basicConfig();
        _backgroundImageName = @"bg_video";
        _notchVideoResourceName = @"iph_X.mp4";
        _compactVideoResourceName = @"非iph_X.mp4";
    };return self;
}

+(JobsRetIDByVoidBlock _Nonnull)defaultConfig{
    return ^id{
        return JobsAppDoorConfig.new;
    };
}

+(JobsRetIDByVoidBlock _Nonnull)fullConfig{
    return ^id{
        JobsAppDoorConfig *config = self.defaultConfig();
        config.byBackgroundType(JobsAppDoorBgType_Video);
        config.byRegisterConfig(JobsAppDoorRegisterConfig.fullConfig());
        return config;
    };
}

-(JobsRetNSUIntegerByVoidBlock _Nonnull)registerFieldCount{
    @jobs_weakify(self)
    return ^NSUInteger{
        @jobs_strongify(self)
        if (!self) return (NSUInteger){0};
        return 3 + (self.registerConfig.showsMobileBinding ? 2 : 0) + (self.registerConfig.showsGraphicCaptcha ? 1 : 0);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)registerContentHeight{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        NSUInteger fieldCount = self.registerFieldCount();
        CGFloat fieldsHeight = fieldCount * ThingsHeight;
        if (fieldCount > 1) fieldsHeight += (fieldCount - 1) * JobsWidth(12);
        return MAX(JobsWidth(394), JobsWidth(166) + fieldsHeight);
    };
}

-(JobsRetCGFloatByVoidBlock _Nonnull)registerContentY{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return MAX(JobsWidth(80), (JobsMainScreen_HEIGHT() - self.registerContentHeight()) / 2);
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorConfig *config = [[[self class] allocWithZone:zone] init];
    config.byBackgroundType(self.backgroundType);
    config.byRegisterConfig(self.registerConfig.copy);
    config.byBackgroundImageName(self.backgroundImageName.copy);
    config.byNotchVideoResourceName(self.notchVideoResourceName.copy);
    config.byCompactVideoResourceName(self.compactVideoResourceName.copy);
    return config;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorConfig
-(JobsRetJobsAppDoorConfigByJobsAppDoorBgTypeBlock _Nonnull)byBackgroundType{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorConfig * _Nullable(JobsAppDoorBgType data){
        @jobs_strongify(self)
        [self setBackgroundType:data];
        return self;
    };
}

-(JobsRetJobsAppDoorConfigByJobsAppDoorRegisterConfigBlock _Nonnull)byRegisterConfig{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorConfig * _Nullable(JobsAppDoorRegisterConfig * _Nullable data){
        @jobs_strongify(self)
        [self setRegisterConfig:data];
        return self;
    };
}

-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byBackgroundImageName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorConfig * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setBackgroundImageName:data];
        return self;
    };
}

-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byCompactVideoResourceName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorConfig * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCompactVideoResourceName:data];
        return self;
    };
}

-(JobsRetJobsAppDoorConfigByNSStringBlock _Nonnull)byNotchVideoResourceName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorConfig * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setNotchVideoResourceName:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorConfig
@end
