//
//  NSObject+URLMgr_1.h
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_URLMGR_1_A0401541BE
#define JOBS_HEADER_GUARD_NSOBJECT_URLMGR_1_A0401541BE

#import <Foundation/Foundation.h>
#import "URLMgr.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 来自 http://18.162.73.145:18093/doc.html#/default
@interface NSObject (URLMgr_1)
#pragma mark —— 主播管理接口
/// 获取主播详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_getInfo_ByID;
/// 根据会员ID查询主播信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_getInfo2BymemberId;
/// 查询主播信息列表@POST
-(URLManagerModel *_Nullable)post_presenter_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_presenter_list;
/// 修改主播信息@PUT
-(URLManagerModel *_Nullable)put_presenter_update;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_presenter_update_1;
#pragma mark —— 代理会员打包相关
/// 获取专属域名校验@GET
-(URLManagerModel *_Nullable)get_agentPackage_getCheckExclusiveDomain;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agentPackage_getCheckExclusiveDomain;
/// 获取打包信息@GET
-(URLManagerModel *_Nullable)get_agentPackage_getPackageInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agentPackage_getPackageInfo;
#pragma mark —— 会员KYC相关
/// 获取会员KYC信息@GET
-(URLManagerModel *_Nullable)get_kyc_info;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_kyc_info;
/// 获取会员KYC信息@GET（废弃掉）
-(URLManagerModel *_Nullable)get_kyc_info_getByUid;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_kyc_info_getByUid;
/// 用户提交KYC认证@POST
-(URLManagerModel *_Nullable)post_kyc_submit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_kyc_submit;
/// KYC认证提醒@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_kyc_verifyBymemberId;
/// 用户提交个人信息@POST
-(URLManagerModel *_Nullable)post_personal_information_submit;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_personal_information_submit;
#pragma mark —— 会员vip
/// vip特权领取@POST
-(URLManagerModel *_Nullable)post_vip_getCoupon;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vip_getCoupon;
/// 查询VIP特权专享@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberRight_vipLevel;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberRight_vipLevel;
/// 查询VIP信息@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVip;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVip;
/// 查询VIP信息详情@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipDetail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipDetail;
/// 查询VIP所有等级@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipLevels;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipLevels;
/// 查询VIP所有优惠@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipRebates;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipRebates;
/// 查询VIP所有权益@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipRights;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipRights;
/// 查询VIP权益开启关闭配置@GET
-(URLManagerModel *_Nullable)get_vip_queryVipSwitchConfig;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryVipSwitchConfig;
#pragma mark —— 会员收货地址
/// 会员收货地址删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_address_deleteByID;
/// 会员收货地址详情@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_address_detailByID;
/// 会员收货地址查询@GET
-(URLManagerModel *_Nullable)get_address_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_address_list;
/// 会员收货地址保存@POST
-(URLManagerModel *_Nullable)post_address_save;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_address_save;
/// 会员收货地址修改@POST
-(URLManagerModel *_Nullable)post_address_update;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_address_update;
#pragma mark —— 会员用户信息
/// 绑定邮箱@PUT
-(URLManagerModel *_Nullable)put_member_bindEmail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_bindEmail;
/// 绑定手机号@PUT
-(URLManagerModel *_Nullable)member_bindMobile_put;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_member_bindMobile_put;
/// 获取会员个人信息@GET
-(URLManagerModel *_Nullable)get_member_get;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_get;
/// 获取会员个人信息@GET
-(URLManagerModel *_Nullable)get_member_getByMemberId;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_getByMemberId;
/// 更新会员信息@PUT
-(URLManagerModel *_Nullable)put_member_memberUpdateLock;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_memberUpdateLock;
/// 获取会员门店id@GET
-(URLManagerModel *_Nullable)get_member_queryMemberStoreId;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_queryMemberStoreId;
/// 刷新识别码@GET
-(URLManagerModel *_Nullable)get_member_refreshIdentityCode;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_refreshIdentityCode;
/// 修改会员头像@PUT
-(URLManagerModel *_Nullable)put_member_updateAvatar;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateAvatar;
/// 修改会员生日@PUT
-(URLManagerModel *_Nullable)put_member_updateBirthday;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateBirthday;
/// 修改会员昵称@PUT
-(URLManagerModel *_Nullable)put_member_updateNickname;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateNickname;
/// 修改会员密码@PUT
-(URLManagerModel *_Nullable)put_member_updatePassword;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updatePassword;
/// 修改会员性别@PUT
-(URLManagerModel *_Nullable)put_member_updateSex;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateSex;
/// 更新会员信息@PUT
-(URLManagerModel *_Nullable)put_member_updateMemberInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateMemberInfo;
/// 更新当前会员识别码@PUT
-(URLManagerModel *_Nullable)put_member_updateRandomIdentifiert;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateRandomIdentifiert;
#pragma mark —— 会员用户认证
/// 账号密码登录@POST
-(URLManagerModel *_Nullable)post_user_auth_accountLogin;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_accountLogin;
/// 账号密码注册@POST
-(URLManagerModel *_Nullable)post_user_auth_accountRegister;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_accountRegister;
/// 校验登录校验码@POST
-(URLManagerModel *_Nullable)post_user_auth_check_login_verification;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_check_login_verification;
/// 校验图片验证码@GET
-(URLManagerModel *_Nullable)get_user_auth_check_verification_result;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_check_verification_result;
/// 获取访问图形校验码的站点类型（1为国外地址校验，2为国内地址校验）@GET
-(URLManagerModel *_Nullable)get_user_auth_get_verification_domainType;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_get_verification_domainType;
/// 获取图片验证码@GET
-(URLManagerModel *_Nullable)get_user_auth_get_verification_image;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_get_verification_image;
/// 玩家登录心跳@GET
-(URLManagerModel *_Nullable)get_user_auth_heartbeat;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_heartbeat;
/// 用户登出@POST
-(URLManagerModel *_Nullable)post_user_auth_logout;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_logout;
/// 手机登录@POST
-(URLManagerModel *_Nullable)post_user_auth_mobileLogin;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_mobileLogin;
/// 手机号登录--手机号校验@GET
-(URLManagerModel *)get_user_auth_mobile_loginCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode;
/// 使用手机号注册@POST
-(URLManagerModel *_Nullable)post_user_auth_mobileRegister;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_mobileRegister;
/// 手机号注册--验证码校验@GET
-(URLManagerModel *)get_user_auth_mobile_registerCheckByCode:(NSString *)mobile smsCode:(NSString *)smsCode;
/// 手机号注册--手机校验@GET
-(URLManagerModel *)get_user_auth_mobile_registerCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode;
/// 手机号注册--自动生成账号@GET
-(URLManagerModel *_Nullable)get_user_auth_mobileRegisterCreatName;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_mobileRegisterCreatName;
/// 会员注册@POST
-(URLManagerModel *_Nullable)post_user_auth_ph_register_v1;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_ph_register_v1;
/// 找回密码-三步走-[step 1.] check-account@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkAccount;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkAccount;
/// 找回密码-三步走-[step 2.] check-mobile@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkMobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkMobile;
/// 在未登录的情况下进行密码重置@POST
/// 1、在未登录的情况下，获取手机验证码成功以后取得一个临时的修改密码专属的用户Token，再进行下一步操作
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkPasswordMobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkPasswordMobile;
/// 在未登录的情况下进行密码重置@POST
/// 2、在上一步操作成功（取得一个临时的修改密码专属的用户Token）以后，此时加入最新修改的密码进行修改
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_setPassword;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_setPassword;
/// 在登录的情况下进行密码重置@POST
/// 找回密码-三步走-[step 3.] update-password@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_updatePassword;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_updatePassword;
/// 刷新Token@POST
-(URLManagerModel *_Nullable)post_user_auth_tokenRefresh;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_tokenRefresh;
#pragma mark —— 会员的虚拟币钱包地址管理
/// 已绑定手机号时绑定虚拟币钱包地址@POST
-(URLManagerModel *_Nullable)post_user_cryptocy_bind;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_cryptocy_bind;
/// 未绑定手机号时绑定虚拟币钱包地址@POST
-(URLManagerModel *_Nullable)post_user_cryptocy_bindWithPhone;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_cryptocy_bindWithPhone;
/// 检查会员是否绑定手机号@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_checkMobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_checkMobile;
/// 删除虚拟币地址@DELETE
-(URLManagerModel *_Nullable)delete_user_cryptocy;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_user_cryptocy;
/// 获取会员虚拟币钱包地址列表@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_list;
/// 获取支持的虚拟币列表@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_list_support;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_list_support;
#pragma mark —— 会员禁言记录接口
/// 根据状态查询会员禁言记录全量信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_user_banLog_all_status;
/// 查询会员禁言详情@POST
-(URLManagerModel *_Nullable)post_user_banLog_banInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_banInfo;
/// 批量解禁@POST
-(URLManagerModel *_Nullable)post_user_banLog_batchUntie;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_batchUntie;
/// 查询会员禁言记录列表@POST
-(URLManagerModel *_Nullable)post_user_banLog_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_list;
/// 新增会员禁言记录@POST
-(URLManagerModel *_Nullable)post_user_banLog_save;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_save;
/// 修改会员禁言记录@PUT
-(URLManagerModel *_Nullable)put_user_banLog_update;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_user_banLog_update;
#pragma mark —— 会员页面
/// 获取联系方式数据@GET
-(URLManagerModel *_Nullable)get_user_member_contact_info;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_contact_info;
/// 申请代理@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_create;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_create;
/// 三方登录@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_createProxy;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_createProxy;
/// 获取登录信息@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_get_login_info;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_get_login_info;
/// 获取代理待审核数据@GET
-(URLManagerModel *_Nullable)get_user_member_joinUs_info;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_joinUs_info;
/// 清理登录@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_login_clean;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_login_clean;
/// 获取首页登录状态joinus展示情况@GET
-(URLManagerModel *_Nullable)get_user_member_joinUs_status;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_joinUs_status;
#pragma mark —— 国家编码信息管理
/// 获取国家编码信息列表@GET
-(URLManagerModel *_Nullable)get_user_countrycode_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_countrycode_list;
#pragma mark —— 提供给游戏服务的Feign接口
/// 查询会员信息-根据memberId@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfo;
/// 查询会员信息-根据memberName@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfoByName;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfoByName;
/// 批量查询会员信息-根据memberNames@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfoByNames;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfoByNames;
/// updateMemberInfo@POST
-(URLManagerModel *_Nullable)post_user_userforgame_memberinfoUpdate;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_userforgame_memberinfoUpdate;
#pragma mark —— 电子钱包管理
/// 绑定电子钱包@POST
-(URLManagerModel *_Nullable)post_user_eWallets_bind;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_eWallets_bind;
/// 删除电子钱包@GET
-(URLManagerModel *_Nullable)get_user_eWallets_delete;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_eWallets_delete;
/// 获取会员电子钱包列表@GET
-(URLManagerModel *_Nullable)get_user_eWallets_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_eWallets_list;
#pragma mark —— 短信验证码接口
/// 校验短信验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_check;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_check;
/// 检查验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_checkCodeEmail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_checkCodeEmail;
/// 检查手机验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_checkCodeMobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_checkCodeMobile;
/// 发送短信验证码@POST
/// ❤️可以用于：注册、修改密码...❤️
-(URLManagerModel *_Nullable)post_user_verCode_sendSms;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_sendSms;
/// 发送短信验证码@POST
/// ❤️只能用于登录❤️
-(URLManagerModel *_Nullable)post_user_verCode_sendSms_login;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_sendSms_login;
#pragma mark —— 邀请好友
/// 领取奖励@POST
-(URLManagerModel *_Nullable)post_member_invite_drawAward;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_invite_drawAward;
/// 生成邀请码@GET
-(URLManagerModel *_Nullable)get_member_invite_generateReferralCode;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_generateReferralCode;
/// 跑马灯@GET
-(URLManagerModel *_Nullable)get_member_invite_queryHorseRing;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryHorseRing;
/// 邀请详情流水分成奖励列表@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteBetAwardList;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteBetAwardList;
/// 查询邀请好友流水奖励配置@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteBetConfig;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteBetConfig;
/// 邀请详情首存奖励列表@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteDepAward;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteDepAward;
/// 查询邀请好友首存奖励配置@GET
//-(URLManagerModel *)get_member_invite_queryInviteDepConfig;
/// 邀请信息@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteInfo;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteInfo;
/// 邀请详情累计发放金额和邀请人数@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteInfoTotalAward;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteInfoTotalAward;
/// 查询邀请好友vip奖励配置@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteVipConfig;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteVipConfig;
#pragma mark —— 邮箱验证码接口
/// 发送邮箱验证码@POST
-(URLManagerModel *_Nullable)post_user_verify_sendEmail;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verify_sendEmail;
#pragma mark —— 银行信息管理
/// 已绑定手机号时绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_bind;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_bind;
/// 未绑定手机号时绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_bindWithPhone;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_bindWithPhone;
/// 获取会员卡数量@GET
-(URLManagerModel *_Nullable)get_user_bankcard_cardTotal;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_cardTotal;
/// 绑卡前检查会员是否绑定手机号@GET
-(URLManagerModel *_Nullable)get_user_bankcard_checkMobile;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_checkMobile;
/// 银行卡二要素校验@POST
-(URLManagerModel *_Nullable)post_user_bankcard_checkBankCardTripartiteHttp;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_checkBankCardTripartiteHttp;
/// 删除银行卡@DELETE
-(URLManagerModel *_Nullable)delete_user_bankcard;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_user_bankcard;
/// 获取会员的银行卡列表@GET
-(URLManagerModel *_Nullable)get_user_bankcard_list;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_list;
/// 绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_ph_bind;
-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_ph_bind;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_URLMGR_1_A0401541BE */
