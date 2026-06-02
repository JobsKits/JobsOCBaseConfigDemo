//
//  NSDateFormatter+Extra.m
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSDateFormatter+Extra.h"

@implementation NSDateFormatter (Extra)
/// 对系统方法 stringFromDate 的二次封装
-(JobsRetStrByDateBlock _Nonnull)stringByDate{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        return [self stringFromDate:date];
    };
}
/// 对系统方法 dateFromString 的二次封装
-(JobsRetDateByStrBlock _Nonnull)dateByString{
    @jobs_weakify(self)
    return ^NSDate *_Nullable(__kindof NSString *_Nullable date){
        @jobs_strongify(self)
        return [self dateFromString:date];
    };
}

@end
