//
//  FMNameModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "FMNameModel+DSL.h"

@implementation FMNameModel (DSL)

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byFirstNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.firstNameTF = data;
        return self;
    };
}

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byMiddleNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.middleNameTF = data;
        return self;
    };
}

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byLastNameTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.lastNameTF = data;
        return self;
    };
}

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byIdTypeTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.idTypeTF = data;
        return self;
    };
}

-(JobsRetFMNameModelByUITextFieldPointerBlock _Nonnull)byIdNumberTF{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(__kindof UITextField * _Nullable data) {
        @jobs_strongify(self)
        self.idNumberTF = data;
        return self;
    };
}

-(JobsRetFMNameModelByStrBlock _Nonnull)byFirstName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.firstName = data;
        return self;
    };
}

-(JobsRetFMNameModelByStrBlock _Nonnull)byMiddleName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.middleName = data;
        return self;
    };
}

-(JobsRetFMNameModelByStrBlock _Nonnull)byLastName{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.lastName = data;
        return self;
    };
}

-(JobsRetFMNameModelByStrBlock _Nonnull)byIdType{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.idType = data;
        return self;
    };
}

-(JobsRetFMNameModelByStrBlock _Nonnull)byIdNumber{
    @jobs_weakify(self)
    return ^__kindof FMNameModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.idNumber = data;
        return self;
    };
}

@end
