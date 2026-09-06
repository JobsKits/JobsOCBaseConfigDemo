# JobsImageRotation

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

## 定位

`JobsImageRotation` 是基于 `JobsOCTimer` 的轻量旋转 Pod。它既能绑定任意 `UIView`，也提供只输出图形的 `JobsClockIconView`；组件不接管按钮标题、外层布局或业务倒计时。

## 目录

```text
JobsImageRotation@Pods/
├── Core/
│   ├── JobsClockIconView/
│   └── JobsImageRotator/
├── JobsImageRotation.h
├── JobsImageRotation.podspec
├── JobsPodspecKit.rb
└── README.md
```

当前没有资源，不创建空 `Resource`。

## 公开能力

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

## 依赖与边界

- 直接依赖 `JobsOCTimer` 与 `JobsOCDefs`。
- 每个 tick 固定旋转 `6°`，因此 `interval` 越小旋转越快。
- `JobsClockIconViewDefaultInterval` 为 `0.1` 秒，即默认 `6` 秒完成一周。
- `JobsClockIconView` 只绘制表盘外圈、固定时针、旋转分针和中心点，不附带标题、按钮、状态文案或刻度。
- 生命周期和 UI 更新必须从主线程调用。
- `stop` 默认恢复绑定视图创建组件时的 transform。

## 验证

```shell
ruby -c JobsImageRotation.podspec
pod install --no-repo-update
xcodebuild -workspace JobsOCBaseConfigDemo.xcworkspace -scheme JobsImageRotation -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build
```

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

将图像旋转控制与时钟图标表现分开。Rotator 负责方向、节奏和旋转进程，ClockIconView 组合表盘/指针并暴露启动、暂停、恢复、停止等入口，底层节拍来自计时模块。

### 1.2、运行脉络

配置方向与间隔 → 启动旋转 → 暂停或恢复 → 停止并按选择保留/重置角度。

### 1.3、关键设计与边界

- 暂停/恢复与停止重置有不同状态语义，不能统一变成移除全部动画。
- hasStarted 与 running 分别表达历史启动和当前运行状态。
- 色彩和布局更新不应无意重新开始计时。

### 1.4、阅读与重建顺序

先看 Rotator 的状态与角度更新，再看 ClockIconView 的组合；重建时把控制状态与绘制图层分离。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsImageRotation.h](<./JobsImageRotation.h>)
- [Core/JobsClockIconView/JobsClockIconView.h](<./Core/JobsClockIconView/JobsClockIconView.h>)
- [Core/JobsImageRotator/JobsImageRotator.h](<./Core/JobsImageRotator/JobsImageRotator.h>)

依赖与编译入口：[JobsImageRotation.podspec](<./JobsImageRotation.podspec>)。其中显式依赖声明包括 `JobsOCTimer`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
