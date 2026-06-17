//
//  JobsAppDoorModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorModel : NSObject

Prop_copy()NSString *userName;// 用户名
Prop_copy()NSString *password;// 密码
Prop_copy()NSString *confirmPassword;// 确认密码
Prop_copy()NSString *tel;// 电话号码
Prop_copy()NSString *verificationCode;// 手机验证码

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsAppDoorModel *_Nonnull jobsMakeAppDoorModel (jobsByAppDoorModelBlock _Nonnull block){
    JobsAppDoorModel *data = JobsAppDoorModel.alloc.init;
    if (block) block(data);
    return data;
}
