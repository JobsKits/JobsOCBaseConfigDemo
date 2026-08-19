//
//  CasinoCustomerContactElementModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_112E391C393E52D7
#define JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_112E391C393E52D7

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerContactElementModel (DSL)

-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byAppIconUrl;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byNamecreateBy;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCreateTime;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCustomer;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byCustomerAccount;
-(JobsRetCasinoCustomerContactElementModelByJobsCustomerContactStyleBlock _Nonnull)byCustomerMark;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byID;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byPcIconUrl;
-(JobsRetCasinoCustomerContactElementModelByJobsSwitchTypeBlock _Nonnull)byState;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byUpdateBy;
-(JobsRetCasinoCustomerContactElementModelByStrBlock _Nonnull)byUpdateTime;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_112E391C393E52D7 */
