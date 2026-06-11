//
//  UIMenuController+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UIMenuController+DSL.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation UIMenuController (DSL)

#pragma mark —— Singleton
+(JobsRetMenuControllerByVoidBlock _Nonnull)bySharedMenuController{
    return ^__kindof UIMenuController *_Nullable(void){
        return UIMenuController.sharedMenuController;
    };
}
#pragma mark —— Properties
-(JobsRetMenuControllerByBOOLBlock _Nonnull)byMenuVisible{
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.menuVisible = data;
        return self;
    };
}

-(JobsRetMenuControllerByArrBlock _Nonnull)byMenuItems{
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(__kindof NSArray<UIMenuItem *> *_Nullable data){
        @jobs_strongify(self)
        self.menuItems = data;
        return self;
    };
}

-(JobsRetMenuControllerByArrowDirectionBlock _Nonnull)byArrowDirection{
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(UIMenuControllerArrowDirection data){
        @jobs_strongify(self)
        self.arrowDirection = data;
        return self;
    };
}
#pragma mark —— Readonly Properties
-(JobsRetFrameByVoidBlock _Nonnull)byGetMenuFrame{
    @jobs_weakify(self)
    return ^CGRect(void){
        @jobs_strongify(self)
        return self.menuFrame;
    };
}
#pragma mark —— Methods
-(JobsRetMenuControllerByVoidBlock _Nonnull)byUpdate{
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(void){
        @jobs_strongify(self)
        [self update];
        return self;
    };
}

-(JobsRetMenuControllerByVoidBlock _Nonnull)byHideMenu API_AVAILABLE(ios(13.0)){
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(void){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)){
            [self hideMenu];
        };return self;
    };
}

-(JobsRetMenuControllerByViewBlock _Nonnull)byHideMenuFromView API_AVAILABLE(ios(13.0)){
    @jobs_weakify(self)
    return ^__kindof UIMenuController *_Nullable(__kindof UIView *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 13.0, *)){
            [self hideMenuFromView:data];
        };return self;
    };
}

@end

#pragma clang diagnostic pop
