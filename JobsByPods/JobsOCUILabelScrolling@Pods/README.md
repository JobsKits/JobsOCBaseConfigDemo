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

滚动仅在单行内容真实溢出时运行；短文本、多行文本以及开启“减弱动态效果”的默认场景保持 UILabel 原生绘制。
