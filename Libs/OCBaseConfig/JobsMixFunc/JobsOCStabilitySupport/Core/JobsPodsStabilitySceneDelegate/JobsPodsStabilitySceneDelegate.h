//
//  JobsPodsStabilitySceneDelegate.h
//  JobsOCStabilitySupport
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import <UIKit/UIKit.h>

// 用途：声明 Pods 稳定性测试宿主的空白 Scene，只提供 UIKit 窗口，不初始化业务服务。
// 运行：由原生单元测试 target 编译，供隔离测试场景复用；主 App 不使用。

@interface JobsPodsStabilitySceneDelegate : UIResponder <UIWindowSceneDelegate>
@property(nonatomic, strong) UIWindow *window;
@end
