//
//  TabBarControllerConfig.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/10/16.
//

#import "JobsTabBarItemConfig.h"

@interface JobsTabBarItemConfig ()

@end

@implementation JobsTabBarItemConfig

-(JobsRetJobsTabBarItemConfigByUIViewControllerBlock _Nonnull)byVc{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(UIViewController *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.vc = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.title = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByStrBlock _Nonnull)byLottieName{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.lottieName = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByImageBlock _Nonnull)byImageSelected{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.imageSelected = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByImageBlock _Nonnull)byImageUnselected{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(UIImage *_Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.imageUnselected = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByCGFloatBlock _Nonnull)byHumpOffsetY{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.humpOffsetY = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByNSUIntegerBlock _Nonnull)byTag{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.tag = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByCGFloatBlock _Nonnull)byTabBarItemWidth{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.tabBarItemWidth = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByCGFloatBlock _Nonnull)byXOffset{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.xOffset = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByCGFloatBlock _Nonnull)bySpacing{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(CGFloat data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.spacing = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByBOOLBlock _Nonnull)byNeedCheckLogin{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isNeedCheckLogin = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByBOOLBlock _Nonnull)byNotNeedCheckLogin{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isNotNeedCheckLogin = data;
        return self;
    };
}

-(JobsRetJobsTabBarItemConfigByBOOLBlock _Nonnull)byNeedJump{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarItemConfig *_Nullable(BOOL data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.isNeedjump = data;
        return self;
    };
}
#pragma mark —— lazyLoad
-(UIColor *)titleCorNormal{
    if (!_titleCorNormal) {
        _titleCorNormal = HEXCOLOR(0xB59E83);
    };return _titleCorNormal;
}

-(UIColor *)titleCorSelected{
    if (!_titleCorSelected) {
        _titleCorSelected = HEXCOLOR(0xB48B48);
    };return _titleCorSelected;
}

-(UIFont *)fontNormal{
    if (!_fontNormal) {
        //TODO
    };return _fontNormal;
}

-(UIFont *)fontSelected{
    if (!_fontSelected) {
        //TODO
    };return _fontSelected;
}

-(BOOL)isNotNeedCheckLogin{
    if (!_isNotNeedCheckLogin) {
        _isNotNeedCheckLogin = YES;
    };return _isNotNeedCheckLogin;
}

@end
