//
//  SYSAlertControllerConfig+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "SYSAlertControllerConfig+DSL.h"

@implementation SYSAlertControllerConfig (DSL)

#pragma mark —— 来自 SYSAlertControllerConfig
-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byMessage{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byIsSeparateStyle{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.isSeparateStyle = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(UIViewController * data))byTargetVC{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(UIViewController * data) {
        @jobs_strongify(self)
        self.targetVC = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(id data))byFuncInWhere{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(id data) {
        @jobs_strongify(self)
        self.funcInWhere = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byAnimated{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.animated = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(UIControl * data))bySender{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(UIControl * data) {
        @jobs_strongify(self)
        self.sender = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString*> * data))byBtnTitleArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(NSArray <NSString*> * data) {
        @jobs_strongify(self)
        self.btnTitleArr = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString*> * data))byAlertBtnActionArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(NSArray <NSString*> * data) {
        @jobs_strongify(self)
        self.alertBtnActionArr = data;
        return self;
    };
}

-(__kindof SYSAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray * data))byParametersArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nonnull(NSArray * data) {
        @jobs_strongify(self)
        self.parametersArr = data;
        return self;
    };
}

@end
