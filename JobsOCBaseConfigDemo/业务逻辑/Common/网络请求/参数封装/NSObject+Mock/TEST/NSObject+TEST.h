//
//  NSObject+TEST.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 测试环境
@interface NSObject (TEST)
#pragma mark —— 登录
/// 手机号码：
/// 验证码：
/// 账号（用户名）：
/// 密码：
/// 手机验证码登录
-(FMDoorModel *)mock_test_login_data1;
/// 手机号码：
/// 验证码：
/// 账号（用户名）：
/// 密码：
/// 账密登录
-(FMDoorModel *)mock_test_login_data2;
#pragma mark —— 注册
/// 电话号码：
/// 密码：
/// 用户名：
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_signUP_data1;
/// 电话号码：
/// 密码：
/// 用户名：
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_signUP_data2;
#pragma mark —— 发送验证码
/// 电话号码：
/// 用户名：
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_smsCode_data1;
/// 电话号码：
/// 用户名：
-(JobsRetDoorModelByGTCaptcha4ModelBlock _Nonnull)mock_test_smsCode_data2;
#pragma mark —— 忘记密码

@end

NS_ASSUME_NONNULL_END
