//
//  GTCaptcha4ResultModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "GTCaptcha4ResultModel+DSL.h"

@implementation GTCaptcha4ResultModel (DSL)

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byPass_token{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.pass_token = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byGen_time{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.gen_time = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptcha_output{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captcha_output = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptcha_id{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captcha_id = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byLot_number{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.lot_number = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byChallenge{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.challenge = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByNSIntegerBlock _Nonnull)byFailCount{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.failCount = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byLotNumber{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.lotNumber = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptchaType{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captchaType = data;
        return self;
    };
}

-(JobsRetGTCaptcha4ResultModelByStrBlock _Nonnull)byCaptchaId{
    @jobs_weakify(self)
    return ^__kindof GTCaptcha4ResultModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captchaId = data;
        return self;
    };
}
@end
