//
//  NSObject+Shake.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822
#define JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Shake)

-(jobsByVoidBlock _Nonnull)shake;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SHAKE_F99879B822 */
