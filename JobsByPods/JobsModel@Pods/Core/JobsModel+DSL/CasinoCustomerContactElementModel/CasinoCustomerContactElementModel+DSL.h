//
//  CasinoCustomerContactElementModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_4B7614F7B2F6B7BC
#define JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_4B7614F7B2F6B7BC

#if __has_include(<JobsModel/CasinoCustomerContactModel.h>)
#import <JobsModel/CasinoCustomerContactModel.h>
#else
#import "CasinoCustomerContactModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface CasinoCustomerContactElementModel (DSL)

#pragma mark —— 来自 CasinoCustomerContactElementModel
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byAppIconUrl;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byNamecreateBy;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCreateTime;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomer;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomerAccount;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(JobsCustomerContactStyle data))byCustomerMark;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byID;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byPcIconUrl;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(JobsSwitchType data))byState;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateBy;
-(__kindof CasinoCustomerContactElementModel *_Nonnull (^ _Nonnull)(NSString * data))byUpdateTime;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CASINOCUSTOMERCONTACTELEMENTMODEL_DSL_4B7614F7B2F6B7BC */
