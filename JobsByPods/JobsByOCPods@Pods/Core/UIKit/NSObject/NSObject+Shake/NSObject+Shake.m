//
//  NSObject+Shake.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Shake.h"

@implementation NSObject (Shake)
-(void)shake{
//    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];   // 设置播放时屏幕常亮
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);  //震动
}

@end
