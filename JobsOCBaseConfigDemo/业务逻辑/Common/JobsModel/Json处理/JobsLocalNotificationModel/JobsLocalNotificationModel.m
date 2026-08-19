//
//  JobsLocalNotificationModel.m
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsLocalNotificationModel.h"

#import "JobsLanMgr.h"

@implementation JobsLocalNotificationModel
-(NSString *)identifier{
    if (!_identifier) {
        _identifier = @"DemoNotification";
    };return _identifier;
}

-(NSString *)title{
    if (!_title) {
        _title = @"本地通知".jobsTr();
    };return _title;
}

-(NSString *)body{
    if (!_body) {
        _body = @"这是一个示例本地通知".jobsTr();
    };return _body;
}

-(UNNotificationSound *)sound{
    if (!_sound) {
        _sound = UNNotificationSound.defaultSound;
    };return _sound;
}

-(NSTimeInterval)triggerWithTimeInterval{
    if (_triggerWithTimeInterval <= 0) {
        _triggerWithTimeInterval = 1;
    };return _triggerWithTimeInterval;
}

@end
