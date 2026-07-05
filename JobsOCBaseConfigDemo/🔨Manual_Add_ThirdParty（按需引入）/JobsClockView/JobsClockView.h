//
//  JobsClockView.h
//  JobsClockView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSCLOCKVIEW_7C266B2841
#define JOBS_HEADER_GUARD_JOBSCLOCKVIEW_7C266B2841

#import <UIKit/UIKit.h>

#import "JobsBaseProtocolHeader.h"

#import "JobsOCTimer.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 模拟时钟：表盘 + 1～12 数字 + 时针 / 分针 / 秒针
@interface JobsClockView : UIView
/// 开始走表（默认 GCD 内核，1s 一跳）
-(void)start;
/// 指定底层计时器内核（NSTimer / GCD / CADisplayLink）
-(jobsByNSUIntegerBlock _Nonnull)startByTimerType;
/// 停止走表
-(void)stop;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCLOCKVIEW_7C266B2841 */
