//
//  JobsGestureLockVC.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
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

+(JobsRetStrByStrBlock _Nonnull)gesturePasswordForKey;
+(void)saveGesturePassword:(NSString *)password forKey:(NSString *)key;
+(jobsByStrBlock _Nonnull)deleteGesturePasswordForKey;

-(instancetype)initWithMode:(JobsGestureLockMode)mode storageKey:(NSString *)storageKey;
-(instancetype)initWithMode:(JobsGestureLockMode)mode
                 storageKey:(NSString *)storageKey
              configuration:(nullable JobsGestureLockConfiguration *)configuration NS_DESIGNATED_INITIALIZER;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsGestureLockVC
-(JobsRetJobsGestureLockVCByNSIntegerBlock _Nonnull)byRemainingRetryCount;
-(JobsRetJobsGestureLockVCByNSStringBlock _Nonnull)byFirstPattern;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsGestureLockVC
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKVC_16F19CFDB1 */
