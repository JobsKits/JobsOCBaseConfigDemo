//
//  NSObject+Sound.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_SOUND_F67E818D44
#define JOBS_HEADER_GUARD_NSOBJECT_SOUND_F67E818D44

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import <JobsByOCPods/UIControl+XY.h>
#import <JobsByOCPods/NSString+Path.h>
#import <JobsByOCPods/NSString+URL.h>
#import <JobsByOCPods/NSString+Extra.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Sound)
/// 播放自定义本地声音
/// fileName 文件名 包含后缀
-(jobsByStrBlock)playSoundWithFileName;
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStrBlock)playSoundEffect;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SOUND_F67E818D44 */
