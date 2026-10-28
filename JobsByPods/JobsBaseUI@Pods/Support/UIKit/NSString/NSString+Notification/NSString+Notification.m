//
//  NSString+Notification.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Notification.h"

@implementation NSString (Notification)

-(jobsByIDBlock _Nonnull)postNotificationBy{
    @jobs_weakify(self)
    return ^(id _Nullable data){
        @jobs_strongify(self)
        [JobsNotificationCenter postNotificationName:self object:data];
    };
}

-(jobsByNotificationModelBlock _Nonnull)postNotificationByModel{
    @jobs_weakify(self)
    return ^(NotificationModel *_Nullable data){
        @jobs_strongify(self)
        [JobsNotificationCenter postNotificationName:self
                                              object:data.anObject
                                            userInfo:data.userInfo];
    };
}

@end
