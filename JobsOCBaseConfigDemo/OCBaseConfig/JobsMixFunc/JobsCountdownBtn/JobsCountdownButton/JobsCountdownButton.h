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
