//
//  UserDefaultModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef UserDefaultModel_h
#define UserDefaultModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultModel : BaseModel
// 对象
Prop_strong(nullable)__kindof NSObject <NSCoding>*obj;
// 基本数据类型
Prop_assign()int intValue;
Prop_assign()float floatValue;
Prop_assign()BOOL booLValue;
Prop_assign()NSInteger NSIntValue;
Prop_assign()CGFloat CGfloatValue;
// key
Prop_copy(nonnull)NSString *key;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof UserDefaultModel *_Nonnull jobsMakeUserDefaultModel(jobsByUserDefaultModelBlock _Nonnull block){
    UserDefaultModel *data = UserDefaultModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* UserDefaultModel_h */
