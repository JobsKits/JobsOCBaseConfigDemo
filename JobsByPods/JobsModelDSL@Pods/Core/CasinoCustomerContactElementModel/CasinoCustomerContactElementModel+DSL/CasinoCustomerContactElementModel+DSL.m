//
//  CasinoCustomerContactElementModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "CasinoCustomerContactElementModel+DSL.h"

@implementation CasinoCustomerContactElementModel (DSL)

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byAppIconUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.appIconUrl = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byNamecreateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.namecreateBy = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCreateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.createTime = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCustomer{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customer = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCustomerAccount{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customerAccount = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByJobsCustomerContactStyleBlock _Nonnull)byCustomerMark{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(JobsCustomerContactStyle data) {
        @jobs_strongify(self)
        self.customerMark = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byPcIconUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.pcIconUrl = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByJobsSwitchTypeBlock _Nonnull)byState{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(JobsSwitchType data) {
        @jobs_strongify(self)
        self.state = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byUpdateBy{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.updateBy = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byUpdateTime{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactElementModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.updateTime = data;
        return self;
    };
}
@end
