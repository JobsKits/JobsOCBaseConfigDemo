//
//  SPAlertControllerConfig+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "SPAlertControllerConfig+DSL.h"

@implementation SPAlertControllerConfig (DSL)

#pragma mark —— 来自 SPAlertControllerConfig
-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSObject_SPAlertControllerInitType data))bySPAlertControllerInitType{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSObject_SPAlertControllerInitType data) {
        @jobs_strongify(self)
        self.SPAlertControllerInitType = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSString * data))byMessage{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomAlertView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.customAlertView = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomHeaderView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.customHeaderView = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIView * data))byCustomActionSequenceView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(UIView * data) {
        @jobs_strongify(self)
        self.customActionSequenceView = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(SPAlertControllerStyle data))byPreferredStyle{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(SPAlertControllerStyle data) {
        @jobs_strongify(self)
        self.preferredStyle = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(SPAlertAnimationType data))byAnimationType{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(SPAlertAnimationType data) {
        @jobs_strongify(self)
        self.animationType = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(UIViewController * data))byTargetVC{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(UIViewController * data) {
        @jobs_strongify(self)
        self.targetVC = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(id data))byFuncInWhere{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(id data) {
        @jobs_strongify(self)
        self.funcInWhere = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(BOOL data))byAnimated{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.animated = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byAlertActionTitleArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.alertActionTitleArr = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSNumber *> * data))byAlertActionStyleArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSArray <NSNumber *> * data) {
        @jobs_strongify(self)
        self.alertActionStyleArr = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSString *> * data))byAlertBtnActionArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSArray <NSString *> * data) {
        @jobs_strongify(self)
        self.alertBtnActionArr = data;
        return self;
    };
}

-(__kindof SPAlertControllerConfig *_Nonnull (^ _Nonnull)(NSArray <NSMutableArray *> * data))byParametersArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nonnull(NSArray <NSMutableArray *> * data) {
        @jobs_strongify(self)
        self.parametersArr = data;
        return self;
    };
}

@end
