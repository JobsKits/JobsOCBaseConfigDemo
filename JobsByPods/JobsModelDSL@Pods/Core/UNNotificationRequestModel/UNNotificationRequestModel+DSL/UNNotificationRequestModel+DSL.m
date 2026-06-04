//
//  UNNotificationRequestModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "UNNotificationRequestModel+DSL.h"

@implementation UNNotificationRequestModel (DSL)

-(JobsRetUNNotificationRequestModelByStrBlock _Nonnull)byIdentifier{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.identifier = data;
        return self;
    };
}

-(JobsRetUNNotificationRequestModelByUNNotificationContentPointerBlock _Nonnull)byContent{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nullable(UNNotificationContent * _Nullable data) {
        @jobs_strongify(self)
        self.content = data;
        return self;
    };
}

-(JobsRetUNNotificationRequestModelByUNNotificationTriggerPointerBlock _Nonnull)byTrigger{
    @jobs_weakify(self)
    return ^__kindof UNNotificationRequestModel *_Nullable(UNNotificationTrigger * _Nullable data) {
        @jobs_strongify(self)
        self.trigger = data;
        return self;
    };
}
@end
