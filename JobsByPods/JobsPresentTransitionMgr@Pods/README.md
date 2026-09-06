# `JobsPresentTransitionMgr`

<iframe
  src="https://dragonir.github.io/3d/#/earth"
  title="Jobs出品，必属精品"
  width="100%"
  height="400"
  style="border:0; display:block;"
  allowfullscreen>
</iframe>

[toc]

> 中文架构入口：[架构脉络与关键设计](#jobs-architecture)。

---

## 🔥 <font id=前言>前言</font> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

> 这份自述用于记录 `JobsPresentTransitionMgr` 在 Jobs 本地 [**CocoaPods**](https://cocoapods.org/) 体系里的职责边界、目录结构、依赖关系和验证方式。

## 一、Pod 定位 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

| 项目 | 内容 |
| ---- | ---- |
| Pod 名称 | `JobsPresentTransitionMgr` |
| Pod 类型 | 自建本地 Pod |
| 版本 | `1.0.0` |
| 平台 | `ios 12.0` |
| 摘要 | Custom present transition manager for Jobs projects. |
| podspec | `JobsByPods/JobsPresentTransitionMgr@Pods/JobsPresentTransitionMgr.podspec` |

## 二、适用场景 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- 通过 `UIModalPresentationCustom` 呈现任意 `UIViewController`。
- 支持 `JobsTransitionDirectionTop / Bottom / Left / Right` 四方向进入，并从同方向退出。
- 外部只需要传入待呈现 VC；动画时间、方向、推出比例都有默认值。
- 默认值：`direction = JobsTransitionDirectionBottom`、`time = 0.35`、`presentedRatio = 0.5`。

## 三、目录结构 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

```text
JobsPresentTransitionMgr@Pods/
├── JobsPresentTransitionMgr.podspec
├── JobsPresentTransitionMgrHeader.h
├── README.md
├── JobsPodspecKit.rb
├── Core/
│   ├── JobsPresentTransitionMgr/
│   └── UIViewController+JobsPresentTransition/
└── LICENSE
```

## 四、公开能力与依赖 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

### 4.1、公开头文件

- `JobsPresentTransitionMgrHeader.h`
- `Core/**/*.h`

### 4.2、核心 API

```objc
[self jobs_presentViewController:vc
                       configure:^(__kindof JobsPresentTransitionMgr * _Nullable manager) {
    manager.direction = JobsTransitionDirectionBottom;
    manager.time = 0.35;
    manager.presentedRatio = 0.5;
} completion:nil];
```

### 4.3、Pod 依赖

- `JobsBlock`
- `JobsMakes`
- `JobsOCDefs`
- `JobsOCDSL`

## 五、验证方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

修改 `JobsPresentTransitionMgr` 后，优先按风险从低到高验证：

```shell
ruby -c JobsPresentTransitionMgr.podspec
```

```shell
pod install --no-repo-update
```

- 修改 `Podfile.deps` 后需要重新执行 `pod install --no-repo-update` 才会进入 `Pods.xcodeproj`。
- 若未执行 `pod install`，`Podfile.lock`、`Pods/` 和 `PodspecDependencyReport` 仍可能保留旧状态。

## 六、风险说明 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> <a href="#🔚" style="font-size:17px; color:green;"><b>🔽</b></a>

- `transitioningDelegate` 是弱引用，`JobsPresentTransitionMgr` 会关联到 presented VC，保证 present 生命周期内不提前释放。
- `presentedRatio` 对上下方向表示高度比例，对左右方向表示宽度比例。
- 如果外部没有设置比例，但 presented VC 已设置 `preferredContentSize` 或兼容字段 `presentUpHeight`，会优先按内容尺寸换算比例。

<a id="jobs-architecture"></a>

## 七、架构脉络与关键设计

本节用于用中文快速理解组件，并为按框架重建提供入口；关注职责、运行关系和关键边界，不要求逐行复刻。

### 7.1、设计目的与职责划分

基于 UIPresentationController 管理方向式模态展示，配置动画时间、占屏比例、遮罩和圆角，并提供 UIViewController 便捷入口。管理器关联到 presented VC 保持展示期间存活。

### 7.2、运行脉络

确定宿主与 presented VC → 计算目标尺寸/方向 → 创建遮罩与展示转场 → 处理拖动或关闭 → 恢复容器。

### 7.3、关键设计与边界

- presentedRatio 在上下方向表示高度比例，在左右方向表示宽度比例。
- 未显式给比例时可从 preferredContentSize 或兼容字段推导，尺寸优先级需要保留。
- 交互中的 frame 与普通布局不同，取消和完成应分别恢复到正确状态。

### 7.4、阅读与重建顺序

先看 present 入口与尺寸解析，再看遮罩、交互 frame 和结束清理；不要与导航 push/pop 管理器混用。

源码定位（路径以本 README 所在目录为基准；只带走 README 时，可把文件名作为职责定位线索）：

- [Core/JobsPresentTransitionMgr/JobsPresentTransitionMgr.h](<./Core/JobsPresentTransitionMgr/JobsPresentTransitionMgr.h>)
- [Core/UIViewController+JobsPresentTransition/UIViewController+JobsPresentTransition.h](<./Core/UIViewController+JobsPresentTransition/UIViewController+JobsPresentTransition.h>)
- [JobsPresentTransitionMgrHeader.h](<./JobsPresentTransitionMgrHeader.h>)

依赖与编译入口：[JobsPresentTransitionMgr.podspec](<./JobsPresentTransitionMgr.podspec>)。其中显式依赖声明包括 `JobsBlock`、`JobsMakes`、`JobsOCDefs`、`JobsOCDSL`。源码范围、资源及可选 subspec 以这里的声明为准；辅助脚本动态补充的依赖不在上述摘录中展开。

<a id="🔚" href="#前言" style="font-size:17px; color:green; font-weight:bold;">我是有底线的➤点我回到首页</a>
