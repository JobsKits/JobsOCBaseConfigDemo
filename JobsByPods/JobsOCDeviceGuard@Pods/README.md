# `JobsOCDeviceGuard`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

<!-- jobs-toc:start -->
<!-- jobs-toc:source {"v":2,"token":"[toc]"} -->
<details>
<summary>📚 目录（点击展开 / 收起）</summary>

- [🔥 前言](#%E5%89%8D%E8%A8%80)
- [一、能力与默认行为](#capabilities)
- [二、判定与业务策略](#verdict)
- [三、集成与调用](#integration)
  - [3.1、宿主启动门禁与预留接口](#startup-gate)
  - [3.2、按需检测接口](#on-demand-inspection)
- [四、目录与验证](#structure)

</details>
<!-- jobs-toc:end -->

---

## 🔥 <span id="前言">前言</span>

> [**Objective-C**](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html) 设备安全检测组件，将可观察证据、检测完成状态和业务建议分开输出。配套 <u>[**Swift**](https://www.swift.org/)</u> 实现为 `JobsSwiftDeviceGuard`，采用同一判定口径。

组件只能在 App 已运行且宿主调用检测入口后执行，无法介入或阻止系统安装。检测核心只输出报告与 `shouldRestrict` 建议；宿主已在首个业务启动步骤接入同步门禁，命中 `isJailbroken` 后停止后续显式业务初始化，由 Scene 创建全屏原生拦截页。登录、支付或每次请求没有单独的拦截器，仍需按具体业务接入。客户端结果可能被修改、隐藏或绕过，`noIndicators` 只代表本次未发现可观察特征，不能证明设备安全。高价值业务还应结合服务端授权和 [**App Attest**](https://developer.apple.com/documentation/devicecheck/establishing-your-app-s-integrity)。

## 一、<span id="capabilities">能力与默认行为</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 检查 | 方式 | 默认 |
| --- | --- | --- |
| 文件系统 | `access(path, F_OK)` 查询传统与 `/var/jb` rootless 特征路径 | 启用 |
| 当前进程镜像 | `dyld` 枚举当前 App 加载镜像，按文件名精确匹配并忽略大小写 | 启用 |
| 沙盒写限制 | 在 `/private`、`/private/var/lib` 创建 UUID 探测文件，独占打开、权限 `0600`、关闭后立即删除 | 关闭，显式开启 |
| 运行环境 | 模拟器、Mac Catalyst、Mac 上运行的 iOS App | 返回 `unsupported`，不执行真机探测 |

每项输出 `passed`、`detected`、`skipped`、`unavailable`，保留路径、原因和 `errno`。文件查询的 `ENOENT` / `ENOTDIR` 表示本次未发现，权限拒绝和其它错误为 `unavailable`；写探测的 `EACCES` / `EPERM` / `EROFS` 表示系统正常拒绝，其它错误不能算通过。成功创建后即使清理失败，仍保留命中证据，另附清理错误和文件路径。

`access` 会跟随符号链接，悬空链接可能不可见；只看文件是否存在，不读取修改时间、大小等元数据。静态路径和镜像名不是完整越狱工具清单，可能误报或漏报。镜像注入调试工具也可能命中，单项证据不能独立确认越狱。镜像列表是当次瞬时观察，动态装载或卸载可能导致遗漏或枚举不完整，结果不提供持续监控保证。不遍历系统进程、不使用私有 API、不 `fork`、不强制退出、不自动上传日志。

## 二、<span id="verdict">判定与业务策略</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| `verdict` | 含义 | `shouldRestrict` |
| --- | --- | --- |
| `noIndicators` | 至少一项完成、无错误且未命中特征 | `NO` |
| `suspicious` | 至少一类命中，未达到阈值 | `YES` |
| `jailbroken` | 至少两个独立类别命中并达到配置阈值 | `YES` |
| `indeterminate` | 零命中但存在不可用检查，或没有执行任何检查 | `YES` |
| `unsupported` | 当前环境不适用真机规则 | `YES` |

同类别多条路径只计一类。默认阈值 `2`，可设置 `2...3`，越界值会限制在此范围；关闭写探测后配置阈值 `3` 将无法达到越狱判定，但可疑证据仍会导致 `shouldRestrict=YES`。`isJailbroken` 仅表示已达到多类别阈值，`NO` 不构成安全证明；当前启动门禁按约定仅拦截 `isJailbroken=YES`。

`shouldRestrict` 是保守的敏感业务建议，不是执行限制的组件；返回 `YES` 本身不会阻断任何真实业务，也不会自动锁住 App、退出进程或替换根控制器。本仓宿主已经接入启动门禁，使用前述 `isJailbroken` 默认策略；登录、支付或发起请求等其它具体业务入口仍需独立接入判断。宿主可按业务处理说明、重试或服务端复核；每次敏感操作前重新检测，避免使用过期结果。

## 三、<span id="integration">集成与调用</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 3.1、<span id="startup-gate">宿主启动门禁与预留接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

启动协调器为 [JobsOCDeviceGuardLaunchGate](../../JobsOCBaseConfigDemo/入口/JobsDeviceGuardLaunch/JobsOCDeviceGuardLaunchGate/JobsOCDeviceGuardLaunchGate.h)。`AppDelegate` 的 `didFinishLaunchingWithOptions` 首个启动步骤同步只读检测：

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

### 3.2、<span id="on-demand-inspection">按需检测接口</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

[**CocoaPods**](https://cocoapods.org/) 本地集成：

```ruby
pod 'JobsOCDeviceGuard', :path => './JobsByPods/JobsOCDeviceGuard@Pods'
```

组件直接依赖 `JobsBlock`（配置 DSL 类型）和 `JobsOCDefs`（属性宏），不依赖 Jobs UI 组件。`JobsBlock` 只前向声明配置类，不反向依赖此 Pod。OC 老工程使用相同源码，放在主工程 `OCBaseConfig/JobsMixFunc/JobsOCDeviceGuard`，不添加本 Pod 依赖。

调用文件头通过聚合头导入：

```objc
#if __has_include(<JobsOCDeviceGuard/JobsOCDeviceGuard.h>)
#import <JobsOCDeviceGuard/JobsOCDeviceGuard.h>
#else
#import "JobsOCDeviceGuard.h"
#endif
```

默认只读检查，异步结果固定回主线程一次：

```objc
JobsOCDeviceGuardConfiguration *configuration = JobsOCDeviceGuardConfiguration.defaultConfiguration()
    .byMinimumDetectedCategories(2)
    .bySandboxWriteProbeEnabled(NO);

[JobsOCDeviceGuardDetector detectAsyncWithConfiguration:configuration
                                           completion:^(JobsOCDeviceGuardReport *report) {
    if (report.shouldRestrict) {
        // 宿主可在这里提示原因、保留重试入口或转服务端复核。
        return;
    }
    // 宿主可在这里接入当前业务入口的执行代码。
}];
```

示例中的 `return` 只结束本次检测回调，不会取消已经发出的请求，也不会阻止其它位置的业务继续执行。只有宿主把具体业务入口的执行安排在判断之后，才能对该入口形成实际限制；这些按需检测示例不执行真实业务；已接入的启动门禁由宿主协调器与 Scene 独立执行。

同步入口为 `[JobsOCDeviceGuardDetector detectWithConfiguration:configuration]`，每次调用实时执行，不缓存检测结果；配置在检测开始前复制，提交后修改原配置不影响在途任务。若确需写探测，显式使用 `.bySandboxWriteProbeEnabled(YES)`。

根列表“设备安全与越狱检测”提供只读重检、显式写探测和“模拟敏感操作（先复检）”三个演示入口，可滚动查看完整报告。“模拟敏感操作”仅重新检测并显示允许或限制的判定文案，没有执行或拦截真实业务。图标使用 App 打包的本地 `JobsDeviceGuardShield` 资源，来源说明由主工程资源目录维护。

## 四、<span id="structure">目录与验证</span> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCDeviceGuard@Pods/
├── Core/
│   ├── JobsOCDeviceGuardTypes/
│   ├── JobsOCDeviceGuardConfiguration/
│   ├── JobsOCDeviceGuardCheck/
│   ├── JobsOCDeviceGuardReport/
│   └── JobsOCDeviceGuardDetector/
├── Tests/
├── JobsOCDeviceGuard.h
├── JobsOCDeviceGuard.podspec
├── JobsPodspecKit.rb
├── LICENSE
└── README.md
```

`Stability` 测试覆盖独立类别去重、组合阈值、失败与空结果、unsupported 优先级、配置复制及主线程回调。已通过 7 项真实模拟器测试、组件的 iPhoneOS / 模拟器 SDK 编译，以及宿主 App 的 arm64 模拟器编译与链接；`JobsDeviceGuardShield` 已进入最终 `Assets.car`。运行模拟器测试只能确认环境分支和判定逻辑；正常真机、越狱真机、反检测环境与写探测的实际表现仍需分别验收。服务端完整性验证需宿主单独集成。

参考 [**OWASP MASTG 越狱检测**](https://mas.owasp.org/MASTG/knowledge/ios/MASVS-RESILIENCE/MASTG-KNOW-0084/) 和 [**Apple 平台运行安全**](https://support.apple.com/guide/security/security-of-runtime-process-sec15bfe098e/web)。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
