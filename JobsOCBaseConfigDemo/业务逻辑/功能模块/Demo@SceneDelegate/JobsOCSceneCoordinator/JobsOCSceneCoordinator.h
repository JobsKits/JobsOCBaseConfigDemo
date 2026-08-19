//
//  JobsOCSceneCoordinator.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月30日，星期四.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const JobsOCSceneCoordinatorDidChangeNotification;
FOUNDATION_EXPORT NSString *const JobsOCSceneCoordinatorSessionIdentifierUserInfoKey;

@interface JobsOCSceneCoordinator : NSObject

+(NSString *)activityType;
+(JobsRetStrByVoidBlock _Nonnull)jobsActivityType;
+(NSUserActivity *)demoActivityWithCounter:(NSInteger)counter
                             sourceSession:(nullable UISceneSession *)sourceSession;
+(nullable NSUserActivity *)demoActivityFromConnectionOptions:(UISceneConnectionOptions *)connectionOptions
                                                       session:(UISceneSession *)session;
+(JobsRetBOOLByNSUserActivityBlock _Nonnull)isDemoActivity;
+(JobsRetNSIntegerByNSUserActivityBlock _Nonnull)restoredCounterFromActivity;
+(NSInteger)counterForSession:(UISceneSession *)session
                     fallback:(NSInteger)fallback;
+(NSUserActivity *)updateCounter:(NSInteger)counter
                        forScene:(UIWindowScene *)scene;
+(JobsRetNSArrayNSStringByUISceneSessionBlock _Nonnull)eventsForSession;
+(void)recordEvent:(NSString *)event
        forSession:(UISceneSession *)session;
+(jobsByNSSetUISceneSessionBlock _Nonnull)discardSessions;
+(JobsRetNSStringByUISceneSessionBlock _Nonnull)shortIdentifierForSession;
+(JobsRetNSStringByUISceneActivationStateBlock _Nonnull)activationStateText;
+(JobsRetUISceneSessionByUISceneSessionBlock _Nonnull)otherOpenSessionExcludingSession;
+(void)requestNewDemoSceneFromSession:(nullable UISceneSession *)sourceSession
                           completion:(void (^ _Nullable)(NSError * _Nullable error))completion;
+(void)requestActivationForSession:(UISceneSession *)session
                        completion:(void (^ _Nullable)(NSError * _Nullable error))completion;
+(void)requestDestructionForSession:(UISceneSession *)session
                         completion:(void (^ _Nullable)(NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
