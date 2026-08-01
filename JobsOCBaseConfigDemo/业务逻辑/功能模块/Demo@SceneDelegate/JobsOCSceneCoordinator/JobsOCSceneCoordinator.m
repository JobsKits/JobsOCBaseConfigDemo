//
//  JobsOCSceneCoordinator.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import "JobsOCSceneCoordinator.h"

NSString *const JobsOCSceneCoordinatorDidChangeNotification = @"JobsOCSceneCoordinatorDidChangeNotification";
NSString *const JobsOCSceneCoordinatorSessionIdentifierUserInfoKey = @"sessionIdentifier";

static NSString *const JobsOCSceneCoordinatorActivityType = @"com.jobs.scene-delegate-demo";
static NSString *const JobsOCSceneCoordinatorCounterUserInfoKey = @"counter";
static NSString *const JobsOCSceneCoordinatorSourceSessionUserInfoKey = @"sourceSessionIdentifier";

@implementation JobsOCSceneCoordinator

+(NSString *)activityType{
    return JobsOCSceneCoordinatorActivityType;
}

+(NSMutableDictionary <NSString *, NSNumber *>*)countersBySessionIdentifier{
    static NSMutableDictionary <NSString *, NSNumber *>*counters;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        counters = NSMutableDictionary.dictionary;
    });return counters;
}

+(NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*)eventsBySessionIdentifier{
    static NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*events;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        events = NSMutableDictionary.dictionary;
    });return events;
}

+(NSDateFormatter *)timeFormatter{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = NSDateFormatter.new;
        formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"];
        formatter.dateFormat = @"HH:mm:ss.SSS";
    });return formatter;
}

+(NSUserActivity *)demoActivityWithCounter:(NSInteger)counter
                             sourceSession:(UISceneSession *)sourceSession{
    NSUserActivity *activity = [NSUserActivity.alloc initWithActivityType:self.activityType];
    activity.title = @"SceneDelegate 多场景 Demo";
    activity.targetContentIdentifier = self.activityType;
    activity.userInfo = @{
        JobsOCSceneCoordinatorCounterUserInfoKey: @(counter),
        JobsOCSceneCoordinatorSourceSessionUserInfoKey: sourceSession.persistentIdentifier ?: @""
    };
    activity.eligibleForHandoff = NO;
    activity.eligibleForPrediction = NO;
    return activity;
}

+(NSUserActivity *)demoActivityFromConnectionOptions:(UISceneConnectionOptions *)connectionOptions
                                               session:(UISceneSession *)session{
    for (NSUserActivity *activity in connectionOptions.userActivities) {
        if ([self isDemoActivity:activity]) return activity;
    }
    if ([self isDemoActivity:session.stateRestorationActivity]) {
        return session.stateRestorationActivity;
    };return nil;
}

+(BOOL)isDemoActivity:(NSUserActivity *)activity{
    return [activity.activityType isEqualToString:self.activityType];
}

+(NSInteger)restoredCounterFromActivity:(NSUserActivity *)activity{
    if (![self isDemoActivity:activity]) return 0;
    return [activity.userInfo[JobsOCSceneCoordinatorCounterUserInfoKey] integerValue];
}

+(NSInteger)counterForSession:(UISceneSession *)session
                     fallback:(NSInteger)fallback{
    NSNumber *counter = [self countersBySessionIdentifier][session.persistentIdentifier];
    return counter ? counter.integerValue : fallback;
}

+(NSUserActivity *)updateCounter:(NSInteger)counter
                        forScene:(UIWindowScene *)scene{
    [self countersBySessionIdentifier][scene.session.persistentIdentifier] = @(counter);
    NSUserActivity *activity = [self demoActivityWithCounter:counter
                                              sourceSession:scene.session];
    scene.userActivity = activity;
    [self postChangeForSession:scene.session];
    return activity;
}

+(NSArray<NSString *> *)eventsForSession:(UISceneSession *)session{
    return [[self eventsBySessionIdentifier][session.persistentIdentifier] copy] ?: @[];
}

