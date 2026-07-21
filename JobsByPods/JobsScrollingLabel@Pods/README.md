# `JobsScrollingLabel`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsScrollingLabel` 是面向原生 `UILabel` 的单行长文本滚动模块。文字由 CoreText 完整排版并交给 `CALayer` 绘制，位移由 `JobsOCTimer` 驱动；只有内容真实溢出时才进入滚动管线。

## 一、能力边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsLabelScrollModeContinuous`：两份文字首尾衔接，形成连续跑马灯。
- `JobsLabelScrollModePingPong`：文字在左右边界间往返，到边界后按配置停留。
- 支持普通文本、富文本、不同字体、颜色和 Emoji。
- 短文本、多行文本、减弱动态效果场景保持 `UILabel` 原生绘制。
- 文案、字体、颜色或尺寸变化后可主动重建，不修改文案本身。

## 二、接入 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```ruby
pod 'JobsScrollingLabel', :path => './JobsByPods/JobsScrollingLabel@Pods'
```

```objc
#import <JobsScrollingLabel/JobsScrollingLabel.h>

JobsLabelScrollConfiguration *configuration = JobsLabelScrollConfiguration.continuousConfiguration;
configuration.speed = 36;
configuration.spacing = 40;

[label byTextScroll:configuration];
[label byStartTextScroll];
```

左右往返模式：

```objc
JobsLabelScrollConfiguration *configuration = JobsLabelScrollConfiguration.pingPongConfiguration;
configuration.edgePause = 0.8;
[label byTextScroll:configuration];
[label byStartTextScroll];
```

## 三、生命周期与动态文案 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
[label byPauseTextScroll];
[label byResumeTextScroll];

label.text = @"切换后的新文案";
[label byReloadTextScroll];

[label byStopTextScroll];
```

`byStopTextScroll` 会移除 CoreText 图层并恢复 `UILabel` 的真实原文。隐藏滚动期间，模块使用带内部标记的透明富文本占位，并把真实普通文本、富文本、字体和颜色独立保存；因此外部直接切换 `text` 或 `attributedText` 后不会把透明占位误当成新数据。

## 四、实现结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsScrollingLabel@Pods/
├── Core/
│   ├── JobsLabelScrollConfiguration/
│   └── UILabel+JobsScrollingLabel/
├── Support/
│   ├── JobsCoreTextScrollLayer/
│   └── JobsLabelScrollController/
├── JobsScrollingLabel.h
├── JobsScrollingLabel.podspec
└── JobsPodspecKit.rb
```

公开 API 只包含配置对象和 `UILabel` 分类；CoreText 图层与状态控制器保持为 Pod 私有实现。

## 五、验证要点 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

1. 连续模式循环处没有明显跳变。
2. 往返模式准确触边、停留并折返。
3. 点击 Demo 的“切换文案”后两个长文本 Label 都有内容并继续滚动。
4. 富文本字体、颜色、Emoji 保持不变。
5. 短文本不创建持续运行的计时器。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
