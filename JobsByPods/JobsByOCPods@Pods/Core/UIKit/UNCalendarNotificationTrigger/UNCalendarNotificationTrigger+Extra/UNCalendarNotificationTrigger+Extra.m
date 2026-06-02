//
//  UNCalendarNotificationTrigger+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UNCalendarNotificationTrigger+Extra.h"

@implementation UNCalendarNotificationTrigger (Extra)
/// 创建一个不重复触发的日历通知触发器
+(JobsRetCalendarNotificationTriggerByComponentsBlock _Nonnull)initByNORepeats{
    return ^__kindof UNCalendarNotificationTrigger *_Nullable(NSDateComponents *_Nullable data){
        return [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:data repeats:NO];
    };
}
/// 创建一个重复触发的日历通知触发器
+(JobsRetCalendarNotificationTriggerByComponentsBlock _Nonnull)initByRepeats{
    return ^__kindof UNCalendarNotificationTrigger *_Nullable(NSDateComponents *_Nullable data){
        return [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:data repeats:YES];
    };
}

@end
