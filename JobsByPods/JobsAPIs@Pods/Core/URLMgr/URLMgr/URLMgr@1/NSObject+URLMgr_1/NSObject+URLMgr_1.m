//
//  NSObject+URLMgr_1.m
//  JobsAPIs
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+URLMgr_1.h"

#import <JobsAPIs/NSString+Extra.h>
/// 来自 http://18.162.73.145:18093/doc.html#/default
@implementation NSObject (URLMgr_1)
#pragma mark —— 主播管理接口
/// 获取主播详细信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_getInfo_ByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/api/user/presenter/getInfo/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 根据会员ID查询主播信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_presenter_getInfo2BymemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/api/user/presenter/getInfo2/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 查询主播信息列表@POST
-(URLManagerModel *_Nullable)post_presenter_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_presenter_list)))(self, @selector(jobs_post_presenter_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_presenter_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/presenter/list");
    };
}
/// 修改主播信息@PUT
-(URLManagerModel *_Nullable)put_presenter_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_presenter_update_1)))(self, @selector(jobs_put_presenter_update_1)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_presenter_update_1{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/presenter/update");
    };
}
#pragma mark —— 代理会员打包相关
/// 获取专属域名校验@GET
-(URLManagerModel *_Nullable)get_agentPackage_getCheckExclusiveDomain{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agentPackage_getCheckExclusiveDomain)))(self, @selector(jobs_get_agentPackage_getCheckExclusiveDomain)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agentPackage_getCheckExclusiveDomain{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/agentPackage/getCheckExclusiveDomain");
    };
}
/// 获取打包信息@GET
-(URLManagerModel *_Nullable)get_agentPackage_getPackageInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_agentPackage_getPackageInfo)))(self, @selector(jobs_get_agentPackage_getPackageInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_agentPackage_getPackageInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/agentPackage/getPackageInfo");
    };
}
#pragma mark —— 会员KYC相关
/// 获取会员KYC信息@GET
-(URLManagerModel *_Nullable)get_kyc_info{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_kyc_info)))(self, @selector(jobs_get_kyc_info)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_kyc_info{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/kyc/info/get");
    };
}
/// 获取会员KYC信息@GET（废弃掉）
-(URLManagerModel *_Nullable)get_kyc_info_getByUid{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_kyc_info_getByUid)))(self, @selector(jobs_get_kyc_info_getByUid)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_kyc_info_getByUid{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/kyc/info/getByUid");
    };
}
/// 用户提交KYC认证@POST
-(URLManagerModel *_Nullable)post_kyc_submit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_kyc_submit)))(self, @selector(jobs_post_kyc_submit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_kyc_submit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/kyc/submit");
    };
}
/// KYC认证提醒@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_kyc_verifyBymemberId{
    return ^URLManagerModel *_Nullable(NSString *_Nullable memberId){
        NSString *url = @"/api/member/kyc/verify/{".add(memberId).add(@"}");
        return JobsURL(url);
    };
}
/// 用户提交个人信息@POST
-(URLManagerModel *_Nullable)post_personal_information_submit{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_personal_information_submit)))(self, @selector(jobs_post_personal_information_submit)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_personal_information_submit{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/personal/information/submit");
    };
}
#pragma mark —— 会员vip
/// vip特权领取@POST
-(URLManagerModel *_Nullable)post_vip_getCoupon{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_vip_getCoupon)))(self, @selector(jobs_post_vip_getCoupon)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_vip_getCoupon{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/getCoupon");
    };
}
/// 查询VIP特权专享@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberRight_vipLevel{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberRight_vipLevel)))(self, @selector(jobs_get_vip_queryMemberRight_vipLevel)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberRight_vipLevel{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberRight/{vipLevel}");
    };
}
/// 查询VIP信息@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVip{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberVip)))(self, @selector(jobs_get_vip_queryMemberVip)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVip{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberVip");
    };
}
/// 查询VIP信息详情@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipDetail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberVipDetail)))(self, @selector(jobs_get_vip_queryMemberVipDetail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipDetail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberVipDetail");
    };
}
/// 查询VIP所有等级@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipLevels{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberVipLevels)))(self, @selector(jobs_get_vip_queryMemberVipLevels)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipLevels{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberVipLevels");
    };
}
/// 查询VIP所有优惠@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipRebates{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberVipRebates)))(self, @selector(jobs_get_vip_queryMemberVipRebates)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipRebates{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberVipRebates");
    };
}
/// 查询VIP所有权益@GET
-(URLManagerModel *_Nullable)get_vip_queryMemberVipRights{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryMemberVipRights)))(self, @selector(jobs_get_vip_queryMemberVipRights)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryMemberVipRights{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryMemberVipRights");
    };
}
/// 查询VIP权益开启关闭配置@GET
-(URLManagerModel *_Nullable)get_vip_queryVipSwitchConfig{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_vip_queryVipSwitchConfig)))(self, @selector(jobs_get_vip_queryVipSwitchConfig)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_vip_queryVipSwitchConfig{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/vip/queryVipSwitchConfig");
    };
}
#pragma mark —— 会员收货地址
/// 会员收货地址删除@DELETE
-(JobsRetURLManagerModelByStrBlock _Nonnull)delete_address_deleteByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/api/member/address/delete/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 会员收货地址详情@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_address_detailByID{
    return ^URLManagerModel *_Nullable(NSString *_Nullable ID){
        NSString *url = @"/api/member/address/detail/{".add(ID).add(@"}");
        return JobsURL(url);
    };
}
/// 会员收货地址查询@GET
-(URLManagerModel *_Nullable)get_address_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_address_list)))(self, @selector(jobs_get_address_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_address_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/address/list");
    };
}
/// 会员收货地址保存@POST
-(URLManagerModel *_Nullable)post_address_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_address_save)))(self, @selector(jobs_post_address_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_address_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/address/save");
    };
}
/// 会员收货地址修改@POST
-(URLManagerModel *_Nullable)post_address_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_address_update)))(self, @selector(jobs_post_address_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_address_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/address/update");
    };
}
#pragma mark —— 会员用户信息
/// 绑定邮箱@PUT
-(URLManagerModel *_Nullable)put_member_bindEmail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_bindEmail)))(self, @selector(jobs_put_member_bindEmail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_bindEmail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/bind-email");
    };
}
/// 绑定手机号@PUT
-(URLManagerModel *_Nullable)member_bindMobile_put{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_member_bindMobile_put)))(self, @selector(jobs_member_bindMobile_put)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_member_bindMobile_put{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/bind-mobile");
    };
}
/// 获取会员个人信息@GET
-(URLManagerModel *_Nullable)get_member_get{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_get)))(self, @selector(jobs_get_member_get)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_get{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/get");
    };
}
/// 获取会员个人信息@GET
-(URLManagerModel *_Nullable)get_member_getByMemberId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_getByMemberId)))(self, @selector(jobs_get_member_getByMemberId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_getByMemberId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/getByMemberId");
    };
}
/// 更新会员信息@PUT
-(URLManagerModel *_Nullable)put_member_memberUpdateLock{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_memberUpdateLock)))(self, @selector(jobs_put_member_memberUpdateLock)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_memberUpdateLock{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/memberUpdateLock");
    };
}
/// 获取会员门店id@GET
-(URLManagerModel *_Nullable)get_member_queryMemberStoreId{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_queryMemberStoreId)))(self, @selector(jobs_get_member_queryMemberStoreId)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_queryMemberStoreId{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/queryMemberStoreId");
    };
}
/// 刷新识别码@GET
-(URLManagerModel *_Nullable)get_member_refreshIdentityCode{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_refreshIdentityCode)))(self, @selector(jobs_get_member_refreshIdentityCode)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_refreshIdentityCode{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/refreshIdentityCode");
    };
}
/// 修改会员头像@PUT
-(URLManagerModel *_Nullable)put_member_updateAvatar{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateAvatar)))(self, @selector(jobs_put_member_updateAvatar)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateAvatar{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/update-avatar");
    };
}
/// 修改会员生日@PUT
-(URLManagerModel *_Nullable)put_member_updateBirthday{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateBirthday)))(self, @selector(jobs_put_member_updateBirthday)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateBirthday{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/update-birthday");
    };
}
/// 修改会员昵称@PUT
-(URLManagerModel *_Nullable)put_member_updateNickname{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateNickname)))(self, @selector(jobs_put_member_updateNickname)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateNickname{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/update-nickname");
    };
}
/// 修改会员密码@PUT
-(URLManagerModel *_Nullable)put_member_updatePassword{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updatePassword)))(self, @selector(jobs_put_member_updatePassword)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updatePassword{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/update-password");
    };
}
/// 修改会员性别@PUT
-(URLManagerModel *_Nullable)put_member_updateSex{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateSex)))(self, @selector(jobs_put_member_updateSex)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateSex{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/update-sex");
    };
}
/// 更新会员信息@PUT
-(URLManagerModel *_Nullable)put_member_updateMemberInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateMemberInfo)))(self, @selector(jobs_put_member_updateMemberInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateMemberInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/updateMemberInfo");
    };
}
/// 更新当前会员识别码@PUT
-(URLManagerModel *_Nullable)put_member_updateRandomIdentifiert{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_member_updateRandomIdentifiert)))(self, @selector(jobs_put_member_updateRandomIdentifiert)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_member_updateRandomIdentifiert{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/updateRandomIdentifier");
    };
}
#pragma mark —— 会员用户认证
/// 账号密码登录@POST
-(URLManagerModel *_Nullable)post_user_auth_accountLogin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_accountLogin)))(self, @selector(jobs_post_user_auth_accountLogin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_accountLogin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/account-login");
    };
}
/// 账号密码注册@POST
-(URLManagerModel *_Nullable)post_user_auth_accountRegister{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_accountRegister)))(self, @selector(jobs_post_user_auth_accountRegister)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_accountRegister{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/account-register");
    };
}
/// 校验登录校验码@POST
-(URLManagerModel *_Nullable)post_user_auth_check_login_verification{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_check_login_verification)))(self, @selector(jobs_post_user_auth_check_login_verification)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_check_login_verification{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/check/login/verification");
    };
}
/// 校验图片验证码@GET
-(URLManagerModel *_Nullable)get_user_auth_check_verification_result{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_auth_check_verification_result)))(self, @selector(jobs_get_user_auth_check_verification_result)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_check_verification_result{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/check/verification/result");
    };
}
/// 获取访问图形校验码的站点类型（1为国外地址校验，2为国内地址校验）@GET
-(URLManagerModel *_Nullable)get_user_auth_get_verification_domainType{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_auth_get_verification_domainType)))(self, @selector(jobs_get_user_auth_get_verification_domainType)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_get_verification_domainType{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/get/verification/domainType");
    };
}
/// 获取图片验证码@GET
-(URLManagerModel *_Nullable)get_user_auth_get_verification_image{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_auth_get_verification_image)))(self, @selector(jobs_get_user_auth_get_verification_image)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_get_verification_image{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/get/verification/image");
    };
}
/// 玩家登录心跳@GET
-(URLManagerModel *_Nullable)get_user_auth_heartbeat{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_auth_heartbeat)))(self, @selector(jobs_get_user_auth_heartbeat)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_heartbeat{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/heartbeat");
    };
}
/// 用户登出@POST
-(URLManagerModel *_Nullable)post_user_auth_logout{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_logout)))(self, @selector(jobs_post_user_auth_logout)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_logout{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/logout");
    };
}
/// 手机登录@POST
-(URLManagerModel *_Nullable)post_user_auth_mobileLogin{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_mobileLogin)))(self, @selector(jobs_post_user_auth_mobileLogin)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_mobileLogin{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        /// 登入這隻 如果有錯誤 不會拋錯會回復這個
        /// {
        ///     "code":200,
        ///     "msg":"SUCCESS",
        ///     "data":{
        ///         "accessToken":null,
        ///         "expireTime":0
        ///     }
        /// };return JobsURL(@"/api/user/auth/mobile-login");
    };
}
/// 手机号登录--手机号校验@GET
-(URLManagerModel *)get_user_auth_mobile_loginCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode{
    NSString *url = @"/api/user/auth/mobile-loginCheckByMobile/{"
        .add(mobile)
        .add(@"/{")
        .add(phoneCode)
        .add(@"}");
    return JobsURL(url);
}
/// 使用手机号注册@POST
-(URLManagerModel *_Nullable)post_user_auth_mobileRegister{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_mobileRegister)))(self, @selector(jobs_post_user_auth_mobileRegister)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_mobileRegister{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/mobile-register");
    };
}
/// 手机号注册--验证码校验@GET
-(URLManagerModel *)get_user_auth_mobile_registerCheckByCode:(NSString *)mobile smsCode:(NSString *)smsCode{
    NSString *url = @"/api/user/auth/mobile-registerCheckByCode/{"
        .add(mobile)
        .add(@"/{")
        .add(smsCode)
        .add(@"}");
    return JobsURL(url);
}
/// 手机号注册--手机校验@GET
-(URLManagerModel *)get_user_auth_mobile_registerCheckByMobile:(NSString *)mobile phoneCode:(NSString *)phoneCode{
    NSString *url = @"/api/user/auth/mobile-registerCheckByMobile/{"
        .add(mobile)
        .add(@"/{")
        .add(phoneCode)
        .add(@"}");
    return JobsURL(url);
}
/// 手机号注册--自动生成账号@GET
-(URLManagerModel *_Nullable)get_user_auth_mobileRegisterCreatName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_auth_mobileRegisterCreatName)))(self, @selector(jobs_get_user_auth_mobileRegisterCreatName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_auth_mobileRegisterCreatName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/mobile-registerCreatName");
    };
}
/// 会员注册@POST
-(URLManagerModel *_Nullable)post_user_auth_ph_register_v1{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_ph_register_v1)))(self, @selector(jobs_post_user_auth_ph_register_v1)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_ph_register_v1{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/ph/register/v1");
    };
}
/// 找回密码-三步走-[step 1.] check-account@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkAccount{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_resetPassword_checkAccount)))(self, @selector(jobs_post_user_auth_resetPassword_checkAccount)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkAccount{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/reset-password/check-account");
    };
}
/// 找回密码-三步走-[step 2.] check-mobile@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkMobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_resetPassword_checkMobile)))(self, @selector(jobs_post_user_auth_resetPassword_checkMobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkMobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/reset-password/check-mobile");
    };
}
/// 在未登录的情况下进行密码重置@POST
/// 1、在未登录的情况下，获取手机验证码成功以后取得一个临时的修改密码专属的用户Token，再进行下一步操作
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_checkPasswordMobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_resetPassword_checkPasswordMobile)))(self, @selector(jobs_post_user_auth_resetPassword_checkPasswordMobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_checkPasswordMobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/reset-password/checkPasswordMobile");
    };
}
/// 在未登录的情况下进行密码重置@POST
/// 2、在上一步操作成功（取得一个临时的修改密码专属的用户Token）以后，此时加入最新修改的密码进行修改
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_setPassword{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_resetPassword_setPassword)))(self, @selector(jobs_post_user_auth_resetPassword_setPassword)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_setPassword{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/reset-password/setPassword");
    };
}
/// 在登录的情况下进行密码重置@POST
/// 找回密码-三步走-[step 3.] update-password@POST
-(URLManagerModel *_Nullable)post_user_auth_resetPassword_updatePassword{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_resetPassword_updatePassword)))(self, @selector(jobs_post_user_auth_resetPassword_updatePassword)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_resetPassword_updatePassword{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/reset-password/update-password");
    };
}
/// 刷新Token@POST
-(URLManagerModel *_Nullable)post_user_auth_tokenRefresh{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_auth_tokenRefresh)))(self, @selector(jobs_post_user_auth_tokenRefresh)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_auth_tokenRefresh{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/auth/token-refresh");
    };
}
#pragma mark —— 会员的虚拟币钱包地址管理
/// 已绑定手机号时绑定虚拟币钱包地址@POST
-(URLManagerModel *_Nullable)post_user_cryptocy_bind{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_cryptocy_bind)))(self, @selector(jobs_post_user_cryptocy_bind)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_cryptocy_bind{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/bind");
    };
}
/// 未绑定手机号时绑定虚拟币钱包地址@POST
-(URLManagerModel *_Nullable)post_user_cryptocy_bindWithPhone{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_cryptocy_bindWithPhone)))(self, @selector(jobs_post_user_cryptocy_bindWithPhone)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_cryptocy_bindWithPhone{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/bindWithPhone");
    };
}
/// 检查会员是否绑定手机号@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_checkMobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_cryptocy_checkMobile)))(self, @selector(jobs_get_user_cryptocy_checkMobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_checkMobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/check-mobile");
    };
}
/// 删除虚拟币地址@DELETE
-(URLManagerModel *_Nullable)delete_user_cryptocy{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_user_cryptocy)))(self, @selector(jobs_delete_user_cryptocy)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_user_cryptocy{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/delete");
    };
}
/// 获取会员虚拟币钱包地址列表@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_cryptocy_list)))(self, @selector(jobs_get_user_cryptocy_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/list");
    };
}
/// 获取支持的虚拟币列表@GET
-(URLManagerModel *_Nullable)get_user_cryptocy_list_support{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_cryptocy_list_support)))(self, @selector(jobs_get_user_cryptocy_list_support)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_cryptocy_list_support{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/cryptocy/list/support");
    };
}
#pragma mark —— 会员禁言记录接口
/// 根据状态查询会员禁言记录全量信息@GET
-(JobsRetURLManagerModelByStrBlock _Nonnull)get_user_banLog_all_status{
    @jobs_weakify(self)
    return ^URLManagerModel *(NSString * status){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *url = @"/api/user/banLog/all/{"
            .add(status)
            .add(@"}");
        return JobsURL(url);
    };
}
/// 查询会员禁言详情@POST
-(URLManagerModel *_Nullable)post_user_banLog_banInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_banLog_banInfo)))(self, @selector(jobs_post_user_banLog_banInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_banInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/banLog/banInfo");
    };
}
/// 批量解禁@POST
-(URLManagerModel *_Nullable)post_user_banLog_batchUntie{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_banLog_batchUntie)))(self, @selector(jobs_post_user_banLog_batchUntie)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_batchUntie{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/banLog/batchUntie");
    };
}
/// 查询会员禁言记录列表@POST
-(URLManagerModel *_Nullable)post_user_banLog_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_banLog_list)))(self, @selector(jobs_post_user_banLog_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/banLog/list");
    };
}
/// 新增会员禁言记录@POST
-(URLManagerModel *_Nullable)post_user_banLog_save{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_banLog_save)))(self, @selector(jobs_post_user_banLog_save)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_banLog_save{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/banLog/save");
    };
}
/// 修改会员禁言记录@PUT
-(URLManagerModel *_Nullable)put_user_banLog_update{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_put_user_banLog_update)))(self, @selector(jobs_put_user_banLog_update)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_put_user_banLog_update{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/banLog/update");
    };
}
#pragma mark —— 会员页面
/// 获取联系方式数据@GET
-(URLManagerModel *_Nullable)get_user_member_contact_info{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_member_contact_info)))(self, @selector(jobs_get_user_member_contact_info)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_contact_info{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/contact/info");
    };
}
/// 申请代理@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_create{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_member_joinUs_create)))(self, @selector(jobs_post_user_member_joinUs_create)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_create{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/create");
    };
}
/// 三方登录@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_createProxy{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_member_joinUs_createProxy)))(self, @selector(jobs_post_user_member_joinUs_createProxy)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_createProxy{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/createProxy");
    };
}
/// 获取登录信息@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_get_login_info{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_member_joinUs_get_login_info)))(self, @selector(jobs_post_user_member_joinUs_get_login_info)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_get_login_info{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/get/login/info");
    };
}
/// 获取代理待审核数据@GET
-(URLManagerModel *_Nullable)get_user_member_joinUs_info{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_member_joinUs_info)))(self, @selector(jobs_get_user_member_joinUs_info)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_joinUs_info{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/info");
    };
}
/// 清理登录@POST
-(URLManagerModel *_Nullable)post_user_member_joinUs_login_clean{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_member_joinUs_login_clean)))(self, @selector(jobs_post_user_member_joinUs_login_clean)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_member_joinUs_login_clean{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/login/clean");
    };
}
/// 获取首页登录状态joinus展示情况@GET
-(URLManagerModel *_Nullable)get_user_member_joinUs_status{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_member_joinUs_status)))(self, @selector(jobs_get_user_member_joinUs_status)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_member_joinUs_status{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/member/joinUs/status");
    };
}
#pragma mark —— 国家编码信息管理
/// 获取国家编码信息列表@GET
-(URLManagerModel *_Nullable)get_user_countrycode_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_countrycode_list)))(self, @selector(jobs_get_user_countrycode_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_countrycode_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/countrycode/list");
    };
}
#pragma mark —— 提供给游戏服务的Feign接口
/// 查询会员信息-根据memberId@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_userforgame_memberinfo)))(self, @selector(jobs_get_user_userforgame_memberinfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/userforgame/memberinfo");
    };
}
/// 查询会员信息-根据memberName@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfoByName{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_userforgame_memberinfoByName)))(self, @selector(jobs_get_user_userforgame_memberinfoByName)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfoByName{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/userforgame/memberinfoByName");
    };
}
/// 批量查询会员信息-根据memberNames@GET
-(URLManagerModel *_Nullable)get_user_userforgame_memberinfoByNames{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_userforgame_memberinfoByNames)))(self, @selector(jobs_get_user_userforgame_memberinfoByNames)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_userforgame_memberinfoByNames{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/userforgame/memberinfoByNames");
    };
}
/// updateMemberInfo@POST
-(URLManagerModel *_Nullable)post_user_userforgame_memberinfoUpdate{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_userforgame_memberinfoUpdate)))(self, @selector(jobs_post_user_userforgame_memberinfoUpdate)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_userforgame_memberinfoUpdate{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/userforgame/memberinfoUpdate");
    };
}
#pragma mark —— 电子钱包管理
/// 绑定电子钱包@POST
-(URLManagerModel *_Nullable)post_user_eWallets_bind{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_eWallets_bind)))(self, @selector(jobs_post_user_eWallets_bind)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_eWallets_bind{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/eWallets/bind");
    };
}
/// 删除电子钱包@GET
-(URLManagerModel *_Nullable)get_user_eWallets_delete{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_eWallets_delete)))(self, @selector(jobs_get_user_eWallets_delete)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_eWallets_delete{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/eWallets/delete");
    };
}
/// 获取会员电子钱包列表@GET
-(URLManagerModel *_Nullable)get_user_eWallets_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_eWallets_list)))(self, @selector(jobs_get_user_eWallets_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_eWallets_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/eWallets/list");
    };
}
#pragma mark —— 短信验证码接口
/// 校验短信验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_check{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verCode_check)))(self, @selector(jobs_post_user_verCode_check)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_check{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/verCode/check");
    };
}
/// 检查验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_checkCodeEmail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verCode_checkCodeEmail)))(self, @selector(jobs_post_user_verCode_checkCodeEmail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_checkCodeEmail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/verCode/checkCodeEmail");
    };
}
/// 检查手机验证码@POST
-(URLManagerModel *_Nullable)post_user_verCode_checkCodeMobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verCode_checkCodeMobile)))(self, @selector(jobs_post_user_verCode_checkCodeMobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_checkCodeMobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/verCode/checkCodeMobile");
    };
}
/// 发送短信验证码@POST
/// ❤️可以用于：注册、修改密码...❤️
-(URLManagerModel *_Nullable)post_user_verCode_sendSms{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verCode_sendSms)))(self, @selector(jobs_post_user_verCode_sendSms)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_sendSms{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        /// 會檢查账户是否已凍結
        /// 被凍結的錯誤碼  :
        /// {
        ///     "code":500,
        ///     "msg":"Your account has freeze",
        ///     "data":null
        /// };return JobsURL(@"/api/user/verCode/sendSms");
    };
}
/// 发送短信验证码@POST
/// ❤️只能用于登录❤️
-(URLManagerModel *_Nullable)post_user_verCode_sendSms_login{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verCode_sendSms_login)))(self, @selector(jobs_post_user_verCode_sendSms_login)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verCode_sendSms_login{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/verCode/sendSms/login");
    };
}
#pragma mark —— 邀请好友
/// 领取奖励@POST
-(URLManagerModel *_Nullable)post_member_invite_drawAward{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_member_invite_drawAward)))(self, @selector(jobs_post_member_invite_drawAward)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_member_invite_drawAward{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/drawAward");
    };
}
/// 生成邀请码@GET
-(URLManagerModel *_Nullable)get_member_invite_generateReferralCode{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_generateReferralCode)))(self, @selector(jobs_get_member_invite_generateReferralCode)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_generateReferralCode{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/generateReferralCode");
    };
}
/// 跑马灯@GET
-(URLManagerModel *_Nullable)get_member_invite_queryHorseRing{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryHorseRing)))(self, @selector(jobs_get_member_invite_queryHorseRing)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryHorseRing{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryHorseRing");
    };
}
/// 邀请详情流水分成奖励列表@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteBetAwardList{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteBetAwardList)))(self, @selector(jobs_get_member_invite_queryInviteBetAwardList)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteBetAwardList{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteBetAwardList");
    };
}
/// 查询邀请好友流水奖励配置@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteBetConfig{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteBetConfig)))(self, @selector(jobs_get_member_invite_queryInviteBetConfig)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteBetConfig{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteBetConfig");
    };
}
/// 邀请详情首存奖励列表@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteDepAward{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteDepAward)))(self, @selector(jobs_get_member_invite_queryInviteDepAward)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteDepAward{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteDepAward");
    };
}
/// 查询邀请好友首存奖励配置@GET
//-(URLManagerModel *)get_member_invite_queryInviteDepConfig{
//    return JobsURL(@"/api/member/invite/queryInviteDepConfig");
//}
/// 邀请信息@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteInfo{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteInfo)))(self, @selector(jobs_get_member_invite_queryInviteInfo)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteInfo{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteInfo");
    };
}
/// 邀请详情累计发放金额和邀请人数@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteInfoTotalAward{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteInfoTotalAward)))(self, @selector(jobs_get_member_invite_queryInviteInfoTotalAward)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteInfoTotalAward{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteInfoTotalAward");
    };
}
/// 查询邀请好友vip奖励配置@GET
-(URLManagerModel *_Nullable)get_member_invite_queryInviteVipConfig{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_member_invite_queryInviteVipConfig)))(self, @selector(jobs_get_member_invite_queryInviteVipConfig)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_member_invite_queryInviteVipConfig{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/member/invite/queryInviteVipConfig");
    };
}
#pragma mark —— 邮箱验证码接口
/// 发送邮箱验证码@POST
-(URLManagerModel *_Nullable)post_user_verify_sendEmail{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_verify_sendEmail)))(self, @selector(jobs_post_user_verify_sendEmail)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_verify_sendEmail{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/verify/sendEmail");
    };
}
#pragma mark —— 银行信息管理
/// 已绑定手机号时绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_bind{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_bankcard_bind)))(self, @selector(jobs_post_user_bankcard_bind)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_bind{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/bind");
    };
}
/// 未绑定手机号时绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_bindWithPhone{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_bankcard_bindWithPhone)))(self, @selector(jobs_post_user_bankcard_bindWithPhone)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_bindWithPhone{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/bindWithPhone");
    };
}
/// 获取会员卡数量@GET
-(URLManagerModel *_Nullable)get_user_bankcard_cardTotal{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_bankcard_cardTotal)))(self, @selector(jobs_get_user_bankcard_cardTotal)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_cardTotal{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/cardTotal");
    };
}
/// 绑卡前检查会员是否绑定手机号@GET
-(URLManagerModel *_Nullable)get_user_bankcard_checkMobile{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_bankcard_checkMobile)))(self, @selector(jobs_get_user_bankcard_checkMobile)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_checkMobile{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/check-mobile");
    };
}
/// 银行卡二要素校验@POST
-(URLManagerModel *_Nullable)post_user_bankcard_checkBankCardTripartiteHttp{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_bankcard_checkBankCardTripartiteHttp)))(self, @selector(jobs_post_user_bankcard_checkBankCardTripartiteHttp)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_checkBankCardTripartiteHttp{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/checkBankCardTripartiteHttp");
    };
}
/// 删除银行卡@DELETE
-(URLManagerModel *_Nullable)delete_user_bankcard{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_delete_user_bankcard)))(self, @selector(jobs_delete_user_bankcard)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_delete_user_bankcard{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/delete");
    };
}
/// 获取会员的银行卡列表@GET
-(URLManagerModel *_Nullable)get_user_bankcard_list{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_get_user_bankcard_list)))(self, @selector(jobs_get_user_bankcard_list)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_get_user_bankcard_list{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/list");
    };
}
/// 绑定银行卡@POST
-(URLManagerModel *_Nullable)post_user_bankcard_ph_bind{
    return (((JobsRetURLManagerModelByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSObject.class, @selector(jobs_post_user_bankcard_ph_bind)))(self, @selector(jobs_post_user_bankcard_ph_bind)))();
}

-(JobsRetURLManagerModelByVoidBlock _Nonnull)jobs_post_user_bankcard_ph_bind{
    @jobs_weakify(self)
    return ^URLManagerModel *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return JobsURL(@"/api/user/bankcard/ph/bind");
    };
}

@end
