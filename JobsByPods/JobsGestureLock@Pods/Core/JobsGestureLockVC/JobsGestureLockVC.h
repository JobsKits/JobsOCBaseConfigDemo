//
//  JobsGestureLockVC.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1

#import <UIKit/UIKit.h>
#import <JobsGestureLock/JobsGestureLockConfiguration.h>
#import <JobsGestureLock/JobsGestureLockView.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#else
#import "JobsBaseUI.h"
#import "UIButton+SimplyMake.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockVC : BaseViewController <JobsGestureLockViewDelegate>

Prop_strong(readonly)JobsGestureLockConfiguration *configuration;
Prop_copy(readonly)NSString *storageKey;
Prop_copy(nullable)void (^completionHandler)(BOOL success, NSString * _Nullable pattern);
Prop_copy(nullable)void (^forgotPasswordHandler)(void);
Prop_copy(nullable)void (^otherAccountHandler)(void);

+(nullable NSString *)gesturePasswordForKey:(NSString *)key;
+(void)saveGesturePassword:(NSString *)password forKey:(NSString *)key;
+(void)deleteGesturePasswordForKey:(NSString *)key;

-(instancetype)initWithMode:(JobsGestureLockMode)mode storageKey:(NSString *)storageKey;
-(instancetype)initWithMode:(JobsGestureLockMode)mode
                 storageKey:(NSString *)storageKey
              configuration:(nullable JobsGestureLockConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1 */
