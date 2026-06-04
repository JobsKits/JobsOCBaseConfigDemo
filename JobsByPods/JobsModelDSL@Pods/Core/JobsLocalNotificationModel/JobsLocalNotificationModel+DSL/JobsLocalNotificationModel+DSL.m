//
//  JobsLocalNotificationModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsLocalNotificationModel+DSL.h"

@implementation JobsLocalNotificationModel (DSL)

-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byIdentifier{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.identifier = data;
        return self;
    };
}

-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byTitle{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.title = data;
        return self;
    };
}

-(JobsRetJobsLocalNotificationModelByStrBlock _Nonnull)byBody{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.body = data;
        return self;
    };
}

-(JobsRetJobsLocalNotificationModelByUNNotificationSoundPointerBlock _Nonnull)bySound{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(UNNotificationSound * _Nullable data) {
        @jobs_strongify(self)
        self.sound = data;
        return self;
    };
}

-(JobsRetJobsLocalNotificationModelByTimeIntervalBlock _Nonnull)byTriggerWithTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.triggerWithTimeInterval = data;
        return self;
    };
}

-(JobsRetJobsLocalNotificationModelByBOOLBlock _Nonnull)byRepeats{
    @jobs_weakify(self)
    return ^__kindof JobsLocalNotificationModel *_Nullable(BOOL data) {
        @jobs_strongify(self)
        self.repeats = data;
        return self;
    };
}

@end
