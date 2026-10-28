//
//  JobsOCDeviceGuardLaunchGate.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年10月27日，星期二.
//

#import <UIKit/UIKit.h>
#import "JobsOCDeviceGuardLaunchDecision.h"
#import "JobsOCDeviceGuardBlockedVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCDeviceGuardLaunchGate : NSObject

/// 启动前在主线程配置；prepare后冻结，修改返回NO。自定义factory每次必须创建新控制器。
+(BOOL)configurePolicy:(nullable JobsRetBOOLByJobsOCDeviceGuardReportBlock)policy
blockedViewControllerFactory:(nullable JobsRetUIViewControllerByJobsOCDeviceGuardReportBlock)factory;
/// AppDelegate首行同步调用；后续Scene读取同一不可变判定，不重复检测。
+(JobsRetJobsOCDeviceGuardLaunchDecisionByVoidBlock _Nonnull)prepare;
Prop_strong(class,readonly)JobsOCDeviceGuardLaunchDecision *decision;
/// 每个被拦Scene获取独立的纯UI控制器。
+(JobsRetVCByVoidBlock _Nonnull)makeBlockedViewController;

#if DEBUG
/// 仅供测试构造报告；启动前主线程设置，冻结后失败，不读取环境开关。
+(JobsRetBOOLByJobsRetJobsOCDeviceGuardReportByVoidBlock _Nonnull)configureReportProviderForTesting;
#endif

@end

NS_ASSUME_NONNULL_END
