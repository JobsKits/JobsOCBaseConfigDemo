//
//  JobsAppDoorModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsAppDoorModel+DSL.h"

@implementation JobsAppDoorModel (DSL)
-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byUserName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byPassword{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byConfirmPassword{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.confirmPassword = data;
        return self;
    };
}

-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byTel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.tel = data;
        return self;
    };
}

-(JobsRetJobsAppDoorModelByStrBlock _Nonnull)byVerificationCode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.verificationCode = data;
        return self;
    };
}

@end
