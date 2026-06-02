//
//  NSDictionary+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSDictionary+Extra.h"

@implementation NSDictionary (Extra)
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByIDBlock _Nonnull)objectForKey{
    @jobs_weakify(self)
    return ^(id key) {
        @jobs_strongify(self)
        id value = nil;
        if (isValue(key)) {
            @try {
                value = [self objectForKey:key];
            }
            @catch (NSException *exception) {
                JobsLog(@"Exception while fetching value for key '%@': %@", key, exception);
                value = nil; // 返回 nil 或者自定义的默认值
            }
        } else {
            JobsLog(@"Invalid key: '%@' does not conform to the required format.", key);
        }return value;
    };
}

@end
