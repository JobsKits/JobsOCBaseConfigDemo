//
//  JobsCountdownButton.h
//  JobsCountdownBtn
//
//  Created by Jobs on 2026年7月2日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1
#define JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1

#import <UIKit/UIKit.h>
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsByOCPods.h"
#import "JobsOCTimer.h"
#import "JobsLanMgr.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsCountdownBtn : UIButton<TimerProtocol>

Prop_assign()NSTimeInterval jobsCountdownDuration;
Prop_copy(nullable)NSString *jobsCountdownNormalTitle;
Prop_copy(nullable)jobsByIDBlock jobsCountdownClickBlock;

+(JobsRetIDByVoidBlock _Nonnull)verificationCodeButton;
-(JobsRetIDByVoidBlock _Nonnull)jobsConfigAsVerificationCodeButton;
-(JobsRetIDByNSTimeIntervalBlock _Nonnull)byJobsCountdownDuration;
-(JobsRetIDByStrBlock _Nonnull)byJobsCountdownNormalTitle;
-(JobsRetIDByVoidIDBlocks _Nonnull)byJobsCountdownClickBlock;
-(jobsByVoidBlock _Nonnull)jobsStartCountdown;
-(jobsByVoidBlock _Nonnull)jobsResetCountdownTitle;

-(jobsByVoidBlock _Nonnull)jobsAwakeFromNib;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSCOUNTDOWNBUTTON_4D0D23E4A1 */
