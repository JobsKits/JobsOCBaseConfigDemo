//
//  UNNotificationRequestModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "UNNotificationRequestModel+DSL.h"

@implementation UNNotificationRequestModel (DSL)

#pragma mark —— 来自 UNNotificationRequestModel
-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentifier{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.identifier = data;
        return self;
    };
}

-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(UNNotificationContent * data))byContent{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nonnull(UNNotificationContent * data) {
        @jobs_strongify(self)
        self.content = data;
        return self;
    };
}

-(__kindof UNNotificationRequestModel *_Nonnull (^ _Nonnull)(UNNotificationTrigger * data))byTrigger{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nonnull(UNNotificationTrigger * data) {
        @jobs_strongify(self)
        self.trigger = data;
        return self;
    };
}

@end