+(void)recordEvent:(NSString *)event
        forSession:(UISceneSession *)session{
    NSString *identifier = session.persistentIdentifier;
    NSMutableArray <NSString *>*events = [self eventsBySessionIdentifier][identifier];
    if (!events) {
        events = NSMutableArray.array;
        [self eventsBySessionIdentifier][identifier] = events;
    }
    NSString *time = [self.timeFormatter stringFromDate:NSDate.date];
    [events addObject:[NSString stringWithFormat:@"[%@] %@",time,event]];
    if (events.count > 30) {
        [events removeObjectsInRange:NSMakeRange(0, events.count - 30)];
    }
    [self postChangeForSession:session];
}

+(void)discardSessions:(NSSet<UISceneSession *> *)sessions{
    for (UISceneSession *session in sessions) {
        [[self countersBySessionIdentifier] removeObjectForKey:session.persistentIdentifier];
        [[self eventsBySessionIdentifier] removeObjectForKey:session.persistentIdentifier];
    }
}

+(NSString *)shortIdentifierForSession:(UISceneSession *)session{
    NSString *identifier = session.persistentIdentifier;
    return identifier.length > 8 ? [identifier substringToIndex:8] : identifier;
}

+(NSString *)activationStateText:(UISceneActivationState)state{
    switch (state) {
        /// Scene 位于前台并接收事件
        case UISceneActivationStateForegroundActive:
            return @"前台活跃";
        /// Scene 位于前台但暂不接收事件
        case UISceneActivationStateForegroundInactive:
            return @"前台非活跃";
        /// Scene 已进入后台
        case UISceneActivationStateBackground:
            return @"后台";
        /// Scene 尚未连接或已断开
        case UISceneActivationStateUnattached:
            return @"未连接";
    }
}

+(UISceneSession *)otherOpenSessionExcludingSession:(UISceneSession *)session{
    NSArray <UISceneSession *>*sessions = [UIApplication.sharedApplication.openSessions.allObjects
        sortedArrayUsingComparator:^NSComparisonResult(UISceneSession *obj1, UISceneSession *obj2) {
            return [obj1.persistentIdentifier compare:obj2.persistentIdentifier];
        }];
    for (UISceneSession *candidate in sessions) {
        if ([candidate.role isEqualToString:session.role] &&
            ![candidate.persistentIdentifier isEqualToString:session.persistentIdentifier]) {
            return candidate;
        }
    };return nil;
}

+(void)requestNewDemoSceneFromSession:(UISceneSession *)sourceSession
                           completion:(void (^)(NSError * _Nullable))completion{
    NSUserActivity *activity = [self demoActivityWithCounter:0
                                              sourceSession:sourceSession];
    if (@available(iOS 17.0, *)) {
        UISceneSessionActivationRequest *request =
            [UISceneSessionActivationRequest requestWithRole:UIWindowSceneSessionRoleApplication];
        request.userActivity = activity;
        [UIApplication.sharedApplication activateSceneSessionForRequest:request
                                                           errorHandler:completion];
    } else {
        [UIApplication.sharedApplication requestSceneSessionActivation:nil
                                                          userActivity:activity
                                                               options:nil
                                                          errorHandler:completion];
    }
}

+(void)requestActivationForSession:(UISceneSession *)session
                        completion:(void (^)(NSError * _Nullable))completion{
    if (@available(iOS 17.0, *)) {
        UISceneSessionActivationRequest *request =
            [UISceneSessionActivationRequest requestWithSession:session];
        [UIApplication.sharedApplication activateSceneSessionForRequest:request
                                                           errorHandler:completion];
    } else {
        [UIApplication.sharedApplication requestSceneSessionActivation:session
                                                          userActivity:nil
                                                               options:nil
                                                          errorHandler:completion];
    }
}

+(void)requestDestructionForSession:(UISceneSession *)session
                         completion:(void (^)(NSError * _Nullable))completion{
    [UIApplication.sharedApplication requestSceneSessionDestruction:session
                                                            options:nil
                                                       errorHandler:completion];
}

+(void)postChangeForSession:(UISceneSession *)session{
    [NSNotificationCenter.defaultCenter
        postNotificationName:JobsOCSceneCoordinatorDidChangeNotification
                      object:nil
                    userInfo:@{
                        JobsOCSceneCoordinatorSessionIdentifierUserInfoKey:
                            session.persistentIdentifier
                    }];
}

@end
