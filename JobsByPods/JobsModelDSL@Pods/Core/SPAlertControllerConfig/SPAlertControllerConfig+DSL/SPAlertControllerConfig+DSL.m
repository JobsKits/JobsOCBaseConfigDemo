//
//  SPAlertControllerConfig+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "SPAlertControllerConfig+DSL.h"

@implementation SPAlertControllerConfig (DSL)

-(JobsRetSPAlertControllerConfigByNSObject_SPAlertControllerInitTypeBlock _Nonnull)bySPAlertControllerInitType{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSObject_SPAlertControllerInitType data) {
        @jobs_strongify(self)
        self.SPAlertControllerInitType = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByStrBlock _Nonnull)byMessage{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.message = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomAlertView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.customAlertView = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomHeaderView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.customHeaderView = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByUIViewPointerBlock _Nonnull)byCustomActionSequenceView{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(UIView * _Nullable data) {
        @jobs_strongify(self)
        self.customActionSequenceView = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSIntegerBlock _Nonnull)byPreferredStyle{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.preferredStyle = (SPAlertControllerStyle)data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSIntegerBlock _Nonnull)byAnimationType{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.animationType = (SPAlertAnimationType)data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByUIViewControllerPointerBlock _Nonnull)byTargetVC{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(UIViewController * _Nullable data) {
        @jobs_strongify(self)
        self.targetVC = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByIDBlock _Nonnull)byFuncInWhere{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.funcInWhere = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByBOOLBlock _Nonnull)byAnimated{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.animated = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertActionTitleArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSArray <NSString *> * _Nullable data) {
        @jobs_strongify(self)
        self.alertActionTitleArr = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSArrayNSNumberPointerPointerBlock _Nonnull)byAlertActionStyleArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSArray <NSNumber *> * _Nullable data) {
        @jobs_strongify(self)
        self.alertActionStyleArr = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSArrayNSStringPointerPointerBlock _Nonnull)byAlertBtnActionArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSArray <NSString *> * _Nullable data) {
        @jobs_strongify(self)
        self.alertBtnActionArr = data;
        return self;
    };
}

-(JobsRetSPAlertControllerConfigByNSArrayNSMutableArrayPointerPointerBlock _Nonnull)byParametersArr{
    @jobs_weakify(self)
    return ^__kindof SPAlertControllerConfig *_Nullable(NSArray <NSMutableArray *> * _Nullable data) {
        @jobs_strongify(self)
        self.parametersArr = data;
        return self;
    };
}

@end
