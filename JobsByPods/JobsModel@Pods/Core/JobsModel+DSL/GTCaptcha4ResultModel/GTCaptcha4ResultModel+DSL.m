//
//  GTCaptcha4ResultModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "GTCaptcha4ResultModel+DSL.h"

@implementation GTCaptcha4ResultModel (DSL)

#pragma mark —— 来自 GTCaptcha4ResultModel
-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byPass_token{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.pass_token = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byGen_time{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.gen_time = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_output{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captcha_output = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_id{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captcha_id = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byLot_number{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.lot_number = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byChallenge{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.challenge = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSInteger data))byFailCount{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.failCount = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byLotNumber{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.lotNumber = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptchaType{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captchaType = data;
        return self;
    };
}

-(__kindof GTCaptcha4ResultModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptchaId{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captchaId = data;
        return self;
    };
}

@end
