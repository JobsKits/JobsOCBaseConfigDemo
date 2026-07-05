//
//  CasinoCustomerContactModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTMODEL_DSL_1F6505DDFE54AE1
#define JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTMODEL_DSL_1F6505DDFE54AE1

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerContactModel (DSL)

-(JobsRetCasinoCustomerContactModelByMutableArrayBlock _Nonnull)byCustomerList;
-(JobsRetCasinoCustomerContactModelByCasinoCustomerContactElementModelPointerBlock _Nonnull)byOnlineUrl;
-(JobsRetCasinoCustomerContactModelByCasinoCustomerContactElementModelPointerBlock _Nonnull)byTelephone;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTMODEL_DSL_1F6505DDFE54AE1 */
