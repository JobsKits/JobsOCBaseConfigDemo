//
//  JobsDefineNetworkingEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineNetworkingEnums_h
#define JobsDefineNetworkingEnums_h
#pragma mark —— 网络相关
/// 网络相关@环境
#ifndef JOBS_NETWORKING_ENVIR_ENUM_DEFINED
#define JOBS_NETWORKING_ENVIR_ENUM_DEFINED
typedef NS_ENUM(NSInteger, JobsNetworkingEnvir) {
    JobsNetworkingEnvir_Undefined = 0,
    JobsNetworkingEnvir_Dev,    // 环境@开发
    JobsNetworkingEnvir_Test,   // 环境@测试
    JobsNetworkingEnvir_UAT,    // 环境@UAT
    JobsNetworkingEnvir_Product,// 环境@生产
};
#endif /* JOBS_NETWORKING_ENVIR_ENUM_DEFINED */
/// 网络相关@数据来源
#ifndef JOBS_NETWORK_SOURCE_TYPE_DEFINED
#define JOBS_NETWORK_SOURCE_TYPE_DEFINED
typedef NS_ENUM(NSUInteger, JobsNetworkSourceType) {
    JobsNetworkSourceTypeUnknown = 0,
    JobsNetworkSourceTypeWiFi,
    JobsNetworkSourceTypeCellular
};
#endif /* JOBS_NETWORK_SOURCE_TYPE_DEFINED */
/// 网络相关@接口状态码
///【后端定义】请求数据返回的状态码、根据自己的服务端数据来
///【需要权限的接口】请求头加上authorization字段，值为服务器颁发的jwt令牌。令牌无感刷新，需实时更新
#ifndef HTTP_RESPONSE_CODE_ENUM_DEFINED
#define HTTP_RESPONSE_CODE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, HTTPResponseCode) {
    HTTPResponseCodeServeError = 10005,                 // 行为@服务器异常
    HTTPResponseCodeSuccess = 200,                      // 行为@请求成功
    HTTPResponseCodeNoToken = 401,                      // 行为@令牌不能为空
    HTTPResponseCodeLoginFailed = 1002000000,           // 行为@登录失败：账密错误
    HTTPResponseCodeAuthorizationFailure = 2,           // 行为@授权失败
    HTTPResponseCodeLeakTime = 4,                       // 行为@限定时间内超过请求次数
    HTTPResponseCodeRiskOperation = 6,                  // 行为@风险操作
    HTTPResponseCodeNoSettingTransactionPassword = 7,   // 行为@未设置交易密码
    HTTPResponseCodeOffline = 8,                        // 行为@账号已在其他设备登录
    HTTPResponseCodeTokenExpire = 10009,                // 行为@Token过期
    HTTPResponseCodePhoneNumberNotExist = 1002000034,   // 行为@手机号码不存在
    HTTPResponseCodeNoOK = 500,                         // 行为@服务器错误
    HTTPResponseCodeAccountLocked = 1002000035,         // 行为@账户被锁
    HTTPResponseCodeWithDrawMaintenance = 1006000014    // 行为@提现功能维护
    ///其他代号，展示msg内容即可
};
#endif /* HTTP_RESPONSE_CODE_ENUM_DEFINED */

#endif /* JobsDefineNetworkingEnums_h */
