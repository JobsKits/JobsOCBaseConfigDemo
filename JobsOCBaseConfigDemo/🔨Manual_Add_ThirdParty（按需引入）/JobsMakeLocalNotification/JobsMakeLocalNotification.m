//
//  JobsMakeLocalNotification.m
//  JobsOCBaseConfigDemo
//
//  Created by admin on 5/26/24.
//

#import "JobsMakeLocalNotification.h"

@interface JobsMakeLocalNotification ()

@end

@implementation JobsMakeLocalNotification

- (void)triggerLocalNotification:(JobsLocalNotificationModel *)localNotificationModel{
    UNUserNotificationCenter *center = UNUserNotificationCenter.currentNotificationCenter;
    UNMutableNotificationContent *content = UNMutableNotificationContent.new;
    content.title = localNotificationModel.title;
    content.body = localNotificationModel.body;
    content.sound = localNotificationModel.sound;
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
}

@end
