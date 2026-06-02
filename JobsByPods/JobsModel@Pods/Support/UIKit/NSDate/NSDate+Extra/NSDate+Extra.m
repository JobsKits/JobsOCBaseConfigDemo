//
//  NSDate+Extra.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)
/// 创建一个基于 1970年1月1日00:00:00 UTC 时间 的 NSDate 对象
/// 基准时间点：1970 年 1 月 1 日 00:00
/// 入参data：秒数，计算距离 1970 的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)initDateBy{
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSince1970:data];
    };
}
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)dateSince{
    /// data 表示从当前时间开始的时间间隔（单位为秒，正值表示未来时间，负值表示过去时间）
    return ^NSDate *_Nullable(NSTimeInterval data){
        return [NSDate dateWithTimeIntervalSinceNow:data];
    };
}
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSDateFormatter *）缺省标准：年/月/日
-(JobsRetStrByDateFormatterBlock _Nonnull)toReadableTime{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        if(!data){
            data = jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable data) {
                data.dateFormat = @"yyyy-MM-dd";
            });
        }return data.stringByDate(self);
    };
}

@end
