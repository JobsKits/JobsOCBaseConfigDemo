# JobsOCDeviceGuard 设备安全检测

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、主工程集成与调用](#integration)
  - [1.1、宿主启动门禁与预留接口](#startup-gate)
  - [1.2、按需检测接口](#on-demand-inspection)
- [二、报告与业务策略](#verdict)
- [三、目录与依赖](#structure)
- [四、演示与验证边界](#demo-validation)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

本组件直接集成于 [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 主工程，通过文件系统、当前进程加载镜像和可选沙盒写探测生成证据报告与 `shouldRestrict` 建议。宿主已在首个业务启动步骤同步检测，命中 `isJailbroken` 时停止后续显式业务初始化，由 Scene 创建全屏原生拦截页；登录、支付或每次请求没有单独的拦截器。检测只能在应用运行后由宿主调用，无法阻止系统安装应用，也不能证明未命中设备一定安全。

## 一、<span id="integration">主工程集成与调用</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 1.1、<span id="startup-gate">宿主启动门禁与预留接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

启动协调器为 [JobsOCDeviceGuardLaunchGate](../../../入口/JobsDeviceGuardLaunch/JobsOCDeviceGuardLaunchGate/JobsOCDeviceGuardLaunchGate.h)。`AppDelegate` 的 `didFinishLaunchingWithOptions` 首个启动步骤同步只读检测：

```objc
if (JobsOCDeviceGuardLaunchGate.prepare().blocked) {
    // 返回成功以继续连接 Scene；不执行后面的显式业务初始化。
    return YES;
}
```

`SceneDelegate` 在恢复活动、创建正常根控制器或开屏之前读取同一启动判定；命中时创建当前 Scene 独立的原生拦截页并返回。后续现有生命周期、活动恢复及开屏异步回调遵守该冻结结果。首次报告和 `blocked` 为每进程一次的启动快照，检测器的其它主动调用仍会实时重检。

| 接口 | 当前职责 |
| --- | --- |
| `configurePolicy:blockedViewControllerFactory:` | 首次 `prepare()` 前在主线程配置策略和页面工厂；冻结后返回 `NO`。 |
| `prepare()` / `decision` | 同步只读检测一次，保留 `report` 和 `blocked`。 |
| `makeBlockedViewController()` | 为每个被拦 Scene 创建独立原生页面；无效或已挂接的自定义控制器回退默认页。 |

默认启动策略仅在 `report.isJailbroken` 为真时拦截，按默认阈值即 `jailbroken`。`noIndicators`、`suspicious`、`indeterminate`、`unsupported` 当前继续启动，不因此成为安全结论；未来可从配置接口调整。`shouldRestrict` 仍是更保守的通用建议值，不是当前启动策略。策略须同步纯判定且不重入 `prepare()`，页面工厂每次创建无业务初始化的新控制器。

当前门禁阻止后续显式业务启动和正常根页面创建，没有单独拦截每次登录、支付、下单或请求，不提供持续监控；也不能撤销 `didFinishLaunching` 之前系统或库加载阶段已经发生的动作。`DEBUG` 测试报告注入只用于隔离验证，不作为 Release 环境的运行开关。

### 1.2、<span id="on-demand-inspection">按需检测接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

源码位于 `OCBaseConfig/JobsMixFunc/JobsOCDeviceGuard`，由 `JobsMixFunc.h` 聚合导出。无需新增 [**CocoaPods**](https://cocoapods.org/) 依赖；所有实现文件均显式加入当前 App target 的 Sources，并登记文件同步组例外清单。

```objc
#import "JobsOCDeviceGuard.h"

JobsOCDeviceGuardConfiguration *configuration =
    JobsOCDeviceGuardConfiguration.defaultConfiguration();
[JobsOCDeviceGuardDetector detectAsyncWithConfiguration:configuration
                                            completion:^(JobsOCDeviceGuardReport *report) {
    // completion 在主线程返回；结合 report.verdict 和业务要求作决策。
    if (report.shouldRestrict) {
        // 宿主可在这里展示原因、保留重检入口。
        return;
    }
    // 宿主可在这里接入当前业务入口的执行代码。
}];
```

示例中的 `return` 只结束本次检测回调，不会取消已经发出的请求，也不会阻止其它位置的业务继续执行。宿主须把具体业务入口的执行安排在判断之后，才能对该入口形成实际限制；这些按需检测示例不执行真实业务；已接入的启动门禁由宿主协调器与 Scene 独立执行。

确有需要时，在调用检测前显式配置 `.bySandboxWriteProbeEnabled(YES)`。该操作只尝试在预设沙盒外目录独占创建随机文件，随后关闭并删除；不会覆盖现有文件，清理失败保留在报告中。默认关闭，禁止将其描述为纯只读检测。

## 二、<span id="verdict">报告与业务策略</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 结果 | 含义 |
| --- | --- |
| `NoIndicators` | 本次已执行检查未命中特征；不构成设备安全证明。 |
| `Suspicious` | 命中类别少于配置阈值，默认单类命中为可疑。 |
| `Jailbroken` | 命中类别达到阈值，默认至少两个类别。 |
| `Indeterminate` | 检查不可用或没有可执行结果，需要业务侧处理。 |
| `Unsupported` | 模拟器、Mac Catalyst 或在 Mac 上运行的 iOS App，不适用真机规则。 |

同类别的多个路径或镜像只计一个类别。`isJailbroken` 仅表示 `Jailbroken` 结果；`shouldRestrict` 是保守业务建议，不是限制执行器，返回 `YES` 本身不会阻断任何真实业务。它仅在 `NoIndicators` 时为 `NO`，可疑、不可判定和不支持均为 `YES`。调用方应读取完整结果，不将 `isJailbroken == NO` 等同于设备安全；当前启动策略仅拦截 `isJailbroken == YES`，其它结果暂继续启动。

`checks` 保留每项检查的 `Passed`、`Detected`、`Skipped` 或 `Unavailable` 状态、说明和错误码。读取受限与预期写入拒绝分别呈现；不能将检查失败解释为未越狱。检测器每次主动调用都重新检测；宿主启动协调器仅为本进程启动隔离保留一次冻结快照。

## 三、<span id="structure">目录与依赖</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCDeviceGuard/
├── JobsOCDeviceGuard.h
├── Core/
│   ├── JobsOCDeviceGuardTypes/
│   ├── JobsOCDeviceGuardConfiguration/
│   ├── JobsOCDeviceGuardCheck/
│   ├── JobsOCDeviceGuardReport/
│   └── JobsOCDeviceGuardDetector/
└── README.md
```

`Core` 全部属于公开检测能力；目前不需要 `Support` 或运行资源目录。属性宏和配置链依赖主工程既有 `JobsDefines` / `JobsBlock`，系统检查使用公开的 Foundation、Darwin 和 dyld API，不遍历其它应用进程，不使用私有 API，不主动终止应用，不上传报告。

## 四、<span id="demo-validation">演示与验证边界</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

根列表“设备安全与越狱检测”可重新检测、查看证据、显式执行写探测。“模拟敏感操作（先复检）”仅重新检测并显示允许或限制的判定文案，没有执行或拦截真实业务，也没有拦截启动、登录、支付或网络请求。

主 App 已通过 arm64 模拟器完整编译与链接，6 个实现文件进入目标，检测器、配置、证据、报告与 Demo 类符号均在最终 App 中，`JobsDeviceGuardShield` 已进入 `Assets.car`。验证采用临时工程，跳过源目录图标生成与 IPA 清理阶段，保留真实源码和依赖；这不代表签名打包、越狱真机运行或全部 Demo 交互均已验收。

工程引用可通过 `plutil -lint JobsOCBaseConfigDemo.xcodeproj/project.pbxproj` 与 `xcodeproj` 解析检查。实际越狱检出率、权限返回行为及反检测工具影响，仍需在获准的真实设备组合上验证；模拟器结果仅用于确认 `Unsupported` 分支。本地检测可被篡改或绕过，高价值服务应结合服务端风险控制；[**Apple App Attest**](https://developer.apple.com/documentation/devicecheck/establishing-your-app-s-integrity) 是独立服务端完整性流程，本组件未集成该能力。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
