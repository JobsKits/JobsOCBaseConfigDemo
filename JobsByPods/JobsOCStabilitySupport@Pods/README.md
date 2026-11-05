# JobsOCStabilitySupport

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、目录与公开入口](#layout)
- [二、测试宿主装配](#integration)
- [三、验证入口](#validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

为隔离的 [**UIKit**](https://developer.apple.com/documentation/uikit) 稳定性测试宿主提供空白 Scene。只创建窗口和空控制器，不启动业务服务，不替代主 App 的 SceneDelegate。

## 一、<span id="layout">目录与公开入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 根入口：`JobsOCStabilitySupport.h`。
- 核心：`Core/JobsPodsStabilitySceneDelegate/JobsPodsStabilitySceneDelegate.h/.m`，提供 `UIWindowSceneDelegate` 和窗口属性。
- 仅依赖系统 UIKit，最低 iOS 13；没有 Support、资源或其它 Pod 依赖。
- `JobsPodspecKit.rb` 管理排除项及模块配置，`LICENSE` 使用 MIT。

```objc
#if __has_include(<JobsOCStabilitySupport/JobsOCStabilitySupport.h>)
#import <JobsOCStabilitySupport/JobsOCStabilitySupport.h>
#else
#import "JobsOCStabilitySupport.h"
#endif
```

## 二、<span id="integration">测试宿主装配</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`Podfile.deps` 声明本地 Pod；`Podfile` 的 `configure_jobs_stability_test_hosts` 为 `AppHost-*-Unit-Tests` 增加构建依赖和静态框架链接、框架搜索路径及 `-ObjC`，并把生成宿主 plist 的 Scene 类配置为 `JobsPodsStabilitySceneDelegate`。Scene 源码只在 Pod 内编译，不再分别加入每个宿主 Sources。Keychain 专用宿主原有权限配置保持在 `Tests/JobsPodsStabilityHost/JobsBaseUIKeychain`。

类通过 plist 名称加载，`-ObjC` 用于防止静态链接裁剪。正常业务 App 继续使用自身的 SceneDelegate。迁移项目时带齐本 Pod、依赖声明与宿主配置，不能只复制头文件。

## 三、<span id="validation">验证入口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

在项目根目录运行 `pod install --no-repo-update` 刷新 Development Pods；通过 `JobsOCStabilitySupport` scheme 构建组件，通过现有 Stability scheme 验证宿主。组件编译不能替代主 App、设备运行或全部稳定性测试验收。完整入口见[稳定性验证工具](../../ScriptsByPods/jobs_pods_stability_verify.rb/README.md)。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
