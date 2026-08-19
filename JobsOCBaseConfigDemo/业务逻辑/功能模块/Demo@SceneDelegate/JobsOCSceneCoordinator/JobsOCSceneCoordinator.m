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

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UISceneSessionActivationRequest
@interface UISceneSessionActivationRequest (JobsLocalPropertyDSLAutogen_732544b7d9)
-(JobsRetUISceneSessionActivationRequestByNSUserActivityBlock _Nonnull)byUserActivity;
-(void)setUserActivity:(NSUserActivity * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END UISceneSessionActivationRequest

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN UIWindowScene
@interface UIWindowScene (JobsLocalPropertyDSLAutogen_732544b7d9)
-(JobsRetUIWindowSceneByNSUserActivityBlock _Nonnull)byUserActivity;
-(void)setUserActivity:(NSUserActivity * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END UIWindowScene

@implementation JobsOCSceneCoordinator

+(NSString *)activityType{
    return (((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCSceneCoordinator.class, @selector(jobsActivityType)))(self, @selector(jobsActivityType)))();
}

+(JobsRetStrByVoidBlock _Nonnull)jobsActivityType{
    return ^NSString *{
        return JobsOCSceneCoordinatorActivityType;
    };
}

+(JobsRetNSMutableDictionaryNSStringNSNumberByVoidBlock _Nonnull)countersBySessionIdentifier{
    return ^NSMutableDictionary <NSString *, NSNumber *>*{
        static NSMutableDictionary <NSString *, NSNumber *>*counters;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            counters = NSMutableDictionary.dictionary;
        });return counters;
    };
}

+(JobsRetNSMutableDictionaryNSStringNSMutableArrayNSStringByVoidBlock _Nonnull)eventsBySessionIdentifier{
    return ^NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*{
        static NSMutableDictionary <NSString *, NSMutableArray <NSString *>*>*events;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            events = NSMutableDictionary.dictionary;
        });return events;
    };
}

+(NSDateFormatter *)timeFormatter{
    return (((JobsRetDateFormatterByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsOCSceneCoordinator.class, @selector(jobsTimeFormatter)))(self, @selector(jobsTimeFormatter)))();
}

+(JobsRetDateFormatterByVoidBlock _Nonnull)jobsTimeFormatter{
    return ^NSDateFormatter *{
        static NSDateFormatter *formatter;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            formatter = jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable dateFormatter) {
                dateFormatter
                    .byLocale([NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"])
                    .byDateFormat(@"HH:mm:ss.SSS");
            });
        });return formatter;
    };
}

+(NSUserActivity *)demoActivityWithCounter:(NSInteger)counter
                             sourceSession:(UISceneSession *)sourceSession{
    return NSUserActivity
        .initByActivityType(self.jobsActivityType())
        .byTitle(@"SceneDelegate 多场景 Demo")
        .byTargetContentIdentifier(self.jobsActivityType())
        .byUserInfo(@{
            JobsOCSceneCoordinatorCounterUserInfoKey: @(counter),
            JobsOCSceneCoordinatorSourceSessionUserInfoKey: sourceSession.persistentIdentifier ?: @""
        })
        .byEligibleForHandoff(NO)
        .byEligibleForPrediction(NO);
}

+(NSUserActivity *)demoActivityFromConnectionOptions:(UISceneConnectionOptions *)connectionOptions
                                             session:(UISceneSession *)session{
    for (NSUserActivity *activity in connectionOptions.userActivities) {
        if (self.isDemoActivity(activity)) return activity;
    }
    if (self.isDemoActivity(session.stateRestorationActivity)) {
        return session.stateRestorationActivity;
    };return nil;
}

+(JobsRetBOOLByNSUserActivityBlock _Nonnull)isDemoActivity{
    return ^BOOL(NSUserActivity * activity){
        return [activity.activityType isEqualToString:self.jobsActivityType()];
    };
}

+(JobsRetNSIntegerByNSUserActivityBlock _Nonnull)restoredCounterFromActivity{
    return ^NSInteger(NSUserActivity * activity){
        if (!self.isDemoActivity(activity)) return 0;
        return [activity.userInfo[JobsOCSceneCoordinatorCounterUserInfoKey] integerValue];
    };
}

+(NSInteger)counterForSession:(UISceneSession *)session
                     fallback:(NSInteger)fallback{
    NSNumber *counter = self.countersBySessionIdentifier()[session.persistentIdentifier];
    return counter ? counter.integerValue : fallback;
}

