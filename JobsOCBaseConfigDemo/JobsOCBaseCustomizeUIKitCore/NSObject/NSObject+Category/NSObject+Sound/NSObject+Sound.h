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
#import "UIControl+XY.h"
#import "NSString+Path.h"
#import "NSString+URL.h"
#import "NSString+Extra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Sound)
/// 播放自定义本地声音
/// fileName 文件名 包含后缀
-(jobsByStrBlock _Nonnull)playSoundWithFileName;
/// 播放自定义本地声音
/// fileName 全文件名 包含后缀
-(jobsByStrBlock _Nonnull)playSoundEffect;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_SOUND_F67E818D44 */
