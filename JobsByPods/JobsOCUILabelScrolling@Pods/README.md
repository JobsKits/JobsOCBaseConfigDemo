# `JobsOCUILabelScrolling`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 定位

Pod 名是 `JobsOCUILabelScrolling`，公开能力是原生 `UILabel` 的 `UILabel+Scrolling` 分类，不要求业务继承自定义 Label。

内部 UILabel 配置统一使用 `JobsOCDSL`；关联对象 Key 和读写统一使用 `JobsOCDefs` 提供的 `JobsKey`、`Jobs_getAssociatedObject` 与 `Jobs_setAssociatedRETAIN_NONATOMIC`。`JobsLabelTextDisplayMode` 也集中定义在 `JobsOCDefs`，本 Pod 只消费，不重复声明。

`JobsLabelTextDisplayMode` 统一提供四种固定尺寸文字策略：

- `JobsLabelTextDisplayModeScaleToFit`：单行，必要时缩小字号。
- `JobsLabelTextDisplayModeSingleLineTailTruncation`：单行，尾部省略。
- `JobsLabelTextDisplayModeMultiLineTailTruncation`：多行，最后一行尾部省略。
- `JobsLabelTextDisplayModeScrolling`：单行溢出时使用 CoreText 完整滚动展示。

## 使用

```objc
#import <JobsOCUILabelScrolling/JobsOCUILabelScrolling.h>

[label byTextDisplayMode:JobsLabelTextDisplayModeSingleLineTailTruncation];

[label byTextDisplayMode:JobsLabelTextDisplayModeMultiLineTailTruncation
       minimumScaleFactor:.5f
     maximumNumberOfLines:3
      scrollConfiguration:JobsLabelScrollConfiguration.continuousConfiguration];
```

也可以直接控制滚动生命周期：

```objc
[label byTextScroll:JobsLabelScrollConfiguration.pingPongConfiguration];
[label byStartTextScroll];
[label byPauseTextScroll];
[label byResumeTextScroll];
[label byReloadTextScroll];
[label byStopTextScroll];
```

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。溢出判断使用 CoreText 排版推进宽度，防止字形裁切的光学画布扩展只参与绘制，不会把本可完整显示的短文案误判成溢出。CoreText 绘制前会按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色，因此深浅色切换后与同层普通 UILabel 保持一致。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。

<a id="jobs-architecture"></a>

## 一、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 1.1、设计目的与职责划分

为 UILabel 的长文本展示提供静态策略及连续/往返滚动，配置对象定义速度、间距、起始停留、边缘停留和刷新内核。CoreText 负责文本绘制，JobsTimer 负责按时间驱动位置。

### 1.2、运行脉络

测量文字与可用宽度 → 选择静态或滚动策略 → 按配置推进偏移 → 到边界衔接或折返 → 内容/布局变化后重配。

### 1.3、关键设计与边界

- 连续模式使用首尾衔接文字，往返模式在边缘停留，两者边界处理不同。
- 速度是每秒位移，不应由刷新次数决定；fps 是期望刷新频率。
- 减弱动态效果可保持静态文本；颜色/富文本和原 UILabel 的显示语义应一致。

### 1.4、阅读与重建顺序

先看 ScrollConfiguration 和展示模式，再看文字测量、偏移计算和停止清理，最后接入普通 Label 或表格单元。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCUILabelScrolling.h](<./JobsOCUILabelScrolling.h>)
- [Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.h](<./Core/JobsLabelScrollConfiguration/JobsLabelScrollConfiguration.h>)
- [Core/UILabel+Scrolling/UILabel+Scrolling.h](<./Core/UILabel+Scrolling/UILabel+Scrolling.h>)

依赖与编译入口：[JobsOCUILabelScrolling.podspec](<./JobsOCUILabelScrolling.podspec>)。其中显式依赖声明包括 `JobsOCTimer`、`JobsOCDSL`、`JobsOCDefs`、`JobsBlock`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。
