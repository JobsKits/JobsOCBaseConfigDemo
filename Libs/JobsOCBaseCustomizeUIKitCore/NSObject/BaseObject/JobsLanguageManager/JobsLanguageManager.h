//
//  JobsLanguageManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 7/5/24.
//

#import <Foundation/Foundation.h>
#import "JobsBlock.h"
#import "JobsDefineEnums.h"
#import "JobsUserDefaultDefine.h"
#import "JobsDefineConstString.h"
#import "NSBundle+Extra.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsLanguageManager : NSObject
/// 获取和设置当前语言
Prop_assign(class)AppLanguage language;
/// 语言包路径
+(NSBundle *_Nullable)bundle;
/// 通过key取值对应的语言
+(JobsRetStrByStrBlock _Nonnull)localStringByKey;
/// 枚举和语言字符串的转换
+(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage;
-(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage;

@end

NS_ASSUME_NONNULL_END
