//
//  JobsDefineTimerProtocol.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026/5/17.
//

#ifndef JobsDefineTimerProtocol_h
#define JobsDefineTimerProtocol_h

#ifndef TimerProtocol_synthesize_lock
#define TimerProtocol_synthesize_lock \
\
/* ===== 定时器配置 ===== */ \
@synthesize time = _time; \
@synthesize startTime = _startTime; \
@synthesize timeSecIntervalSinceDate = _timeSecIntervalSinceDate; \
@synthesize timeInterval = _timeInterval; \
@synthesize repeats = _repeats; \
@synthesize invocation = _invocation; \
@synthesize runLoopMode = _runLoopMode; \
@synthesize userInfo = _userInfo; \
@synthesize showTimeType = _showTimeType; \
@synthesize countdownTimerProgress = _countdownTimerProgress; \
@synthesize timerStyle = _timerStyle; \
@synthesize timerType = _timerType; \
@synthesize accumulatedElapsed = _accumulatedElapsed; \
@synthesize lastStartDate = _lastStartDate; \
/* ===== 定时器类型 ===== */ \
@synthesize nsTimer = _nsTimer; \
@synthesize gcdTimer = _gcdTimer; \
@synthesize displayLink = _displayLink; \
@synthesize queue = _queue; \
/* ===== 定时器状态 ===== */ \
@synthesize timerState = _timerState; \
@synthesize running = _running; \
@synthesize paused = _paused; \
@synthesize stop = _stop; \
@synthesize onTick = _onTick; \
@synthesize onFinish = _onFinish; \

#endif /* TimerProtocol_synthesize_lock */

#ifndef TimerProtocol_dynamic
#define TimerProtocol_dynamic \
\
/* ===== 定时器配置 ===== */ \
@dynamic time; \
@dynamic startTime; \
@dynamic timeSecIntervalSinceDate; \
@dynamic timeInterval; \
@dynamic repeats; \
@dynamic invocation; \
@dynamic runLoopMode; \
@dynamic userInfo; \
@dynamic countdownTimerProgress; \
@dynamic timerStyle; \
@dynamic timerType; \
@dynamic accumulatedElapsed; \
@dynamic lastStartDate; \
/* ===== 定时器类型 ===== */ \
@dynamic nsTimer; \
@dynamic gcdTimer; \
@dynamic displayLink; \
@dynamic queue; \
/* ===== 定时器状态 ===== */ \
@dynamic timerState; \
@dynamic running; \
@dynamic paused; \
@dynamic stop; \
@dynamic onTick; \
@dynamic onFinish; \

#endif /* TimerProtocol_dynamic */

#endif /* JobsDefineTimerProtocol_h */
