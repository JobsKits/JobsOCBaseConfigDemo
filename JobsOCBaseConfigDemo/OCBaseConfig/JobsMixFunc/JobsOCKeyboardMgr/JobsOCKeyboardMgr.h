//
//  JobsOCKeyboardMgr.h
//  JobsOCKeyboardMgr
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JobsOCKeyboardMgr_h
#define JobsOCKeyboardMgr_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

#import "JobsOCKeyboardConfig.h"
#import "JobsOCKeyboardResult.h"
#import "JobsOCKeyboardCalculator.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCKeyboardMgr : NSObject

Prop_strong(nullable, readonly) __kindof JobsOCKeyboardConfig *currentConfig;
Prop_strong(nullable, readonly) __kindof JobsOCKeyboardResult *latestResult;
Prop_assign(readonly, getter=isStarted) BOOL started;

+(JobsRetIDByVoidBlock _Nonnull)shared;
+(instancetype)sharedManager;
+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager;

-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)start;
-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)stop;
-(JobsRetJobsOCKeyboardMgrByVoidBlock _Nonnull)restore;
-(JobsRetJobsOCKeyboardMgrByConfigBlock _Nonnull)byConfig;
-(jobsByIDBlock _Nonnull)clearConfigByOwner;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCKeyboardMgr
-(JobsRetJobsOCKeyboardMgrByBOOLBlock _Nonnull)byStarted;
-(JobsRetJobsOCKeyboardMgrByCGRectBlock _Nonnull)byLatestKeyboardFrameInScreen;
-(JobsRetJobsOCKeyboardMgrByConfigBlock _Nonnull)byCurrentConfig;
-(JobsRetJobsOCKeyboardMgrByJobsOCKeyboardResultBlock _Nonnull)byLatestResult;
-(JobsRetJobsOCKeyboardMgrByNSDictionaryBlock _Nonnull)byLatestKeyboardUserInfo;
-(JobsRetJobsOCKeyboardMgrByUITapGestureRecognizerBlock _Nonnull)byEndEditingTapGR;
-(JobsRetJobsOCKeyboardMgrByUIViewBlock _Nonnull)byEndEditingTapHostView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCKeyboardMgr
@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCKeyboardMgr_h */
