//
//  FMNameModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "FMNameModel+DSL.h"

@implementation FMNameModel (DSL)

#pragma mark —— 来自 FMNameModel
-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byFirstNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.firstNameTF = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byMiddleNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.middleNameTF = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byLastNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.lastNameTF = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byIdTypeTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.idTypeTF = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(__kindof UITextField * data))byIdNumberTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(__kindof UITextField * data) {
        @jobs_strongify(self)
        self.idNumberTF = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byFirstName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.firstName = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byMiddleName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.middleName = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byLastName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.lastName = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byIdType{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.idType = data;
        return self;
    };
}

-(__kindof FMNameModel *_Nonnull (^ _Nonnull)(NSString * data))byIdNumber{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.idNumber = data;
        return self;
    };
}

@end
