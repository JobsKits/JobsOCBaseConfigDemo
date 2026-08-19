//
//  UNNotificationSound+DSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UNNOTIFICATIONSOUND_DSL
#define JOBS_HEADER_GUARD_UNNOTIFICATIONSOUND_DSL

#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface UNNotificationSound (JobsChain)

+(JobsRetNotificationSoundByVoidBlock _Nonnull)byDefaultSound;
+(JobsRetNotificationSoundByStrBlock _Nonnull)bySoundNamed;
+(JobsRetNotificationSoundByCGFloatBlock _Nonnull)byDefaultCriticalSoundWithAudioVolume API_AVAILABLE(ios(12.0));
+(JobsRetNotificationSoundByStrBlock _Nonnull)byRingtoneSoundNamed API_AVAILABLE(ios(15.0));

@end
NS_ASSUME_NONNULL_END
#endif
