//
//  JobsMakeLocalNotification.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsMakeLocalNotification.h"

@interface JobsMakeLocalNotification ()

@end

@implementation JobsMakeLocalNotification
-(jobsByJobsLocalNotificationModelBlock _Nonnull)triggerLocalNotification{
    @jobs_weakify(self)
    return ^(JobsLocalNotificationModel * localNotificationModel){
        @jobs_strongify(self)
        if (!self) return;
        jobsMakeUNUserNotificationCenter(^(__kindof UNUserNotificationCenter * _Nullable center) {
            UNMutableNotificationContent *content = jobsMakeUNMutableNotificationContent(^(__kindof UNMutableNotificationContent * _Nullable content) {
                content
                    .byTitle(localNotificationModel.title)
                    .byBody(localNotificationModel.body)
                    .bySound(localNotificationModel.sound);
            });
            UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:localNotificationModel.triggerWithTimeInterval
                                                                                                            repeats:localNotificationModel.repeats];
            UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:localNotificationModel.identifier
                                                                                  content:content
                                                                                  trigger:trigger];
            [center addNotificationRequest:request
                     withCompletionHandler:^(NSError * _Nullable error) {
                if (error) {
                    JobsLog(@"Error adding notification: %@", error);
                } else {
                    JobsLog(@"Notification scheduled.");
                }
            }];
        });
    };
}

@end
