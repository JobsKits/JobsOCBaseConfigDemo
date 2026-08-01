//
//  JobsOCSceneCoordinator.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const JobsOCSceneCoordinatorDidChangeNotification;
FOUNDATION_EXPORT NSString *const JobsOCSceneCoordinatorSessionIdentifierUserInfoKey;

@interface JobsOCSceneCoordinator : NSObject

+(NSString *)activityType;
+(NSUserActivity *)demoActivityWithCounter:(NSInteger)counter
                             sourceSession:(nullable UISceneSession *)sourceSession;
+(nullable NSUserActivity *)demoActivityFromConnectionOptions:(UISceneConnectionOptions *)connectionOptions
                                                       session:(UISceneSession *)session;
+(BOOL)isDemoActivity:(nullable NSUserActivity *)activity;
+(NSInteger)restoredCounterFromActivity:(nullable NSUserActivity *)activity;
+(NSInteger)counterForSession:(UISceneSession *)session
                     fallback:(NSInteger)fallback;
+(NSUserActivity *)updateCounter:(NSInteger)counter
                        forScene:(UIWindowScene *)scene;
+(NSArray <NSString *>*)eventsForSession:(UISceneSession *)session;
+(void)recordEvent:(NSString *)event
        forSession:(UISceneSession *)session;
+(void)discardSessions:(NSSet <UISceneSession *>*)sessions;
+(NSString *)shortIdentifierForSession:(UISceneSession *)session;
+(NSString *)activationStateText:(UISceneActivationState)state;
+(nullable UISceneSession *)otherOpenSessionExcludingSession:(UISceneSession *)session;
+(void)requestNewDemoSceneFromSession:(nullable UISceneSession *)sourceSession
                           completion:(void (^ _Nullable)(NSError * _Nullable error))completion;
+(void)requestActivationForSession:(UISceneSession *)session
                        completion:(void (^ _Nullable)(NSError * _Nullable error))completion;
+(void)requestDestructionForSession:(UISceneSession *)session
                         completion:(void (^ _Nullable)(NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
