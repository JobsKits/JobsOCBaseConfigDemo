//
//  JobsAppDoorModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsAppDoorModel+DSL.h"

@implementation JobsAppDoorModel (DSL)

#pragma mark —— 来自 JobsAppDoorModel
-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byConfirmPassword{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.confirmPassword = data;
        return self;
    };
}

-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byTel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.tel = data;
        return self;
    };
}

-(__kindof JobsAppDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byVerificationCode{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.verificationCode = data;
        return self;
    };
}

@end
