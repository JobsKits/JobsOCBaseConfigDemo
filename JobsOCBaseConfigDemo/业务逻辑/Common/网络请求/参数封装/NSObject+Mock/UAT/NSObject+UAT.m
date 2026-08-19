//
//  NSObject+UAT.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+UAT.h"

@implementation NSObject (UAT)
#pragma mark —— 登录
/// 手机号码：09970000001
/// 验证码：888
/// 账号（用户名）：dev023
/// 密码：Jobs29506045^
/// 手机验证码登录
-(JobsRetFMDoorModelByVoidBlock _Nonnull)mock_uat_login_data1{
    @jobs_weakify(self)
    return ^FMDoorModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.byCaptcha_id(@"")
                .byCaptcha_key(@"")
                .byCaptcha_output(@"")
                .byCountryCode(@"CN")/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
                .byDomain(@"")
                .byGen_time(@"")
                .byInviteCode(@"")/// 代理邀请码
                .byLot_number(@"")
                .byMobile(@"09970000001")/// 手机号 09970000001
                .byPass_token(@"")
                .byPassword(@"Jobs29506045^")/// 密码 Jobs29506045^
                .byReferCode(@"")
                .bySmsCode(@"888")/// 短信验证码 888
                .byUserName(@"dev023");/// 用户名 dev023
        });
    };
}
/// 手机号码：09970000002
/// 验证码：888
/// 账号（用户名）：JobsGo
/// 密码：Jobs29506045^
/// 备注：账密登录
-(JobsRetFMDoorModelByVoidBlock _Nonnull)mock_uat_login_data2{
    @jobs_weakify(self)
    return ^FMDoorModel *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeDoorModel(^(__kindof FMDoorModel *_Nullable data) {
            data.byCaptcha_id(@"")
                .byCaptcha_key(@"")
                .byCaptcha_output(@"")
                .byCountryCode(@"PH")/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
                .byDomain(@"")
                .byDomainName(@"")/// 好友邀请域名
                .byGen_time(@"")
                .byInviteName(@"")/// 好友邀请人账号
                .byInviteCode(@"")/// 代理邀请码
                .byLot_number(@"")
                .byMobile(@"09970000002")/// 手机号 09970000002
                .byPass_token(@"")
                .byPassword(@"Jobs29506045^")/// 密码 Jobs29506045^
                .byReferCode(@"")
                .bySmsCode(@"888")/// 短信验证码 888
                .byUserName(@"JobsGo");/// 账号（用户名）：pendlessk01
        });
    };
}
#pragma mark —— 注册
/// 电话号码：09970000001
/// 密码：Jobs29506045^
/// 用户名：dev023
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data1{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.byCaptcha_key(@"")
                .byCaptcha_id(Guard(model.result.captcha_id))
                .byCaptcha_output(Guard(model.result.captcha_output))
                .byGen_time(Guard(model.result.gen_time))
                .byLot_number(Guard(model.result.lot_number))
                .byPass_token(Guard(model.result.pass_token))
                .byCountryCode(@"PH")/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
                .byDomain(@"")
                .byInviteCode(@"")/// 代理邀请码
                .byMobile(@"09970000001")
                .byPassword(@"Jobs29506045^")/// 密码
                .byReferCode(@"")/// 好友邀请码
                .bySmsCode(@"888")/// 短信验证码
                .byUserName(@"dev023");/// 账号（用户名）：dev023
        });
    };
}
/// 电话号码：09970000002
/// 密码：Jobs29506045^
/// 用户名：JobsGo
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_signUP_data2{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.byCaptcha_key(@"")
                .byCaptcha_id(Guard(model.result.captcha_id))
                .byCaptcha_output(Guard(model.result.captcha_output))
                .byGen_time(Guard(model.result.gen_time))
                .byLot_number(Guard(model.result.lot_number))
                .byPass_token(Guard(model.result.pass_token))
                .byCountryCode(@"PH")/// 国家编码两位码(中国CN、越南VN)-国家的ISO 3166-1 Alpha-2代码
                .byDomain(@"")
                .byInviteCode(@"")/// 代理邀请码
                .byMobile(@"09970000002")
                .byPassword(@"Jobs29506045^")/// 密码
                .byReferCode(@"")/// 好友邀请码
                .bySmsCode(@"888")/// 短信验证码
                .byUserName(@"JobsGo");/// 用户名
        });
    };
}
#pragma mark —— 发送验证码
/// 电话号码：09970000001
/// 用户名：dev023
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data1{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.byActionType(@(USERTYPE_REGISTER))
                .byBusinessSource(@(BUSINESSSOURCE_MEMBER))/// 业务来源（1.会员 2.代理）默认会员
                .byCallFlag(@"")/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
                .byCaptcha_id(model.result.captcha_id)
                .byCaptcha_key(@"")
                .byCaptcha_output(model.result.captcha_output)
                .byDomain(@"")
                .byGen_time(model.result.gen_time)
                .byLot_number(model.result.lot_number)
                .byMobile(@"09970000001")///
                .byMobileArea(@"63")/// 区号代码
                .byPass_token(model.result.pass_token)
                .byUserName(@"dev023");/// 会员/代理账号
        });
    };
}
/// 电话号码：09970000002
/// 用户名：JobsGo
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_uat_smsCode_data2{
    return ^__kindof FMDoorModel *_Nullable(__kindof GTCaptcha4Model *_Nullable model){
        return jobsMakeDoorModel(^(__kindof FMDoorModel * _Nullable data) {
            data.byActionType(@(USERTYPE_REGISTER))
                .byBusinessSource(@(BUSINESSSOURCE_MEMBER))/// 业务来源（1.会员 2.代理）默认会员
                .byCallFlag(@"")/// 调用标识，用于判断是app还是后台管理，默认为空，为空则需要校验图形验证码（1.代理服务）
                .byCaptcha_id(model.result.captcha_id)
                .byCaptcha_key(@"")
                .byCaptcha_output(model.result.captcha_output)
                .byDomain(@"")
                .byGen_time(model.result.gen_time)
                .byLot_number(model.result.lot_number)
                .byMobile(@"09970000002")///
                .byMobileArea(@"63")/// 区号代码
                .byPass_token(model.result.pass_token)
                .byUserName(@"JobsGo");/// 会员/代理账号
        });
    };
}
#pragma mark —— 忘记密码

@end
