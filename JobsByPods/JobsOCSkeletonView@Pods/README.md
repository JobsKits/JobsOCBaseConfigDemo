# `JobsOCSkeletonView`

![Jobs出品，必属精品](https://picsum.photos/1500/400)

[toc]

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

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
