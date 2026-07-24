//
//  JobsAppDoorRegisterConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorRegisterConfig.h"

@implementation JobsAppDoorRegisterConfig
-(instancetype)init{
    if (self = [super init]) {
        _showsMobileBinding = NO;
        _showsGraphicCaptcha = NO;
        _graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.defaultConfig;
    };return self;
}

+(instancetype)basicConfig{
    return JobsAppDoorRegisterConfig.new;
}

+(instancetype)fullConfig{
    JobsAppDoorRegisterConfig *config = self.basicConfig;
    config.showsMobileBinding = YES;
    config.showsGraphicCaptcha = YES;
    config.graphicCaptchaConfig = JobsAppDoorGraphicCaptchaConfig.allCharactersConfig;
    return config;
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorRegisterConfig *config = [[[self class] allocWithZone:zone] init];
    config.showsMobileBinding = self.showsMobileBinding;
    config.showsGraphicCaptcha = self.showsGraphicCaptcha;
    config.graphicCaptchaConfig = self.graphicCaptchaConfig.copy;
    return config;
}

@end
