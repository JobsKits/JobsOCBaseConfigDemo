//
//  GTCaptcha4Model+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "GTCaptcha4Model+DSL.h"

@implementation GTCaptcha4Model (DSL)

#pragma mark —— 来自 GTCaptcha4Model
-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTCaptcha4Session * data))byCaptcha4Session{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nonnull(GTCaptcha4Session * data) {
        @jobs_strongify(self)
        self.captcha4Session = data;
        return self;
    };
}

-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTCaptcha4ResultModel * data))byResult{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nonnull(GTCaptcha4ResultModel * data) {
        @jobs_strongify(self)
        self.result = data;
        return self;
    };
}

-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(NSString * data))byStatus{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(GTC4Error * data))byError{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nonnull(GTC4Error * data) {
        @jobs_strongify(self)
        self.error = data;
        return self;
    };
}

-(__kindof GTCaptcha4Model *_Nonnull (^ _Nonnull)(__kindof UIView * data))byTargetView{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4Model *_Nonnull(__kindof UIView * data) {
        @jobs_strongify(self)
        self.targetView = data;
        return self;
    };
}

@end
