//
//  NSObject+Shake.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822
#define JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Shake)

-(void)shake;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822 */
