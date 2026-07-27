//
//  NSObject+UserInfo.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2021/12/1.
//

#import "NSObject+UserInfo.h"

@implementation NSObject (UserInfo)
/**

 【鉴别目前是否登录】
 【标准】判定的标准 = 用户数据存在➕用户数据中Token的值非空➕Token过期时间存在➕Token是否已经过期
 【return】 YES(已经登录)、NO（未登录）
 */
-(BOOL)isLogin{
    JobsLog(@"userInfo = %@",self.doorModel);
    JobsLog(@"Token = %@",self.doorModel.token);
    if(isValue(self.doorModel.expireTime)){
        JobsLog(@"当前时间为:%@, Token过期时间为:%@", NSDate.date, self.doorModel.expireTime.chinaTime(nil));
    }
    /// 模型都没有建立肯定是没有登录的
    if(!self.doorModel) return NO;
    /// Token 都没有肯定也是没有登录的
    if(isNull(self.doorModel.token)) return NO;
//    /// 存在过期时间，则鉴别过期时间以判断是否登录
//    if(isValue(self.doorModel.expireTime)) {
//        /// 登录是否过期：过期 === 未登录
//        return self.isLoginByExpiredTime(self.doorModel.expireTime);
//    }
    else return YES;/// 过期时间都没有，肯定也是没有登录的
}
/// 判定是否登录的标准1：是否本地存在用户数据模型 + 是否存在Token
-(BOOL)isLoginByToken{
    /// 模型都没有建立肯定是没有登录的
    if(self.doorModel) return YES;
    /// Token 都没有肯定也是没有登录的
    if(isValue(self.doorModel.token)) return YES;
    return NO;
}
/// 判定是否登录的标准2
/// 登录是否过期：没有过期时间 ===  已经过期
-(JobsRetBOOLByStrBlock _Nonnull)isLoginByExpiredTime{
    return ^BOOL(NSString *_Nullable data){
        if(isValue(data)){
            return !data.isExpired();
        };return NO;
    };
}
/// 检查是否登录并执行传入的代码块
-(void)isLogin:(jobsByVoidBlock _Nullable)loginedinBlock{
    if (self.isLogin) {
        if (loginedinBlock) loginedinBlock();
    } else self.toLogin();
}
/// 刷新用户Token
-(jobsByVoidBlock _Nonnull)refreshUserToken{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(self.isLogin){
            /// 如果Token过期，则跳转登录获取，以刷新Token
            self.toLogin();
        }
    };
}
/// 刷新用户Token（仅删除本地的用户数据）
-(jobsByVoidBlock _Nonnull)refreshUserToken2{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        if(!(self.isLoginByToken &&
             self.isLoginByExpiredTime((self.doorModel.expireTime)))){
            self.deleteUserInfoByUserName(用户信息);/// 清理本地用户数据
        }
    };
}

@end
