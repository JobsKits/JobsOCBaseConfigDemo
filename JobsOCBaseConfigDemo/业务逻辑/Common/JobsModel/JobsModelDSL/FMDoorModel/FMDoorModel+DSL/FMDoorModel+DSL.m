//
//  FMDoorModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "FMDoorModel+DSL.h"

@implementation FMDoorModel (DSL)

-(JobsRetFMDoorModelByStrBlock _Nonnull)byAccessToken{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.accessToken = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byMobile{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.mobile = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byUserName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.userName = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_id{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captcha_id = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_key{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captcha_key = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byCaptcha_output{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.captcha_output = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byCountryCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.countryCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byDomain{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.domain = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byDomainName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.domainName = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byGen_time{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.gen_time = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byInviteCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.inviteCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byInviteName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.inviteName = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byLot_number{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.lot_number = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byPass_token{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.pass_token = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byPassword{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.password = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byReferCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.referCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)bySmsCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.smsCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNumberBlock _Nonnull)byActionType{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.actionType = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNumberBlock _Nonnull)byBusinessSource{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSNumber * _Nullable data) {
        @jobs_strongify(self)
        self.businessSource = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byCallFlag{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.callFlag = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byMobileArea{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.mobileArea = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byExpireTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.expireTime = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.regTime = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byBirthday{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.birthday = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byNickName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.nickName = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byStatus{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.status = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byFinanceTier{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.financeTier = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byCryptoCount{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.cryptoCount = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)bySex{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.sex = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRealName{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.realName = data;
        return self;
    };
}

-(JobsRetFMDoorModelByBOOLBlock _Nonnull)byPasswordFlag{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.passwordFlag = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegCurrency{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.regCurrency = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byIdentityCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.identityCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byID{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.ID = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byTenantId{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.tenantId = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byEmail{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.email = data;
        return self;
    };
}

-(JobsRetFMDoorModelByBOOLBlock _Nonnull)byNickNameStatus{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.nickNameStatus = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegNationCode{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.regNationCode = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegNation{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.regNation = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byAvatar{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.avatar = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byRole{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.role = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byBankCardCount{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.bankCardCount = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byRegDay{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.regDay = data;
        return self;
    };
}

-(JobsRetFMDoorModelByNSIntegerBlock _Nonnull)byVipLevel{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.vipLevel = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byRegLang{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.regLang = data;
        return self;
    };
}

-(JobsRetFMDoorModelByLoginTypeBlock _Nonnull)byLoginType{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(LoginType data) {
        @jobs_strongify(self)
        self.loginType = data;
        return self;
    };
}

-(JobsRetFMDoorModelByStrBlock _Nonnull)byTokenExpireTime{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.tokenExpireTime = data;
        return self;
    };
}

-(JobsRetFMDoorModelByImageBlock _Nonnull)byUserDefaultHeadImage{
    @jobs_weakify(self)
    return ^__kindof FMDoorModel *_Nullable(UIImage * _Nullable data) {
        @jobs_strongify(self)
        self.userDefaultHeadImage = data;
        return self;
    };
}

@end
