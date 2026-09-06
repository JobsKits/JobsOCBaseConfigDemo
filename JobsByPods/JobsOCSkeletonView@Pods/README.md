# `JobsOCSkeletonView`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> `JobsOCSkeletonView` 是 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的 OC 骨架屏 Pod，对齐 Swift 侧 `JobsByUIKit` 里的自研 shimmer 和 `SkeletonView` DSL，用纯 UIKit / CoreAnimation 提供扫光、脉冲和图片加载占位能力。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsOCSkeletonView` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Skeleton and shimmer placeholder view utilities for Jobs Objective-C projects. |
| podspec | `JobsByPods/JobsOCSkeletonView@Pods/JobsOCSkeletonView.podspec` |
| source | `{ :path => '.' }` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 列表、卡片、头像、标题和多行文本在网络数据返回前展示骨架占位。
- 需要 Swift 侧 `bySkeletonable`、`byShowGradientSkeleton`、`byShowSolidSkeleton`、`byHideSkeletonAndReload` 的 OC 平行写法时使用。
- 图片异步加载前需要先显示 shimmer，占位图或真实图片回来后淡入替换时使用。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsOCSkeletonView@Pods/
├── JobsOCSkeletonView.h
├── JobsOCSkeletonView.podspec
├── JobsPodspecKit.rb
├── LICENSE
├── README.md
└── Core/
    ├── JobsOCSkeletonConfig/
    │   ├── JobsOCSkeletonConfig.h
    │   └── JobsOCSkeletonConfig.m
    ├── UIView+JobsOCSkeletonView/
    │   ├── UIView+JobsOCSkeletonView.h
    │   └── UIView+JobsOCSkeletonView.m
    └── UIImageView+JobsOCSkeletonView/
        ├── UIImageView+JobsOCSkeletonView.h
        └── UIImageView+JobsOCSkeletonView.m
```

## 四、公开能力 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `JobsOCSkeletonConfig`：配置基础色、扫光色、动画时长、扫光宽度、圆角和动画类型。
- `UIView+JobsOCSkeletonView`：给任意 `UIView` 标记骨架能力、启动渐变扫光或纯色脉冲、停止骨架和刷新布局。
- `UIImageView+JobsOCSkeletonView`：给图片加载流程提供 shimmer 开始、结束和淡入替换入口。

## 五、引用方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```objc
#if __has_include(<JobsOCSkeletonView/JobsOCSkeletonView.h>)
#import <JobsOCSkeletonView/JobsOCSkeletonView.h>
#else
#import "JobsOCSkeletonView.h"
#endif
```

```objc
view.bySkeletonable(YES)
    .bySkeletonCornerRadius(JobsWidth(8))
    .byShowGradientSkeleton();
```

```objc
[imageView jobs_beginShimmerLoading];
[imageView jobs_setImage:image
                fallback:nil
           shimmerConfig:JobsOCSkeletonConfig.defaultConfig
                    fade:0.25];
```

## 六、依赖关系 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 系统框架：`Foundation`、`UIKit`、`QuartzCore`
- 本地 Pod：`JobsBlock`、`JobsOCDSL`、`JobsOCDefs`
- `UIImageView` 的图片恢复与骨架层可见性通过 `JobsOCDSL` 的 `byImage` / `byHidden` 收口，不在上层留裸 UIKit / CoreAnimation 赋值。

## 七、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```shell
ruby -c JobsOCSkeletonView.podspec
```

```shell
pod install --no-repo-update
```

- 改动 `Core`、podspec、依赖或公开头后，需要重新执行 [**CocoaPods**](https://cocoapods.org/) 集成验证。
- 当前封装走纯 UIKit / CoreAnimation，不直接暴露 `TABAnimated` 或 `Shimmer` 三方 API；如果后续要桥接 TABAnimated table skeleton，可在本 Pod 增加单独 Support 层，不污染当前公开基础 API。

<a id="jobs-architecture"></a>

## 八、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 8.1、设计目的与职责划分

以 Config 定义 shimmer/pulse 的颜色、时长、高光宽度和圆角，通过 UIView/UIImageView 分类挂载骨架效果。图层动画负责占位表现，图片视图分支还需管理原图恢复。

### 8.2、运行脉络

配置骨架样式 → 挂载占位层 → 播放呼吸/扫光 → 内容就绪时停止并移除 → 恢复真实图片或视图内容。

### 8.3、关键设计与边界

- 当前使用 UIKit/CoreAnimation，不直接对外暴露 TABAnimated 或 Shimmer API。
- 停止动画与恢复内容是两个必要动作，不能只把图层隐藏。
- 占位尺寸与原视图布局同步，主题改变后图层颜色也需要重新解析。

### 8.4、阅读与重建顺序

先看 Config，再分别看 UIView 和 UIImageView 的挂载/恢复路径；重建时先打通一次开始到清理的闭环。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [JobsOCSkeletonView.h](<./JobsOCSkeletonView.h>)
- [Core/JobsOCSkeletonConfig/JobsOCSkeletonConfig.h](<./Core/JobsOCSkeletonConfig/JobsOCSkeletonConfig.h>)
- [Core/UIImageView+JobsOCSkeletonView/UIImageView+JobsOCSkeletonView.h](<./Core/UIImageView+JobsOCSkeletonView/UIImageView+JobsOCSkeletonView.h>)
- [Core/UIView+JobsOCSkeletonView/UIView+JobsOCSkeletonView.h](<./Core/UIView+JobsOCSkeletonView/UIView+JobsOCSkeletonView.h>)

依赖与编译入口：[JobsOCSkeletonView.podspec](<./JobsOCSkeletonView.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsOCDSL`、`JobsOCDefs`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