+(NSUserActivity *)updateCounter:(NSInteger)counter
                        forScene:(UIWindowScene *)scene{
    self.countersBySessionIdentifier()[scene.session.persistentIdentifier] = @(counter);
    NSUserActivity *activity = [self demoActivityWithCounter:counter
                                              sourceSession:scene.session];
    scene.byUserActivity(activity);
    self.postChangeForSession(scene.session);
    return activity;
}

+(JobsRetNSArrayNSStringByUISceneSessionBlock _Nonnull)eventsForSession{
    return ^NSArray<NSString *> *(UISceneSession * session){
        return [self.eventsBySessionIdentifier()[session.persistentIdentifier] copy] ?: @[];
    };
}

+(void)recordEvent:(NSString *)event
        forSession:(UISceneSession *)session{
    NSString *identifier = session.persistentIdentifier;
    NSMutableArray <NSString *>*events = self.eventsBySessionIdentifier()[identifier];
    if (!events) {
        events = NSMutableArray.array;
        self.eventsBySessionIdentifier()[identifier] = events;
    }
    NSString *time = [self.jobsTimeFormatter() stringFromDate:NSDate.date];
    [events addObject:[NSString stringWithFormat:@"[%@] %@",time,event]];
    if (events.count > 30) {
        [events removeObjectsInRange:NSMakeRange(0, events.count - 30)];
    }
    self.postChangeForSession(session);
}

+(jobsByNSSetUISceneSessionBlock _Nonnull)discardSessions{
    return ^(NSSet<UISceneSession *> * sessions){
        for (UISceneSession *session in sessions) {
            [self.countersBySessionIdentifier() removeObjectForKey:session.persistentIdentifier];
            [self.eventsBySessionIdentifier() removeObjectForKey:session.persistentIdentifier];
        }
    };
}

+(JobsRetNSStringByUISceneSessionBlock _Nonnull)shortIdentifierForSession{
    return ^NSString *(UISceneSession * session){
        NSString *identifier = session.persistentIdentifier;
        return identifier.length > 8 ? [identifier substringToIndex:8] : identifier;
    };
}

+(JobsRetNSStringByUISceneActivationStateBlock _Nonnull)activationStateText{
    return ^NSString *(UISceneActivationState state){
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
    };
}

+(JobsRetUISceneSessionByUISceneSessionBlock _Nonnull)otherOpenSessionExcludingSession{
    return ^UISceneSession *(UISceneSession * session){
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
    };
}

+(void)requestNewDemoSceneFromSession:(UISceneSession *)sourceSession
                           completion:(void (^)(NSError * _Nullable))completion{
    NSUserActivity *activity = [self demoActivityWithCounter:0
                                              sourceSession:sourceSession];
    if (@available(iOS 17.0, *)) {
        UISceneSessionActivationRequest *request =
            [UISceneSessionActivationRequest requestWithRole:UIWindowSceneSessionRoleApplication];
        request.byUserActivity(activity);
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

+(jobsByUISceneSessionBlock _Nonnull)postChangeForSession{
    return ^(UISceneSession * session){
        [NSNotificationCenter.defaultCenter
            postNotificationName:JobsOCSceneCoordinatorDidChangeNotification
                          object:nil
                        userInfo:@{
                            JobsOCSceneCoordinatorSessionIdentifierUserInfoKey:
                                session.persistentIdentifier
                        }];
    };
}

@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UISceneSessionActivationRequest
@implementation UISceneSessionActivationRequest (JobsLocalPropertyDSLAutogen_732544b7d9)
-(JobsRetUISceneSessionActivationRequestByNSUserActivityBlock _Nonnull)byUserActivity{
    @jobs_weakify(self)
    return ^__kindof UISceneSessionActivationRequest * _Nullable(NSUserActivity * _Nullable data){
        @jobs_strongify(self)
        [self setUserActivity:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UISceneSessionActivationRequest

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UIWindowScene
@implementation UIWindowScene (JobsLocalPropertyDSLAutogen_732544b7d9)
-(JobsRetUIWindowSceneByNSUserActivityBlock _Nonnull)byUserActivity{
    @jobs_weakify(self)
    return ^__kindof UIWindowScene * _Nullable(NSUserActivity * _Nullable data){
        @jobs_strongify(self)
        [self setUserActivity:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UIWindowScene
