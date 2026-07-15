//
//  UNNotificationRequest+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UNNotificationRequest+Extra.h"

@implementation UNNotificationRequest (Extra)
+(JobsRetUNNotificationRequestByModelBlock)initBy{
    return ^__kindof UNNotificationRequest *_Nullable(UNNotificationRequestModel *_Nullable data){
        return [UNNotificationRequest requestWithIdentifier:data.identifier
                                                    content:data.content
                                                    trigger:data.trigger];
    };
}

-(jobsByErrBlocks _Nonnull)notificationRequestCompletionHandlerBy{
    @jobs_weakify(self)
    return ^(jobsByErrBlock _Nullable block){
        @jobs_strongify(self)
        [UNUserNotificationCenter.currentNotificationCenter addNotificationRequest:self
                                                             withCompletionHandler:block];
    };
}

@end
