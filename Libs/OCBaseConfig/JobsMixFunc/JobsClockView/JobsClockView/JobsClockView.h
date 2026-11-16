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

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN
/// 模拟时钟：表盘 + 1～12 数字 + 时针 / 分针 / 秒针
@interface JobsClockView : UIView

/// 开始走表（默认 GCD 内核，1s 一跳）
-(jobsByVoidBlock _Nonnull)start;
/// 指定底层计时器内核（NSTimer / GCD / CADisplayLink）
-(jobsByNSUIntegerBlock _Nonnull)startByTimerType;
/// 停止走表
-(jobsByVoidBlock _Nonnull)jobsStop;
/// 兼容旧主工程直接发送停止消息的调用。
-(void)stop;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsClockView
-(JobsRetJobsClockViewByCALayerBlock _Nonnull)byHourHand;
-(JobsRetJobsClockViewByCALayerBlock _Nonnull)byMinuteHand;
-(JobsRetJobsClockViewByCALayerBlock _Nonnull)bySecondHand;
-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byCenterDotLayer;
-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byDialLayer;
-(JobsRetJobsClockViewByCAShapeLayerBlock _Nonnull)byTickLayer;
-(JobsRetJobsClockViewByNSArrayUILabelBlock _Nonnull)byNumberLabels;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsClockView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCLOCKVIEW_7C266B2841 */
