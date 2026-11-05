# JobsOCStabilitySupport 测试场景支持

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、源码与编译归属](#layout)
- [二、隔离场景使用与验证](#use)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

`JobsPodsStabilitySceneDelegate` 提供隔离测试所需的空白 [**UIKit**](https://developer.apple.com/documentation/uikit) Scene：只为收到的 `UIWindowScene` 创建窗口及空控制器，不初始化业务服务。

## 一、<span id="layout">源码与编译归属</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 源码直接集成于主工程 `OCBaseConfig/JobsMixFunc/JobsOCStabilitySupport/Core/JobsPodsStabilitySceneDelegate/`，同名 `.h` / `.m` 成对管理，不新增 Pod。
- [公开声明](./Core/JobsPodsStabilitySceneDelegate/JobsPodsStabilitySceneDelegate.h)与[实现](./Core/JobsPodsStabilitySceneDelegate/JobsPodsStabilitySceneDelegate.m)仅依赖 UIKit。
- `JobsOCBaseConfigDemoTests` 原生单元测试 target 编译该类；在“自动化测试 → 测试宿主支持”中可以定位。
- 主 App 不编译该类，不改变现有 `SceneDelegate` 或启动门禁。现有原生单测仍使用主 App 作为测试宿主；本支持类的存在不表示这些单测自动改用空白 Scene。

## 二、<span id="use">隔离场景使用与验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

需要独立的测试宿主时，将测试宿主的场景配置指向 `JobsPodsStabilitySceneDelegate` 并把该实现编译进宿主可加载的镜像；不要把正常 App 的场景配置改成它。该类没有业务根页面、资源加载或持久化行为。

目录调整后检查工程引用、测试 target 唯一 Sources 成员，以及主 App 编译模型中没有该类。独立语法编译只验证该类本身，不能替代主工程构建或场景运行验收。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
