# `JobsFuseAnimation`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

---

## 🔥 <font id=前言>前言</font>

> `JobsFuseAnimation` 是 OC 版本地 Pod，对齐 Swift 项目里的 `JobsFuseAnimation`：给 `UIView` 提供长按导火索外圈、按压放大和系统音反馈。

## 一、功能说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 外圈使用 `CAShapeLayer` 画在视图自身 `bounds` 内侧，`masksToBounds` 场景仍可见。
- 增长阶段由 `CADisplayLink` 驱动，松手后按当前进度退潮到 0，再短暂淡出移除。
- `JobsFuseOuterRingConfig` 提供链式配置入口。
- `byFuseTapScale` 提供点击后先放大再回弹的按钮反馈动画。
- 当前 Pod 不依赖 Jobs 其它本地 Pod，方便同时接入新旧 OC 项目。

## 二、接入示例 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#import <JobsFuseAnimation/JobsFuseAnimation.h>

JobsFuseOuterRingConfig *config = JobsFuseOuterRingConfig.config
    .byLineWidth(4)
    .byStrokeColor(UIColor.whiteColor)
    .byTrackColor([UIColor.whiteColor colorWithAlphaComponent:0.22])
    .byGrowDuration(1.2)
    .byRepeatsWhileHolding(NO);

[button byFusePressStart:config scale:1.18];
[button byFusePressStop:YES];
[button byFusePlaySystemSound:1104];
```

## 三、目录边界 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsFuseAnimation.h`：公开聚合头。
- `Core/JobsFuseAnimation/JobsFuseOuterRingConfig.*`：外圈动画配置对象。
- `Core/JobsFuseAnimation/UIView+JobsFuseAnimation.*`：`UIView` 动画分类。
- `JobsPodspecKit.rb`：本地 podspec 基座。

## 四、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsFuseAnimation.podspec
```

```shell
pod install --no-repo-update
```

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
