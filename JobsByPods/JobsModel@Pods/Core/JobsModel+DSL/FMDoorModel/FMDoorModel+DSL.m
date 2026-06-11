//
//  FMDoorModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "FMDoorModel+DSL.h"

@implementation FMDoorModel (DSL)

#pragma mark —— 来自 FMDoorModel
-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byAccessToken{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.accessToken = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byMobile{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.mobile = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byUserName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_id{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captcha_id = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_key{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captcha_key = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCaptcha_output{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.captcha_output = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCountryCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.countryCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byDomain{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.domain = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byDomainName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.domainName = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byGen_time{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.gen_time = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.inviteCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byInviteName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.inviteName = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byLot_number{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.lot_number = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPass_token{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.pass_token = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byPassword{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byReferCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.referCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))bySmsCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.smsCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSNumber * data))byActionType{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.actionType = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSNumber * data))byBusinessSource{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSNumber * data) {
        @jobs_strongify(self)
        self.businessSource = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byCallFlag{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.callFlag = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byMobileArea{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.mobileArea = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byExpireTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.expireTime = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.regTime = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byBirthday{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.birthday = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byNickName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.nickName = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byStatus{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byFinanceTier{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.financeTier = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byCryptoCount{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.cryptoCount = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))bySex{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.sex = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRealName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.realName = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(BOOL data))byPasswordFlag{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.passwordFlag = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegCurrency{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.regCurrency = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentityCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.identityCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byID{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byTenantId{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.tenantId = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byEmail{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.email = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(BOOL data))byNickNameStatus{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.nickNameStatus = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegNationCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.regNationCode = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegNation{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.regNation = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byAvatar{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.avatar = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byRole{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.role = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byBankCardCount{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.bankCardCount = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byRegDay{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.regDay = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSInteger data))byVipLevel{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.vipLevel = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byRegLang{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.regLang = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(LoginType data))byLoginType{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(LoginType data) {
        @jobs_strongify(self)
        self.loginType = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(NSString * data))byTokenExpireTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.tokenExpireTime = data;
        return self;
    };
}

-(__kindof FMDoorModel *_Nonnull (^ _Nonnull)(UIImage * data))byUserDefaultHeadImage{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nonnull(UIImage * data) {
        @jobs_strongify(self)
        self.userDefaultHeadImage = data;
        return self;
    };
}

@end
