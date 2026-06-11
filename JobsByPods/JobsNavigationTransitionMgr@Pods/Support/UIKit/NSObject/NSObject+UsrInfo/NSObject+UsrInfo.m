//
//  NSObject+UsrInfo.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/15.
//

#import "NSObject+UsrInfo.h"

@implementation NSObject (UsrInfo)
#pragma mark —— 全局的用户数据(存、取、清)[全局唯一一份用户档案]
/// 登出清空用户数据 【用户信息】/【JobsUserModel】
-(jobsByVoidBlock _Nonnull)logOut{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        self.deleteUserInfoByUserName(用户信息);
    };
}
/// 保存用户数据（用 NSUserDefaults ）【用户信息】/【JobsUserModel】
-(jobsByUserModelBlock _Nonnull)saveUserInfo{
    @jobs_weakify(self)
    return ^(JobsUserModel <NSCoding> *_Nullable userModel) {
        @jobs_strongify(self)
        self.jobsSaveUserInfo(userModel,用户信息);
    };
}
/// 读取用户信息【用户信息】/【JobsUserModel】
-(JobsUserModel <NSCoding>*_Nullable)readUserInfo{
    return self.jobsReadUserInfo(用户信息);
}
/// 保存用户数据
-(jobsByIDAndKeyBlock _Nonnull)jobsSaveUserInfo{
    return ^(NSObject <NSCoding> * _Nonnull userModel,
             NSString * _Nullable key) {
        NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
            data.byObj(userModel)
                .byKey(key);
        }));
    };
}
/// 读取用户信息
-(JobsRetIDByStrBlock _Nonnull)jobsReadUserInfo{
    @jobs_weakify(self)
    return ^id _Nullable(NSString *_Nullable data) {
        @jobs_strongify(self)
        return self.readUserInfoByUserName(nil,data);
    };
}
#pragma mark —— 保存特定的用户数据（不随登出清空数据）[全局多份用户档案]
///【通过特定的用户名】 保存（更新）用户的本地资料（用 NSUserDefaults ）
-(jobsByUserModelBlock _Nonnull)userNameToSaveUserInfo{
    return ^(JobsUserModel <NSCoding>*_Nullable userModel){
        NSUserDefaults.updateWithModel(jobsMakeUserDefaultModel(^(UserDefaultModel * _Nonnull data) {
            data.byObj(userModel)
                .byKey(userModel.userName);
        }));
    };
}
///【通过特定的用户名】 读取用户的本地资料
-(JobsRetIDByClsAndSaltStrBlock _Nonnull)readUserInfoByUserName{
    return ^id _Nullable(Class _Nonnull cls,NSString *_Nullable userName){
        NSData *archivedData = NSUserDefaults.readWithKey(userName);
        if(archivedData){
            if(self.systemVersion.floatValue < 12.0){
                SuppressWdeprecatedDeclarationsWarning(return [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];);
            }else{
                NSError *error = nil;
                id userModel = nil;
                /// 如果 JobsUserModel 中包含更多自定义类型或者你需要解码其他基本类型（例如 NSArray 或 NSDictionary），需要将这些类也加入到 allowedClasses 集合中。
                /// 确保在解码所有需要的类时，将其包含在 allowedClasses 集合中以避免警告和潜在的解码失败。例如
                userModel = [NSKeyedUnarchiver unarchivedObjectOfClasses:jobsMakeMutSet(^(__kindof NSMutableSet <Class>*_Nullable data) {
                    data.add(JobsUserModel.class)
                    .add(NSString.class)
                    .add(NSNumber.class)
                    .add(NSArray.class)
                    .add(NSDictionary.class)
                    .add(UIImage.class)
                    .add(NSArray.class)
                    .add(cls);
                })fromData:archivedData error:&error];
                if (!userModel) {
                    JobsLog(@"解档失败: %@", error.localizedDescription);
                    /// 没取到用户数据，就直接跳登录
    //                self.toLogin();
                };return userModel;
            }
        }else{
            JobsLog(@"解档失败:需要被解档的数据为空");
            return nil;
        }
    };
}
///【通过特定的用户名】 删除该用户的本地资料
-(jobsByStrBlock _Nonnull)deleteUserInfoByUserName{
    return ^(NSString *_Nullable userName) {
        NSUserDefaults.deleteWithKey(userName);
    };
}
#pragma mark —— 全局保存和删除已经登录成功的用户名
/// 全局保存已经登录成功 且 并未删除的用户名组
-(jobsByStrBlock _Nonnull)saveUserName{
    return ^(NSString *_Nullable userName){
        if (isNull(userName)) return;
        JobsSetUserDefaultKeyWithObject(用户名数组, jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.addBy(JobsUserDefaults.valueForKey(用户名数组));
            if (!data.containsObject(userName)) data.add(userName);// 保持唯一性
        }));JobsUserDefaultSynchronize;
    };
}
/// 读取用户名组
-(NSArray *_Nullable)readUserNameMutArr{
    return JobsUserDefaults.valueForKey(用户名数组);
}
/// 全局删除已经登录成功的用户名
-(jobsByStrBlock _Nonnull)deleteUserName{
    return ^(NSString *_Nullable userName){
        JobsSetUserDefaultKeyWithObject(用户名数组, jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.addBy(JobsUserDefaults.valueForKey(用户名数组));
            if (isValue(userName)) data.remove(userName);
        }));JobsUserDefaultSynchronize;
    };
}

@end
