//
//  NSObject+Extra.m
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(NSString *_Nullable)localStringWithKey:(nonnull NSString *)key{
    return NSLocalizedString(key, nil);
}

+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle{
    return NSLocalizedStringFromTableInBundle(key,
                                              tableName,
                                              bundle ? : NSBundle.mainBundle,
                                              nil);
}

@end
