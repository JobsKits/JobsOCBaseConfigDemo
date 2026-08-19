//
//  JobsTabBarItem.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTabBarItem.h"

@interface JobsTabBarItem ()

Prop_strong()JobsTabBarItemConfig *tabBarControllerConfig;

@end

@implementation JobsTabBarItem
-(JobsRetJobsTabBarItemByImageBlock _Nonnull)byImage{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItem *_Nullable(UIImage *_Nullable image){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setImage:image];
        return self;
    };
}

+(JobsRetTabBarItemByConfigBlock _Nonnull)initByConfig{
    return ^__kindof UITabBarItem *_Nullable(__kindof JobsTabBarItemConfig *_Nullable data){
        return [self.class.alloc initWithConfig:data];
    };
}

-(instancetype)initWithConfig:(JobsTabBarItemConfig *_Nullable)config{
    if (self = [super init]) {
        if (config) {
            self.tabBarControllerConfig = config;
            self.byImage([config.imageUnselected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
            self.selectedImage = [config.imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.byTitle(config.title);
            self.titleTextAttributesByNormalState(config.titleCorNormal);
            self.titleTextAttributesBySelectedState(config.titleCorNormal);
        }
    };return self;
}

@end
