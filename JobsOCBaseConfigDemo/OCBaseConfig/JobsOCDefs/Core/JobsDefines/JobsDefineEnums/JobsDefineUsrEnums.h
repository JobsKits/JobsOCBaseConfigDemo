//
//  JobsDefineUsrEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineUsrEnums_h
#define JobsDefineUsrEnums_h
#pragma mark —— 账户
/// 用户@账户类型
#ifndef AccountStyle_DEFINED
#define AccountStyle_DEFINED
typedef NS_ENUM(NSInteger, AccountStyle) {
    AccountStyle_GCCash, // 账户类型@GCCash
    AccountStyle_Bank    // 账户类型@银行
};
#endif /* AccountStyle_DEFINED */
/// 用户@账号类型
#ifndef FMACCOUNTTYPE
#define FMACCOUNTTYPE
typedef NS_ENUM(NSInteger, FMAccType){
    FMAccType_ALL_MEMBER = 0,        // 账号类型@所有会员
    FMAccType_DESIGNATED_MEMBER = 1, // 账号类型@指定会员
    FMAccType_All_AGENCY = 2,        // 账号类型@全代理线
    FMAccType_DESIGNATED_AGENCY = 3, // 账号类型@指定代理线
};
#endif /* FMACCOUNTTYPE */
/// 用户@KYC状态
#ifndef KYCSTATUS
#define KYCSTATUS
typedef NS_ENUM(NSInteger, KYCStatus){
    KYCStatus_待审核 = 0,
    KYCStatus_通过,
    KYCStatus_拒绝,
    KYCStatus_未提交
};
#endif /* KYCSTATUS */
/// 用户@KYC
#ifndef VerificationStatusEnum
#define VerificationStatusEnum
typedef NS_ENUM(NSInteger, VerificationStatus) {
    VerificationStatusUnverified = 0, // KYC@未认证
    VerificationStatusVerifying,      // KYC@认证中
    VerificationStatusVerified        // KYC@已认证
};
#endif /* VerificationStatusEnum */
/// 用户@是否已KYC验证
#ifndef KYCOK
#define KYCOK
typedef NS_ENUM(NSInteger, KYCok){
    KYCOK_未通过 = 0,
    KYCOK_已经通过 = 1
};
#endif /* KYCOK */
/// 用户@ID类型
#ifndef IDTYPEENUM
#define IDTYPEENUM
typedef NS_ENUM(NSInteger, IdTypeEnum){
    PHILIPPINE_NATIONAL_ID = 1,              // Philippine National ID
    DRIVERS_LICENSE = 2,                     // Driver's License
    PHIL_HEALTH_ID = 3,                      // PhilHealth ID
    PHILIPPINE_POSTAL_ID = 4,                // Philippine Postal ID
    NBI_CLEARANCE = 5,                       // NBI Clearanc
    SENIOR_CITIZEN_CARD = 6,                 // Senior Citizen Card
    ID_PASSPORT = 7,                         // ID Passport (Philippine/Foreign)
    IBP_ID = 8,                              // Integrated Bar of the Philippines ID
    FIREARMS_LICENSE = 9,                    // Firearms License
    PROFESSIONAL_REGULATIONS_COMMISSION = 10,// Professional Regulations Commission
    OFW_ID = 11,                             // Overseas Filipino Workers (OFW) ID
    SSS_CARD = 12,                           // Social Security System (SSS) Card
    TIN = 13,                                // Tax Identification
    UMID = 14,                               // Unified Multi-Purpose ID
    VOTERS_ID = 15,                          // Voter's Certificate and/or Voter's ID
    MARINA_ID = 16,                          // Maritime Industry Authority (MARINA) ID
    PWD_ID = 17,                             // Person's with Disability (PWD) iD
    ALIEN_CERTIFICATE_OF_REGISTRATION = 18,  // Alien Certificate of Registration
    ICR_ID = 19                              // Immigrant Certificate of Registration
};
#endif /* IDTYPEENUM */
/// 用户@类型设置
#ifndef USERTYPESETTING
#define USERTYPESETTING
typedef NS_ENUM(NSInteger, UserTypeSetting) {
    USERTYPE_REGISTER = 1,                // 用户类型设置@注册
    USERTYPE_LOGIN = 2,                   // 用户类型设置@登录
    USERTYPE_FORGET_PWD = 3,              // 用户类型设置@忘记密码
    USERTYPE_BIND_PHONE = 4,              // 用户类型设置@绑定手机号
    USERTYPE_BIND_BANKCARD = 5,           // 用户类型设置@绑定银行卡
    USERTYPE_BIND_CRYPTO_CURRENCY = 6,    // 用户类型设置@绑定加密货币地址
    USERTYPE_AGENT_PAY_PWD_SET = 7,       // 用户类型设置@支付密码设置
    USERTYPE_AGENT_PAY_PWD_RESET = 8,     // 用户类型设置@支付密码修改
    USERTYPE_AGENT_WITHDRAWAL_REQ = 9,    // 用户类型设置@代理提款申请
    USERTYPE_AGENT_DEPOSIT = 10,          // 用户类型设置@代理代存
    USERTYPE_BIND_E_WALLET = 11           // 用户类型设置@绑定电子钱包
};
#endif /* USERTYPESETTING */
/// 更新用户信息类型
#ifndef JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED
#define JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsUpdateUserInfoType) {
    JobsUpdateUserInfoType_Undefined = 0,     // 更新用户信息类型@未定义
    JobsUpdateUserInfoType_Nation,            // 更新用户信息类型@国家
    JobsUpdateUserInfoType_Nationality,       // 更新用户信息类型@民族
    JobsUpdateUserInfoType_RealName,          // 更新用户信息类型@真实姓名
    JobsUpdateUserInfoType_NikeName,          // 更新用户信息类型@花名
    JobsUpdateUserInfoType_Age,               // 更新用户信息类型@年龄
    JobsUpdateUserInfoType_Birthday,          // 更新用户信息类型@生日
    JobsUpdateUserInfoType_sex,               // 更新用户信息类型@性别
    JobsUpdateUserInfoType_SexualOrientation, // 更新用户信息类型@性倾向
    JobsUpdateUserInfoType_Mail,              // 更新用户信息类型@邮箱地址
    JobsUpdateUserInfoType_Wechat,            // 更新用户信息类型@微信账号
    JobsUpdateUserInfoType_QQ,                // 更新用户信息类型@QQ账号
    JobsUpdateUserInfoType_Telephone,         // 更新用户信息类型@手机号码
    JobsUpdateUserInfoType_SinaWeibo,         // 更新用户信息类型@新浪微博账号
    JobsUpdateUserInfoType_Telegram,          // 更新用户信息类型@纸飞机账号
    JobsUpdateUserInfoType_Instagram,         // 更新用户信息类型@Instagram账号
    JobsUpdateUserInfoType_Facebook,          // 更新用户信息类型@Facebook账号
    JobsUpdateUserInfoType_Skype,             // 更新用户信息类型@Skype账号
    JobsUpdateUserInfoType_WhatsApp,          // 更新用户信息类型@WhatsApp账号
    JobsUpdateUserInfoType_All                // 更新用户信息类型@全部更新
};
#endif /* JOBS_UPDATE_USER_INFO_TYPE_ENUM_DEFINED */
/// 会员等级
#ifndef JOBS_RANK_CLASS_ENUM_DEFINED
#define JOBS_RANK_CLASS_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsRankClass) {
    JobsRankClass_Undefined = 0, // 未定义
    JobsRankClass_VIP0,          // 会员等级@0
    JobsRankClass_VIP1,          // 会员等级@1
    JobsRankClass_VIP2,          // 会员等级@2
    JobsRankClass_VIP3,          // 会员等级@3
    JobsRankClass_VIP4,          // 会员等级@4
    JobsRankClass_VIP5,          // 会员等级@5
    JobsRankClass_VIP6,          // 会员等级@6
    JobsRankClass_VIP7,          // 会员等级@7
    JobsRankClass_VIP8,          // 会员等级@8
    JobsRankClass_VIP9,          // 会员等级@9
    JobsRankClass_VIP10,         // 会员等级@10
    JobsRankClass_All
};
#endif /* JOBS_RANK_CLASS_ENUM_DEFINED */

#endif /* JobsDefineUsrEnums_h */
