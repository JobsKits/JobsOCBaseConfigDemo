//
//  JobsTimer.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2025/11/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JobsBlock.h"
#import "TimerProtocol.h"
#import "DefineProperty.h"
#import "DefineConstString.h"

NS_ASSUME_NONNULL_BEGIN
/// 统一的 OC 版计时器实现：基于 TimerProtocol，只额外提供进度语义
@interface JobsTimer : NSObject<TimerProtocol>

-(JobsRetTimerByNSUInteger _Nonnull)byTimerType;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerStyle;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeInterval;
-(JobsRetTimerByDoubleBlock _Nonnull)byStartTime;
-(JobsRetTimerByCGFloatBlock _Nonnull)byTime;
-(JobsRetTimerByDoubleBlock _Nonnull)byTimeSecIntervalSinceDate;
-(JobsRetTimerByStringBlock _Nonnull)byRunLoopMode;
-(JobsRetTimerByUserInfo _Nonnull)byUserInfo;
-(JobsRetTimerByQueue _Nonnull)byQueue;
-(JobsRetTimerByNSUInteger _Nonnull)byTimerState;
/// 前后台感知配置（用 0/1 传值）
-(JobsRetTimerByNSUInteger _Nonnull)byPauseInBackground;    // 默认 1
-(JobsRetTimerByNSUInteger _Nonnull)byAutoManageAppState;   // 默认 1
/// 回调链式 DSL
-(JobsRetTimerByCGFloatBlocks _Nonnull)byOnTick;
-(JobsRetTimerByJTimerBlocks _Nonnull)byOnFinish;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsTimer *_Nonnull
jobsMakeTimer(JobsTimerBlock _Nonnull block){
    JobsTimer *data = JobsTimer.alloc.init;
    if (block) block(data);
    return data;
}
