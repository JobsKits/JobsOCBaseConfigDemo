//
//  UIView+UIBackgroundConfig.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+UIBackgroundConfig.h"

@implementation UIView (UIBackgroundConfig)
#pragma mark —— Prop_strong()UIBackgroundConfiguration *backgroundConfig;
JobsKey(_backgroundConfig)
@dynamic backgroundConfig;
-(UIBackgroundConfiguration *)backgroundConfig{
    UIBackgroundConfiguration *BackgroundConfig = Jobs_getAssociatedObject(_backgroundConfig);
    if (!BackgroundConfig) {
        BackgroundConfig = UIBackgroundConfiguration.listPlainHeaderFooterConfiguration;
        BackgroundConfig.byImage(@"设置_背景1".img);
        BackgroundConfig.backgroundInsets = NSDirectionalEdgeInsetsMake(JobsWidth(3),
                                                                        JobsWidth(15),
                                                                        JobsWidth(3),
                                                                        JobsWidth(15));
        Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundConfig, BackgroundConfig);
    };return BackgroundConfig;
}

-(void)setBackgroundConfig:(UIBackgroundConfiguration *)backgroundConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_backgroundConfig, backgroundConfig);
}

@end

