//
//  NSObject+UNUserNotificationCenterDelegate.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+UNUserNotificationCenterDelegate.h"

@implementation NSObject (UNUserNotificationCenterDelegate)
#pragma mark —— 一些私有方法
-(jobsByNotificationResponseBlock _Nonnull)handleCalendarCategoryAction{
    return ^(UNNotificationResponse *_Nullable response){
        if (response.actionIdentifier.isEqualToString(@"markAsCompleted")) {
            return;
        } else if (response.actionIdentifier.isEqualToString(@"remindMeIn1Minute")) {
            // 1 Minute
            NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:60];
            self.scheduleNotificationAt(newDate);
            JobsLog(@"1 Minute");
        } else if (response.actionIdentifier.isEqualToString(@"remindMeIn5Minutes")) {
            NSDate *newDate = [NSDate.alloc initWithTimeIntervalSinceNow:60 * 5];
            self.scheduleNotificationAt(newDate);
            JobsLog(@"5 Minutes");
        }
    };
}

-(jobsByNotificationResponseBlock _Nonnull)handleCustomUICategory{
    return ^(UNNotificationResponse *_Nullable response){
        if (response.actionIdentifier.isEqualToString(@"stop")){
            return;
        } else if (response.actionIdentifier.isEqualToString(@"comment")){
            NSString *text = ((UNTextInputNotificationResponse *)response).userText;
            if (isValue(text)) {
                jobsGetMainWindow().rootViewController.comingToPresentVC(self.makeAlertControllerByAlertModel(jobsMakeAlertModel(^(JobsAlertModel * _Nullable data) {
                    data.byAlertControllerTitle(@"Comment".jobsTr());
                    data.message = @"You just said".jobsTr()
                        .add(@":")
                        .add(text.jobsTr());
                    data.byPreferredStyle(UIAlertControllerStyleAlert)
                        .byAlertActionTitle(@"OK".jobsTr())
                        .byAlertActionStyle(UIAlertActionStyleDefault);
                    data.alertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
                        JobsLog(@"OK");
                    };
            //        data.cancelAlertActionTitle = @"取消";
            //        data.cancelAlertActionStyle = UIAlertActionStyleCancel;
            //        data.cancelAlertActionBlock = ^(__kindof UIAlertAction * _Nullable action) {
            //            JobsLog(@"Cancel");
            //        };
                })));
            }
        }else{}
    };
}

-(jobsByDateBlock _Nonnull)scheduleNotificationAt{
    return ^(NSDate *_Nullable date){
        NSCalendar *calendar = NSCalendar.initBy(NSCalendarIdentifierChinese);
        NSDateComponents *components = [calendar componentsInTimeZone:NSTimeZone.localTimeZone
                                                             fromDate:date];
        UNNotificationRequest.initBy(jobsMakeUNNotificationRequestModel(^(UNNotificationRequestModel * _Nullable data) {
            data.byIdentifier(@"calendar")
                .byContent(jobsMakeUNMutableNotificationContent(^(__kindof UNMutableNotificationContent * _Nullable content) {
                content.byTitle(@"Calendar Reminder".jobsTr())
                    .byBody(@"github.com/pro648")
                    .bySound(UNNotificationSound.defaultSound)
                    .byCategoryIdentifier(@"calendarCategory".jobsTr());
            }))
                .byTrigger(UNCalendarNotificationTrigger.initByNORepeats(jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
                dateComponents.byCalendar(calendar)
                    .byTimeZone(NSTimeZone.localTimeZone)
                    .byMonth(components.month)
                    .byDay(components.day)
                    .byHour(components.hour)
                    .byMinute(components.minute);
            })));
        })).notificationRequestCompletionHandlerBy(^(NSError * _Nullable error){
            if (error) {
                JobsLog(@"Failed to add request to notification center. error:\(error)");
            }
        });
    };
}
#pragma mark —— UNUserNotificationCenterDelegate
// If your app is in the foreground when a notification arrives, the shared user notification center calls this method to deliver the notificaiton directly to your app.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(jobsByUNNotificationPresentationOptionsBlock)completionHandler {
    if (notification.request.identifier.isEqualToString(@"calendar")) {
        completionHandler(UNNotificationPresentationOptionNone);
    } else {
        completionHandler(UNNotificationPresentationOptionSound |
                          UNNotificationPresentationOptionList |
                          UNNotificationPresentationOptionBanner);
    }
}
// Use this method to process the user's response to a notification.
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(jobsByVoidBlock)completionHandler {
    if (response.actionIdentifier.isEqualToString(UNNotificationDefaultActionIdentifier)) {
        JobsLog(@"Default Action");
    } else if (response.actionIdentifier.isEqualToString(UNNotificationDismissActionIdentifier)) {
        JobsLog(@"Dismiss Action");
    } else if (response.notification.request.content.categoryIdentifier.isEqualToString(@"calendarCategory")) {
        self.handleCalendarCategoryAction(response);
    } else if (response.notification.request.content.categoryIdentifier.isEqualToString(@"customUICategory")) {
        self.handleCustomUICategory(response);
    }else{}
    UIApplication.sharedApplication.byApplicationIconBadgeNumber(0);
    if(completionHandler) completionHandler();
}

@end
