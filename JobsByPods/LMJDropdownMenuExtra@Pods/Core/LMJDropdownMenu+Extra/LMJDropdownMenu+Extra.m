//
//  LMJDropdownMenu+Extra.m
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LMJDropdownMenu+Extra.h"

@interface NSObject (JobsImageAccessor)

@property(nonatomic, strong, readonly, nullable) UIImage *img;

@end

@implementation LMJDropdownMenu (Extra)
-(JobsRetBtnByVoidBlock _Nonnull)great{
    @jobs_weakify(self)
    return ^__kindof UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        Ivar ivar = class_getInstanceVariable(LMJDropdownMenu.class, "mainBtn");
        return ivar ? object_getIvar(self, ivar) : nil;
    };
}

-(jobsByVoidBlock _Nonnull)greatAtEmpty{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIButton *btn = self.great();
        btn.byImage(@"空白图".img);
        if (@available(iOS 15.0, *)) {
            UIButtonConfiguration *config = btn.configuration ?: UIButtonConfiguration.plainButtonConfiguration;
            config.byImagePlacement(NSDirectionalRectEdgeTrailing);
            config.byImagePadding(5.0);
            btn.byConfiguration(config);
        }
    };
}

@end
