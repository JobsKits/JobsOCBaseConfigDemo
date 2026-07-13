//
//  JobsOCKeyboardMgr.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardMgr_h
#define JobsOCKeyboardMgr_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

#import <JobsOCKeyboardMgr/JobsOCKeyboardConfig.h>
#import <JobsOCKeyboardMgr/JobsOCKeyboardResult.h>
#import <JobsOCKeyboardMgr/JobsOCKeyboardCalculator.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCKeyboardMgr : NSObject

Prop_strong(nullable, readonly) __kindof JobsOCKeyboardConfig *currentConfig;
Prop_strong(nullable, readonly) __kindof JobsOCKeyboardResult *latestResult;
Prop_assign(readonly, getter=isStarted) BOOL started;

+(instancetype)shared;
+(instancetype)sharedManager;

-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)start;
-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)stop;
-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)restore;
-(JobsRetJobsOCKeyboardMgrByConfigBlock _Nonnull)byConfig;
-(void)clearConfigByOwner:(id _Nullable)owner;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardMgr_h */
