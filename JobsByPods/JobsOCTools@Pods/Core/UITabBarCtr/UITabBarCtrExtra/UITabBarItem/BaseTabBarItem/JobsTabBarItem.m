//
//  JobsTabBarItem.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTabBarItem.h"

#if __has_include(<JobsByOCPods/UITabBarItem+Extra.h>)
#import <JobsByOCPods/UITabBarItem+Extra.h>
#else
#import "UITabBarItem+Extra.h"
#endif

@interface JobsTabBarItem ()

Prop_strong()JobsTabBarItemConfig *tabBarControllerConfig;

@end

@implementation JobsTabBarItem

+(JobsReturnTabBarItemByConfigBlock _Nonnull)initByConfig{
    return ^__kindof UITabBarItem *_Nullable(__kindof JobsTabBarItemConfig *_Nullable data){
        return [self.class.alloc initWithConfig:data];
    };
}

-(instancetype)initWithConfig:(JobsTabBarItemConfig *_Nullable)config{
    if (self = [super init]) {
        if (config) {
            self.tabBarControllerConfig = config;
            
            self.image = [config.imageUnselected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.selectedImage = [config.imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            self.title = config.title;
            
            self.titleTextAttributesByNormalState(config.titleCorNormal);
            self.titleTextAttributesBySelectedState(config.titleCorNormal);
        }
    }return self;
}

@end
