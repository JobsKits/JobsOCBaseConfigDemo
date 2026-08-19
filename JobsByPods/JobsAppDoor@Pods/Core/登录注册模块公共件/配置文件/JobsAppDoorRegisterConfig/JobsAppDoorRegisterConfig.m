//
//  JobsAppDoorRegisterConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorRegisterConfig.h"

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorRegisterConfig
@interface JobsAppDoorRegisterConfig (JobsPropertyDSLSetterAutogen_ca041c4354)
-(void)setGraphicCaptchaConfig:(JobsAppDoorGraphicCaptchaConfig * _Nullable)data;
-(void)setShowsGraphicCaptcha:(BOOL)data;
-(void)setShowsMobileBinding:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorRegisterConfig

@implementation JobsAppDoorRegisterConfig
-(instancetype)init{
    if (self = [super init]) {
        _showsMobileBinding = NO;
        _showsGraphicCaptcha = NO;
        _graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.defaultConfig();
    };return self;
}

+(JobsRetIDByVoidBlock _Nonnull)basicConfig{
    return ^id{
        return JobsAppDoorRegisterConfig.new;
    };
}

+(JobsRetIDByVoidBlock _Nonnull)fullConfig{
    return ^id{
        JobsAppDoorRegisterConfig *config = self.basicConfig();
        config.byShowsMobileBinding(YES);
        config.byShowsGraphicCaptcha(YES);
        config.byGraphicCaptchaConfig(JobsAppDoorGraphicCaptchaConfig.allCharactersConfig());
        return config;
    };
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorRegisterConfig *config = [[[self class] allocWithZone:zone] init];
    config.byShowsMobileBinding(self.showsMobileBinding);
    config.byShowsGraphicCaptcha(self.showsGraphicCaptcha);
    config.byGraphicCaptchaConfig(self.graphicCaptchaConfig.copy);
    return config;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorRegisterConfig
-(JobsRetJobsAppDoorRegisterConfigByBOOLBlock _Nonnull)byShowsGraphicCaptcha{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorRegisterConfig * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShowsGraphicCaptcha:data];
        return self;
    };
}

-(JobsRetJobsAppDoorRegisterConfigByBOOLBlock _Nonnull)byShowsMobileBinding{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorRegisterConfig * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setShowsMobileBinding:data];
        return self;
    };
}

-(JobsRetJobsAppDoorRegisterConfigByJobsAppDoorGraphicCaptchaConfigBlock _Nonnull)byGraphicCaptchaConfig{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorRegisterConfig * _Nullable(JobsAppDoorGraphicCaptchaConfig * _Nullable data){
        @jobs_strongify(self)
        [self setGraphicCaptchaConfig:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorRegisterConfig
@end
