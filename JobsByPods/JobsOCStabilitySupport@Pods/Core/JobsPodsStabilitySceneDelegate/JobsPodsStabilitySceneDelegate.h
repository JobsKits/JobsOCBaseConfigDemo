//
//  JobsPodsStabilitySceneDelegate.h
//  JobsPodsStabilityHost
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <UIKit/UIKit.h>

// 用途：声明 Pods 稳定性测试宿主的空白 Scene，只提供 UIKit 窗口，不初始化业务服务。
// 运行：由 Podfile 配置到 AppHost-*-Unit-Tests 测试宿主，随对应 Stability 测试启动；主 App 不使用。

@interface JobsPodsStabilitySceneDelegate : UIResponder <UIWindowSceneDelegate>
@property(nonatomic, strong) UIWindow *window;
@end
