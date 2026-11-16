//
//  JobsDefineDoorEnums.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsDefineDoorEnums_h
#define JobsDefineDoorEnums_h
#pragma mark —— 入口相关
/// 入口@模式
#ifndef CURRENT_PAGE_ENUM_DEFINED
#define CURRENT_PAGE_ENUM_DEFINED
typedef NS_ENUM(NSInteger, CurrentPage) {
    CurrentPage_Login = 0,    // 登录
    CurrentPage_Register,     // 注册
    CurrentPage_ForgotCode    // 忘记密码
};
#endif /* CURRENT_PAGE_ENUM_DEFINED */
/// 入口@登录方式
#ifndef LOGINMODE
#define LOGINMODE
typedef NS_ENUM(NSInteger, LoginType) {
    LoginType_Silent = 0,     // 登录方式@静默登录（只在账密登录成功后有效）
    LoginType_Manual,         // 登录方式@非静默登录
};
#endif /* LOGINMODE */

#endif /* JobsDefineDoorEnums_h */
