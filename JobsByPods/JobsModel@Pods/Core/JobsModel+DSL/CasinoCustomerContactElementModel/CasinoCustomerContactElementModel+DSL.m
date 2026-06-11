//
//  CasinoCustomerContactElementModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "CasinoCustomerContactElementModel+DSL.h"

@implementation CasinoCustomerContactElementModel (DSL)

#pragma mark —— 来自 CasinoCustomerContactElementModel
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byAppIconUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.appIconUrl = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byNamecreateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.namecreateBy = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.createTime = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomer{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customer = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomerAccount{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customerAccount = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(JobsCustomerContactStyle data))byCustomerMark{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(JobsCustomerContactStyle data) {
        @jobs_strongify(self)
        self.customerMark = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byID{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byPcIconUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.pcIconUrl = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(JobsSwitchType data))byState{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(JobsSwitchType data) {
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}

@end
