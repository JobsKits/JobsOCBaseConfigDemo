//
//  NSCalendar+Extra.m
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSCalendar+Extra.h"

@implementation NSCalendar (Extra)
/// 对系统方法 calendarWithIdentifier 的二次封装
+(JobsRetCalendarByCalendarIdentifierBlock _Nonnull)initBy{
    return ^__kindof NSCalendar *_Nullable(NSCalendarIdentifier _Nullable data){
        return [NSCalendar calendarWithIdentifier:data];
    };
}
/// 对系统方法 dateFromComponents 的二次封装
-(JobsRetDateByDateComponentsBlock _Nonnull)dateByComponents{
    @jobs_weakify(self)
    return ^__kindof NSDate *_Nullable(NSDateComponents *_Nullable data){
        @jobs_strongify(self)
        return [self dateFromComponents:data];
    };
}
/// 对系统方法 initWithCalendarIdentifier 的二次封装
+(JobsRetCalendarByCalendarIdentifierBlock _Nonnull)initByCalendarIdentifier{
    @jobs_weakify(self)
    return ^__kindof NSCalendar *_Nullable(NSCalendarIdentifier _Nullable data){
        @jobs_strongify(self)
        return [self.class.alloc initWithCalendarIdentifier:data];
    };
}

@end
