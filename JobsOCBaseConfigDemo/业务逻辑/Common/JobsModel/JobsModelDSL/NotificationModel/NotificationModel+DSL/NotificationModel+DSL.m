//
//  NotificationModel+DSL.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "NotificationModel+DSL.h"

@implementation NotificationModel (DSL)
-(JobsRetNotificationModelByStrBlock _Nonnull)byNotificationName{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.notificationName = data;
        return self;
    };
}

-(JobsRetNotificationModelByDicBlock _Nonnull)byUserInfo{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nullable(NSDictionary * _Nullable data) {
        @jobs_strongify(self)
        self.userInfo = data;
        return self;
    };
}

-(JobsRetNotificationModelByIDBlock _Nonnull)byAnObject{
    @jobs_weakify(self)
    return ^__kindof NotificationModel *_Nullable(id _Nullable data) {
        @jobs_strongify(self)
        self.anObject = data;
        return self;
    };
}

@end
