# `JobsOCUILabelScrolling`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。CoreText 绘制前会按 UILabel 当前 `traitCollection` 解析动态前景色和阴影色，因此深浅色切换后与同层普通 UILabel 保持一致。

## 明暗主题契约

- 页面、列表和弹框的普通承载面使用 `JobsSystemBackgroundColor` / `JobsSecondarySystemBackgroundColor`，正文、说明和占位文字使用 `JobsLabelColor` / `JobsSecondaryLabelColor` / `JobsPlaceholderTextColor`，确保白天浅底深字、黑夜深底浅字。
- 品牌色、媒体画布、二维码、相机、视频、手写和马赛克内容保留业务色；颜色写入 `CGColor`、`CALayer`、CoreText 或自绘上下文时，需要在主题通知或 Trait 变化后重新解析和绘制。
- 验证时从 Demo 全局主题入口分别切换白天和黑夜，检查组件的背景、文字、禁用态、占位态与弹出层对比度。
