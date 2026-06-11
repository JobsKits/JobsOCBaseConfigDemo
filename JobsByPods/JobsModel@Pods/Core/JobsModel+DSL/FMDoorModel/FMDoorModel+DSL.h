//
//  FMDoorModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FMDOORMODEL_DSL_B4971A29EB03FB6A
#define JOBS_HEADER_GUARD_FMDOORMODEL_DSL_B4971A29EB03FB6A

#if __has_include(<JobsModel/FMDoorModel.h>)
#import <JobsModel/FMDoorModel.h>
#else
#import "FMDoorModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FMDoorModel (DSL)

#pragma mark —— 来自 FMDoorModel
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byAccessToken;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byMobile;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_id;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_key;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_output;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCountryCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byDomain;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byDomainName;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byGen_time;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteName;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byLot_number;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPass_token;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byReferCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))bySmsCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSNumber * data))byActionType;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSNumber * data))byBusinessSource;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCallFlag;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byMobileArea;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byExpireTime;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegTime;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byBirthday;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byNickName;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byStatus;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byFinanceTier;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byCryptoCount;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))bySex;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRealName;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(BOOL data))byPasswordFlag;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegCurrency;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentityCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byID;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byTenantId;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byEmail;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(BOOL data))byNickNameStatus;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegNationCode;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegNation;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byAvatar;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byRole;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byBankCardCount;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byRegDay;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byVipLevel;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegLang;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(LoginType data))byLoginType;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byTokenExpireTime;
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(UIImage * data))byUserDefaultHeadImage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FMDOORMODEL_DSL_B4971A29EB03FB6A */
