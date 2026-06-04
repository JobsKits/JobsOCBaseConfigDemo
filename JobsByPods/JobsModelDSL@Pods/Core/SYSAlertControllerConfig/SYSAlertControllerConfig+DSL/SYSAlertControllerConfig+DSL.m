//
//  SYSAlertControllerConfig+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "SYSAlertControllerConfig+DSL.h"

@implementation SYSAlertControllerConfig (DSL)

-(JobsRetSYSAlertControllerConfigByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByStrBlock _Nonnull)byMessage{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByBOOLBlock _Nonnull)byIsSeparateStyle{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.isSeparateStyle = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByUIViewControllerPointerBlock _Nonnull)byTargetVC{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.targetVC = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByIDBlock _Nonnull)byFuncInWhere{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.funcInWhere = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByBOOLBlock _Nonnull)byAnimated{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.animated = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByUIControlPointerBlock _Nonnull)bySender{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(UIControl * _Nullable data) {
        @jobs_strongify(self)
        self.sender = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byBtnTitleArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(NSArray <NSString *> * _Nullable data) {
        @jobs_strongify(self)
        self.btnTitleArr = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertBtnActionArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(NSArray <NSString *> * _Nullable data) {
        @jobs_strongify(self)
        self.alertBtnActionArr = data;
        return self;
    };
}

-(JobsRetSYSAlertControllerConfigByNSArrayPointerBlock _Nonnull)byParametersArr{
    @jobs_weakify(self)
    return ^__kindof SYSAlertControllerConfig *_Nullable(NSArray * _Nullable data) {
        @jobs_strongify(self)
        self.parametersArr = data;
        return self;
    };
}

@end
