# <span id="前言">JobsImageRotation</span>

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 一、定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

`JobsImageRotation` 是基于 `JobsOCTimer` 的轻量旋转 Pod。它既能绑定任意 `UIView`，也提供只输出图形的 `JobsClockIconView`；组件不接管按钮标题、外层布局或业务倒计时。

## 二、目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsImageRotation@Pods/
├── Core/  # 公开入口与核心实现，4 个文件
│   ├── JobsClockIconView/
│   └── JobsImageRotator/
├── JobsImageRotation.h
├── JobsImageRotation.podspec
├── JobsPodspecKit.rb
├── README.md
└── Tests/  # 独立回归，2 个文件
```

当前没有资源，不创建空 `Resource`。

## 三、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsImageRotationDirectionClockwise` 与 `JobsImageRotationDirectionCounterclockwise`，默认顺时针。
- `JobsImageRotationDefaultInterval`：默认 `1.0 / 60.0` 秒。
- `direction`：运行中可切换方向。
- `interval`：Timer tick 间隔；修改后在下一次 `start` 时生效。
- `start` / `pause` / `resume` / `stop` / `stopAndReset:`：统一生命周期。
- `JobsClockIconView`：无数字、无刻度，时针固定，仅分针每 tick 前进 `6°`；默认顺时针，方向和间隔由外界传入。

```objc
JobsImageRotator *rotator =
    [[JobsImageRotator alloc] initWithTargetView:button.imageView
                                      direction:JobsImageRotationDirectionCounterclockwise
                                       interval:1.0 / 60.0];
[rotator start];
```

```objc
JobsClockIconView *clockIcon =
    [[JobsClockIconView alloc] initWithDirection:JobsImageRotationDirectionCounterclockwise
                                        interval:JobsClockIconViewDefaultInterval];
[clockIcon start];
```

## 四、依赖与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 直接依赖 `JobsOCTimer` 与 `JobsOCDefs`。
- 每个 tick 固定旋转 `6°`，因此 `interval` 越小旋转越快。
- `JobsClockIconViewDefaultInterval` 为 `0.1` 秒，即默认 `6` 秒完成一周。
- `JobsClockIconView` 只绘制表盘外圈、固定时针、旋转分针和中心点，不附带标题、按钮、状态文案或刻度。
- 生命周期和 UI 更新必须从主线程调用。
- `stop` 默认恢复绑定视图创建组件时的 transform。

## 五、验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsImageRotation.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsImageRotation -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 六、架构脉络与关键设计 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 6.1、设计目的与职责划分 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

将图像旋转控制与时钟图标表现分开。Rotator 负责方向、节奏和旋转进程，ClockIconView 组合表盘/指针并暴露启动、暂停、恢复、停止等入口，底层节拍来自计时模块。

### 6.2、运行脉络 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

配置方向与间隔 → 启动旋转 → 暂停或恢复 → 停止并按选择保留/重置角度。

### 6.3、关键设计与边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 暂停/恢复与停止重置有不同状态语义，不能统一变成移除全部动画。
- hasStarted 与 running 分别表达历史启动和当前运行状态。
- 色彩和布局更新不应无意重新开始计时。

### 6.4、阅读与重建顺序 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

先看 Rotator 的状态与角度更新，再看 ClockIconView 的组合；重建时把控制状态与绘制图层分离。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsImageRotation.h](<./JobsImageRotation.h>)
- [Core/JobsClockIconView/JobsClockIconView.h](<./Core/JobsClockIconView/JobsClockIconView.h>)
- [Core/JobsImageRotator/JobsImageRotator.h](<./Core/JobsImageRotator/JobsImageRotator.h>)

依赖与编译入口：[JobsImageRotation.podspec](<./JobsImageRotation.podspec>)。其中根级依赖声明包括 `JobsOCTimer`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

## 七、弱目标与计时回调 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

旋转目标保持 weak；目标不存在时不创建任务，运行期间目标释放则停止任务。停止并重置时先验证目标存活，再调用目标的 transform DSL；晚到的 tick 在 rotator 释放后结束。间隔已有有限正数校验，未通过时使用 1/60 秒。

回归测试位于 `Tests/JobsImageRotationStabilityTests/`。在包含该 Pod 的 XCTest 宿主中运行，覆盖以上生命周期和边界合同；源码编译通过不能替代这些行为断言。

## 八、目录计数与安装边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

计数递归扫描当前目录内的普通文件，排除 `.DS_Store` / `._*`；源码与头文件计入 `.h`、`.m`、`.mm`、`.c`、`.cc`、`.cpp`、`.hpp`、`.swift`。资源目录中的目录、资源编译结果和文件大小不计入文件数，文件存在不代表必然打包。

| 目录 | 实际文件 | 源码 / 头文件 | 安装边界 |
| --- | --- | --- | --- |
| `Core/` | 4 | 4 | 公共入口与核心实现；公开 / 私有头由 podspec 指定 |
| `Support/`（无目录） | 0 | 0 | 仅供当前 Pod 内部实现，按实际 subspec / private header 映射 |
| `Resource/`（无目录） | 0 | 0 | 非代码资源；按 resources / resource_bundles 和排除规则安装 |
| `Tests/` | 2 | 2 | 只由独立测试目标或回归 harness 使用，不进入生产 source_files |

`Core` 的物理目录不等于所有头文件均公开；`Support` 和测试 fixture 不作为 App 或其它 Pod 的稳定消费入口。根聚合头与 `public_header_files` 是外部引用依据。

## 九、本轮单元验证 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

当前结果：**Debug / Release 单 Pod 编译、Debug Stability 回归已完成；整体验收记录见根 [JobsByPods升级实施与编译验证.md](<../../JobsByPods升级实施与编译验证.md>)**。生产源码、测试源码、资源与工程配置的指纹一致且命令真实退出成功，才可复用对应验证记录。

生产行为与边界按上述核心契约验收；逐 Pod 编译与独立行为回归分别记录结果。

从本 README 所在目录回到工程根目录，再运行该 Pod 的 Debug / Release 单元编译：

```shell
cd ../..
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase pods --pod JobsImageRotation
```

当前 podspec 显式提供 `Stability` test_spec。`Tests/` 与测试 fixture 只进入测试目标；真实行为断言通过后再回填结果。指定可用模拟器 UDID：

```shell
ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb \
  --phase tests --pod JobsImageRotation --simulator '<UDID>'
```

运行前应已安装工程依赖；runner 的 `--phase pods` 默认分别编译 Debug / Release，`--phase tests` 默认运行 Debug（JobsOCSnowflake 默认 Debug / Release），并将命令、源码指纹、日志和退出码保存到工程 `work/JobsPodsStability/`。如需固定输出目录，使用 runner 的 `--output`。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
