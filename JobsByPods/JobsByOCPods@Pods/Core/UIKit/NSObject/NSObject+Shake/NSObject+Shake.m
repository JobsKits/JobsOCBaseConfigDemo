//
//  NSObject+Shake.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Shake.h"

@implementation NSObject (Shake)
-(jobsByVoidBlock _Nonnull)shake{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
    //    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];   // 设置播放时屏幕常亮
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  //震动
    };
}

@end
