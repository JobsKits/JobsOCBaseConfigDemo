//
//  JobsCountdownButton.h
//  JobsCountdownBtn
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1
#define JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1

#import <UIKit/UIKit.h>

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

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCTimer/JobsOCTimer.h>)
#import <JobsOCTimer/JobsOCTimer.h>
#else
#import "JobsOCTimer.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCountdownBtn : UIButton<TimerProtocol>

Prop_assign()NSTimeInterval jobsCountdownDuration;
Prop_copy(nullable)NSString *jobsCountdownNormalTitle;
Prop_copy(nullable)jobsByIDBlock jobsCountdownClickBlock;

+(instancetype)verificationCodeButton;
-(instancetype)jobsConfigAsVerificationCodeButton;
-(instancetype)byJobsCountdownDuration:(NSTimeInterval)duration;
-(instancetype)byJobsCountdownNormalTitle:(NSString *)title;
-(instancetype)byJobsCountdownClickBlock:(jobsByIDBlock _Nullable)block;
-(void)jobsStartCountdown;
-(void)jobsResetCountdownTitle;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1 */
