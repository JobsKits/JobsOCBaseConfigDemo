//
//  CasinoCustomerContactModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "CasinoCustomerContactModel+DSL.h"

@implementation CasinoCustomerContactModel (DSL)

-(JobsRetCasinoCustomerContactModelByMutableArrayBlock _Nonnull)byCustomerList{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactModel *_Nullable(NSMutableArray <CasinoCustomerContactElementModel *> * _Nullable data) {
        @jobs_strongify(self)
        self.customerList = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactModelByCasinoCustomerContactElementModelPointerBlock _Nonnull)byOnlineUrl{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactModel *_Nullable(CasinoCustomerContactElementModel * _Nullable data) {
        @jobs_strongify(self)
        self.onlineUrl = data;
        return self;
    };
}

-(JobsRetCasinoCustomerContactModelByCasinoCustomerContactElementModelPointerBlock _Nonnull)byTelephone{
    @jobs_weakify(self)
    return ^__kindof CasinoCustomerContactModel *_Nullable(CasinoCustomerContactElementModel * _Nullable data) {
        @jobs_strongify(self)
        self.telephone = data;
        return self;
    };
}
@end
