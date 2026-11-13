# ARKit 空间实验室

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、可以体验什么](#features)
- [二、打开与操作](#usage)
- [三、如何理解这些 API](#concepts)
- [四、源码与验证边界](#source)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

[**ARKit**](https://developer.apple.com/documentation/arkit) 是 [**Apple**](https://www.apple.com/) 官方增强现实框架，随系统 SDK 提供，支持 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 与 [**Swift**](https://www.swift.org/)，无需安装第三方 AR 库。本 Demo 把框架说明和实际空间操作放在同一页，适合边读边实验。

## 一、<span id="features">可以体验什么</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 功能 | 观察与操作 |
| --- | --- |
| 框架介绍 | 页面说明 ARKit、ARSession、世界追踪、平面、射线检测、锚点和渲染器的职责。 |
| 真实空间 | 支持的 iPhone / iPad 上授权相机，缓慢移动设备识别水平面，点击检测到的表面放置物体。 |
| 3D 模型 | 方块、球体与由几何体组成的机器人；可切换模型、旋转及缩放。 |
| 会话状态 | 区分初始化、追踪受限、未命中平面、中断、失败及设备不支持，并提供重试。 |
| 清空与重置 | 清空移除已放置物体；重新扫描重建追踪与平面，不把旧坐标当作新会话坐标。 |
| 离线预览 | 不支持 AR 的设备及模拟器可以操作本地 3D 场景；明确标注没有真实空间追踪。 |
| 外观与语言 | 沿用宿主白天 / 黑夜 / 跟随系统；语言只在 App 设置中统一切换，页面自动跟随全局选择，支持简体中文、繁体中文、藏文、英文、日文、法文、西班牙文、德文、俄罗斯文、韩文。 |

模型由代码构建，没有远程图片、外部模型下载或素材许可依赖。相机画面和空间坐标只用于本地会话；本 Demo 不上传相机图像、不接业务服务器，断网仍可打开说明与预览。

## 二、<span id="usage">打开与操作</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 在 Demo 根列表搜索 `ARKit`，进入“ARKit 空间实验室”。
- 先阅读页面中的框架介绍和操作说明；选真实 AR 时，按系统提示允许相机访问。
- 在明亮环境中对准有纹理的桌面或地面，缓慢移动设备；纯色、反光或过暗的表面通常难以检测。
- 出现平面后点击视口放置模型，再切换模型、调整大小或旋转，移动手机观察物体与现实空间的位置关系。
- 没有物体时，页面显示放置指引；权限被拒绝时可去系统设置开启，再返回重试。
- 模拟器使用离线预览操作模型。预览中的地面和物体均为程序化场景，不代表 ARKit 检测结果。
- 离开页面或 App 进入后台时停止会话；返回后通过页面状态确认是否需要重新扫描。

真实 AR 需要当前设备的 `ARWorldTrackingConfiguration.isSupported` 检查通过。项目不把 ARKit 加入整个 App 的强制硬件能力要求，不能使用 AR 的设备仍可阅读教程与预览。已有相机权限用途说明由宿主提供。

## 三、<span id="concepts">如何理解这些 API</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| API / 框架 | 本例职责 |
| --- | --- |
| `ARSession` | 管理相机、运动追踪与环境分析的会话。 |
| `ARWorldTrackingConfiguration` | 开启六自由度世界追踪和水平面检测；高级能力应分别检查硬件支持。 |
| `ARPlaneAnchor` | 表示检测到的真实平面，并随扫描更新范围。 |
| `raycastQuery` / `raycast` | 把屏幕触点投向已检测的水平面，得到三维放置位置；未命中时继续扫描。 |
| `ARAnchor` | 把放置位置交给会话管理，渲染节点跟随该锚点。 |
| [**SceneKit**](https://developer.apple.com/documentation/scenekit) / `ARSCNView` | 显示相机背景、平面与 3D 几何体，便于 OC / Swift 对照教学。 |
| [**RealityKit**](https://developer.apple.com/documentation/realitykit) | 苹果面向新 AR / 空间应用推荐的现代 3D 框架，本例没有实现第二套渲染器。 |

SceneKit 已进入维护状态，并在 Xcode 26 起 soft deprecated；苹果建议新项目评估迁移 RealityKit，参见[官方说明](https://developer.apple.com/videos/play/wwdc2025/288/)。选择 SceneKit 是为了保留 OC 与 Swift 同一条可对照的教学路径，不表示 ARKit 已弃用。图像识别、人脸追踪、人体追踪、LiDAR 网格、遮挡、共享世界地图及持久化均不在本例实现范围。

## 四、<span id="source">源码与验证边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 文件 | 职责 |
| --- | --- |
| [JobsARKitDemoVC](./JobsARKitDemoVC/JobsARKitDemoVC.m) | 页面、说明、控件与生命周期。 |
| [JobsARKitScene](./JobsARKitScene/JobsARKitScene.m) | AR 会话、平面、锚点与 SceneKit 预览。 |
| [JobsARKitText](./JobsARKitText/JobsARKitText.m) | 十语言文案装载。 |
| [JobsARKit.json](./Resource/JobsARKit.json) | 本地十语言教学与状态文案。 |

三个工程分别维护自己的入口、资源和 target，OC 新旧采用相同 Demo 实现，旧工程直接编入主工程，不新增 Pod。README 仅供阅读，不进入 App 资源复制阶段。

OC 的 `UIView+DSL` 提供 `byAccessibilityElement(...)` 和 `byAccessibilityValue(...)`，用于把实际场景计数、角度和缩放状态暴露给辅助功能；页面状态与模型操作使用同一份真实数据。

已完成三工程 arm64 模拟器构建、模型添加 / 清空 / 缩放 / 旋转、语言和主题切换的实际操作及截图核验。模拟器只验证页面、模型预览与交互；相机授权、真实平面识别、锚点稳定性及中断恢复的最终效果尚未进行实体设备验收。

- [ARKit 官方概览](https://developer.apple.com/documentation/arkit)
- [设备支持与权限](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
- [世界追踪配置](https://developer.apple.com/documentation/arkit/arworldtrackingconfiguration)
- [平面检测与可视化](https://developer.apple.com/documentation/arkit/tracking-and-visualizing-planes)

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
