//
//  GTCaptcha4Model+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "GTCaptcha4Model+DSL.h"

@implementation GTCaptcha4Model (DSL)
-(JobsRetGTCaptcha4ModelByGTCaptcha4SessionPointerBlock _Nonnull)byCaptcha4Session{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nullable(GTCaptcha4Session * _Nullable data) {
        @jobs_strongify(self)
        self.captcha4Session = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ModelByGTCaptcha4ResultModelPointerBlock _Nonnull)byResult{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nullable(GTCaptcha4ResultModel * _Nullable data) {
        @jobs_strongify(self)
        self.result = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ModelByStrBlock _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ModelByGTC4ErrorPointerBlock _Nonnull)byError{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nullable(GTC4Error * _Nullable data) {
        @jobs_strongify(self)
        self.error = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ModelByUIViewPointerBlock _Nonnull)byTargetView{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nullable(__kindof UIView * _Nullable data) {
        @jobs_strongify(self)
        self.targetView = data;
        return self;
    };
}

@end
