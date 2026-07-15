//
//  JobsAppDoorModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsAppDoorModel_h
#define JobsAppDoorModel_h

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefines.h"

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

#endif /* JobsAppDoorModel_h */
