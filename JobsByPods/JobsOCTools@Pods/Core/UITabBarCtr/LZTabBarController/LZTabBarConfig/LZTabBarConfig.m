//
//  LZTabBarConfig.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LZTabBarConfig.h"

@implementation LZTabBarConfig

#define LZTabBarConfigObjectDSL(_method_, _property_, _block_type_, _input_type_) \
-(_block_type_ _Nonnull)_method_{ \
    @jobs_weakify(self) \
    return ^__kindof LZTabBarConfig *_Nullable(_input_type_ _Nullable value){ \
        @jobs_strongify(self) \
        self._property_ = value; \
        return self; \
    }; \
}

LZTabBarConfigObjectDSL(byViewControllers, viewControllers, JobsRetLZTabBarConfigByArrBlock, NSArray *)
LZTabBarConfigObjectDSL(byTitles, titles, JobsRetLZTabBarConfigByArrBlock, NSArray *)
LZTabBarConfigObjectDSL(bySelectedImages, selectedImages, JobsRetLZTabBarConfigByArrBlock, NSArray *)
LZTabBarConfigObjectDSL(byNormalImages, normalImages, JobsRetLZTabBarConfigByArrBlock, NSArray *)
LZTabBarConfigObjectDSL(bySelectedColor, selectedColor, JobsRetLZTabBarConfigByCorBlock, UIColor *)
LZTabBarConfigObjectDSL(byNormalColor, normalColor, JobsRetLZTabBarConfigByCorBlock, UIColor *)

#undef LZTabBarConfigObjectDSL

-(JobsRetLZTabBarConfigByBOOLBlock _Nonnull)byIsNavigation{
    @jobs_weakify(self)
    return ^__kindof LZTabBarConfig *_Nullable(BOOL value){
        @jobs_strongify(self)
        self.isNavigation = value;
        return self;
    };
}

- (instancetype)init {
    if (self = [super init]) {
        self
            .byIsNavigation(YES)
            .byNormalColor(JobsGrayColor)
            .bySelectedColor(JobsRedColor);
    };return self;
}

@end
