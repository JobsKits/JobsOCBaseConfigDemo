# JobsProgressBar

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

`JobsProgressBar` 是 OC 侧自定义进度条组件，用来对齐 Swift Demo 里的“自定义进度条（进度值 + 前进方向）”能力。

## 功能

- 支持左到右、右到左、上到下、下到上四种前进方向。
- 支持进度值正向显示和倒向显示。
- 支持顶部 / 底部进度值标签。
- 支持进度条拖动、滑块样式和自动进度。

## 接入

```ruby
pod 'JobsProgressBar', :path => './JobsByPods/JobsProgressBar@Pods'
```

内部 UI 统一通过 `JobsMakes` 创建，并由 `JobsOCDSL` 完成属性、事件与装配；Pod 直接依赖 `JobsBlock`、`JobsMakes`、`JobsOCDSL` 和 `JobsOCDefs`。

## 使用

```objc
JobsProgressBar *progressBar = JobsProgressBar.alloc.init;
progressBar.byDirection(JobsProgressBarDirectionLeftToRight)
           .byValueMode(JobsProgressBarValueModeCountUp)
           .byProgressTintColor(RGBA_COLOR(0, 0.78 * 255.0, 0.32 * 255.0, 1))
           .byTrackTintColor(UIColor.lightGrayColor)
           .byTrackThickness(12)
           .byProgressLabelPlacement(JobsProgressBarLabelPlacementTop)
           .byDraggable(YES)
           .byOnProgressChanged(^(CGFloat progress) {
               JobsLog(@"progress = %.2f",progress);
           });

[progressBar setDisplayPercent:35 animated:NO duration:0];
```

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

以进度状态驱动轨道、填充、滑块和标签，支持四个方向、正向/倒向显示、拖动及自动推进。真实进度与显示百分比之间有转换层。

### 1.2、运行脉络

设置方向/显示规则 → 输入进度或拖动位置 → 换算显示值和几何位置 → 更新标签 → 自动推进或外部重配。

### 1.3、关键设计与边界

- 方向改变与数值倒向是两个独立维度。
- 自动推进与外部设置可能竞争，autoStopOnExternalChange 用于表达外部接管策略。
- 进度条显示不能当作后台任务已经完成，真实进度应由业务提供。

### 1.4、阅读与重建顺序

先看 progress/displayPercent 的映射，再看四方向布局与拖动，最后核对自动推进的停止路径。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsProgressBar/JobsProgressBar/JobsProgressBar.h](<./Core/JobsProgressBar/JobsProgressBar/JobsProgressBar.h>)
- [JobsProgressBarHeader.h](<./JobsProgressBarHeader.h>)

依赖与编译入口：[JobsProgressBar.podspec](<./JobsProgressBar.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsMakes`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
