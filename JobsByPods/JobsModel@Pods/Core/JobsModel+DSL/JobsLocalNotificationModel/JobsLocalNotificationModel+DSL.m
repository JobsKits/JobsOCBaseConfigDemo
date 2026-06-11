//
//  JobsLocalNotificationModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsLocalNotificationModel+DSL.h"

@implementation JobsLocalNotificationModel (DSL)

#pragma mark —— 来自 JobsLocalNotificationModel
-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byIdentifier{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.identifier = data;
        return self;
    };
}

-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSString * data))byBody{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.body = data;
        return self;
    };
}

-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(UNNotificationSound * data))bySound{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(UNNotificationSound * data) {
        @jobs_strongify(self)
        self.sound = data;
        return self;
    };
}

-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTriggerWithTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.triggerWithTimeInterval = data;
        return self;
    };
}

-(__kindof JobsLocalNotificationModel *_Nonnull (^ _Nonnull)(BOOL data))byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nonnull(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

@end
