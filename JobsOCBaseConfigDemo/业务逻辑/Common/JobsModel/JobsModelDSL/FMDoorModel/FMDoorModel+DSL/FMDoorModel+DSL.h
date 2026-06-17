//
//  FMDoorModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FMDOORMODEL_DSL_25A45D7DDAF9DA94
#define JOBS_HEADER_GUARD_FMDOORMODEL_DSL_25A45D7DDAF9DA94

#import "FMDoorModel.h"

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

NS_ASSUME_NONNULL_BEGIN

@interface FMDoorModel (DSL)

-(JobsRetFMDoorModelByStrBlock _Nonnull)byAccessToken;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byMobile;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byUserName;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_id;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_key;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_output;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byCountryCode;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byDomain;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byDomainName;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byGen_time;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byInviteCode;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byInviteName;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byLot_number;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byPass_token;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byPassword;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byReferCode;
-(JobsRetFMDoorModelByStrBlock _Nonnull)bySmsCode;
-(JobsRetFMDoorModelByNumberBlock _Nonnull)byActionType;
-(JobsRetFMDoorModelByNumberBlock _Nonnull)byBusinessSource;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byCallFlag;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byMobileArea;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byExpireTime;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegTime;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byBirthday;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byNickName;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byStatus;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byFinanceTier;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byCryptoCount;
-(JobsRetFMDoorModelByStrBlock _Nonnull)bySex;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRealName;
-(JobsRetFMDoorModelByBOOLBlock _Nonnull)byPasswordFlag;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegCurrency;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byIdentityCode;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byID;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byTenantId;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byEmail;
-(JobsRetFMDoorModelByBOOLBlock _Nonnull)byNickNameStatus;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegNationCode;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegNation;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byAvatar;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byRole;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byBankCardCount;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byRegDay;
-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byVipLevel;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegLang;
-(JobsRetFMDoorModelByLoginTypeBlock _Nonnull)byLoginType;
-(JobsRetFMDoorModelByStrBlock _Nonnull)byTokenExpireTime;
-(JobsRetFMDoorModelByImageBlock _Nonnull)byUserDefaultHeadImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMDOORMODEL_DSL_25A45D7DDAF9DA94 */
