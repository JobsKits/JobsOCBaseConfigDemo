//
//  NSObject+Shake.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/8/21.
//  Copyright © 2020 Jobs. All rights reserved.
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
