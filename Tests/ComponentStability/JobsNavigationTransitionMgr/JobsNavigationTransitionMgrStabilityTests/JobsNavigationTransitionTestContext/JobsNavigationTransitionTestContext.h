//
//  JobsNavigationTransitionTestContext.h
//  JobsNavigationTransitionMgr
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsNavigationTransitionMgrStabilityTests.h"

// 用途：声明测试替身（fixture）；实现可控转场上下文，记录完成结果并模拟容器尺寸与取消状态。
// 运行：由 JobsNavigationTransitionMgr-Unit-Stability 测试用例创建，不单独运行；不进入主 App，也不代表真实设备或外网验收。

@interface JobsNavigationTransitionTestContext : NSObject<UIViewControllerContextTransitioning>

Prop_strong()UIView *containerView;
Prop_strong()UIViewController *fromController;
Prop_strong()UIViewController *toController;
Prop_assign()BOOL transitionWasCancelled;
Prop_assign()BOOL completed;
Prop_assign()BOOL completionValue;
Prop_copy(nullable)jobsByVoidBlock onCompletion;

@end
