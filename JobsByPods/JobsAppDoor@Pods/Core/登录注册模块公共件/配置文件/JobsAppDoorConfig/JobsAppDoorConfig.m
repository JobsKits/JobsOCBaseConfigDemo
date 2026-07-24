//
//  JobsAppDoorConfig.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年7月19日，星期日.
//

#import "JobsAppDoorConfig.h"

@implementation JobsAppDoorConfig
-(instancetype)init{
    if (self = [super init]) {
        _backgroundType = JobsAppDoorBgType_Image;
        _registerConfig = JobsAppDoorRegisterConfig.basicConfig;
        _backgroundImageName = @"bg_video";
        _notchVideoResourceName = @"iph_X.mp4";
        _compactVideoResourceName = @"非iph_X.mp4";
    };return self;
}

+(instancetype)defaultConfig{
    return JobsAppDoorConfig.new;
}

+(instancetype)fullConfig{
    JobsAppDoorConfig *config = self.defaultConfig;
    config.backgroundType = JobsAppDoorBgType_Video;
    config.registerConfig = JobsAppDoorRegisterConfig.fullConfig;
    return config;
}

-(NSUInteger)registerFieldCount{
    return 3 + (self.registerConfig.showsMobileBinding ? 2 : 0) + (self.registerConfig.showsGraphicCaptcha ? 1 : 0);
}

-(CGFloat)registerContentHeight{
    NSUInteger fieldCount = self.registerFieldCount;
    CGFloat fieldsHeight = fieldCount * ThingsHeight;
    if (fieldCount > 1) fieldsHeight += (fieldCount - 1) * JobsWidth(12);
    return MAX(JobsWidth(394), JobsWidth(166) + fieldsHeight);
}

-(CGFloat)registerContentY{
    return MAX(JobsWidth(80), (JobsMainScreen_HEIGHT() - self.registerContentHeight) / 2);
}

-(id)copyWithZone:(NSZone *)zone{
    JobsAppDoorConfig *config = [[[self class] allocWithZone:zone] init];
    config.backgroundType = self.backgroundType;
    config.registerConfig = self.registerConfig.copy;
    config.backgroundImageName = self.backgroundImageName.copy;
    config.notchVideoResourceName = self.notchVideoResourceName.copy;
    config.compactVideoResourceName = self.compactVideoResourceName.copy;
    return config;
}

@end
