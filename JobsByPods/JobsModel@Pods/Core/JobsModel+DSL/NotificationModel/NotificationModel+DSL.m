//
//  NotificationModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "NotificationModel+DSL.h"

@implementation NotificationModel (DSL)

#pragma mark —— 来自 NotificationModel
-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byNotificationName{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.notificationName = data;
        return self;
    };
}

-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byUserInfo{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nonnull(NSDictionary * data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(__kindof NotificationModel *_Nonnull (^ _Nonnull)(id data))byAnObject{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nonnull(id data) {
        @jobs_strongify(self)
        self.anObject = data;
        return self;
    };
}

@end
