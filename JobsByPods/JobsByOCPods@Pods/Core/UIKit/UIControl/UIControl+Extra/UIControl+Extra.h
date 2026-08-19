//
//  UIControl+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICONTROL_EXTRA_34C1B4504F
#define JOBS_HEADER_GUARD_UICONTROL_EXTRA_34C1B4504F

#import <UIKit/UIKit.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

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

@interface UIControl (Extra)
/// 基础：为一个或多个事件绑定回调（同一事件再次绑定会覆盖旧回调）
-(instancetype)jobs_on:(UIControlEvents)events
                 block:(jobsByCtrlBlock _Nonnull)block;
/// 节流：间隔 seconds 内只执行一次（适合重复点击/拖动频繁场景）
-(instancetype)jobs_on:(UIControlEvents)events
              throttle:(NSTimeInterval)seconds
                 block:(jobsByCtrlBlock _Nonnull)block;
/// 防抖：停止触发后等待 seconds 再执行（适合搜索框等输入联想）
-(instancetype)jobs_on:(UIControlEvents)events
              debounce:(NSTimeInterval)seconds
                 block:(jobsByCtrlBlock _Nonnull)block;
/// 只执行一次：触发后即自动解绑
-(instancetype)jobs_once:(UIControlEvents)events
                   block:(jobsByCtrlBlock _Nonnull)block;
/// 便捷：点击（.touchUpInside）
-(JobsRetIDByjobsByCtrlBlockBlock _Nonnull)jobs_onTap;
/// 便捷：值变化（.valueChanged）
-(JobsRetIDByjobsByCtrlBlockBlock _Nonnull)jobs_onChange;
/// 触发事件（等价于 sendActionsForControlEvents:）
-(jobsByUIControlEventsBlock _Nonnull)jobs_fire;
/// 移除指定事件的回调（支持复合事件位掩码）
-(jobsByUIControlEventsBlock _Nonnull)jobs_removeHandlersFor;
/// 移除全部回调
-(jobsByVoidBlock _Nonnull)jobs_removeAllHandlers;

-(JobsRetControlByBOOLBlock _Nonnull)byEnabled;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICONTROL_EXTRA_34C1B4504F */
